import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class MultiSelectDropdown extends StatefulWidget {
  final String heading;
  final List<String> items;
  final List<Color>? colors;
  final bool showAllOption;
  final bool showColors;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectDropdown({
    super.key,
    required this.heading,
    required this.items,
    required this.onSelectionChanged,
    this.colors,
    this.showAllOption = true,
    this.showColors = true,
  });

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  bool _isOpen = false;
  List<String> _selectedItems = [];
  int _hoveredIndex = -1;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _showOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _toggleSelection(String item, bool? isSelected) {
    setState(() {
      if (isSelected ?? false) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      widget.onSelectionChanged(_selectedItems);
    });
    _overlayEntry?.markNeedsBuild();
  }

  void _toggleAll(bool? isSelected) {
    setState(() {
      _selectedItems = (isSelected ?? false) ? List.from(widget.items) : [];
      widget.onSelectionChanged(_selectedItems);
    });
    _overlayEntry?.markNeedsBuild();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _isOpen = false;
                _removeOverlay();
              });
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 55),
            child: Material(
              elevation: 4,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.showAllOption)
                      _buildOption('All', Colors.transparent, true, 0),
                    ...List.generate(
                      widget.items.length,
                      (index) => _buildOption(
                        widget.items[index],
                        widget.colors?[index] ?? Colors.transparent,
                        false,
                        index + 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _toggleDropdown,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _selectedItems.isEmpty
                              ? 'Select type'
                              : _selectedItems.join(', '),
                          style: TextStyle(
                            fontFamily:
                                customTypography.button1Medium.fontFamily,
                            fontSize: customTypography.button1Medium.fontSize,
                            fontWeight:
                                customTypography.button1Medium.fontWeight,
                            letterSpacing: 0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(_isOpen
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String item, Color color, bool isSelectAll, int index) {
    bool isSelected = isSelectAll
        ? _selectedItems.length == widget.items.length
        : _selectedItems.contains(item);

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = -1;
        });
      },
      child: Container(
        color: _isHovered(index) ? Colors.grey[300] : Colors.transparent,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          title: Row(
            children: [
              if (!isSelectAll && widget.showColors)
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
              if (!isSelectAll && widget.showColors) const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: customTypography.button1Medium.fontFamily,
                    fontSize: customTypography.button1Medium.fontSize,
                    fontWeight: customTypography.button1Medium.fontWeight,
                    letterSpacing: 0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: StatefulBuilder(
            builder: (context, setState) => Checkbox(
              value: isSelected,
              onChanged: (selected) {
                if (isSelectAll) {
                  _toggleAll(selected);
                } else {
                  _toggleSelection(item, selected);
                }
              },
            ),
          ),
          onTap: () {
            if (isSelectAll) {
              _toggleAll(!isSelected);
            } else {
              _toggleSelection(item, !isSelected);
            }
          },
        ),
      ),
    );
  }

  bool _isHovered(int index) {
    return _hoveredIndex == index;
  }
}
