import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/channels.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';

class ExpandableChannelCard extends StatefulWidget {
  final String title;
  final List<Channel> channels;
  const ExpandableChannelCard({
    super.key,
    required this.title,
    required this.channels,
  });

  @override
  State<ExpandableChannelCard> createState() => _ExpandableChannelCardState();
}

class _ExpandableChannelCardState extends State<ExpandableChannelCard> {
  String? selectedChannel;

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            // left: 24,
            // right: 20,
            ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            hoverColor: Colors.transparent,
          ),
          child: ExpansionTile(
            collapsedBackgroundColor: Colors.transparent,
            expansionAnimationStyle: AnimationStyle(
              duration: const Duration(milliseconds: 400),
            ),
            shape: Border.all(style: BorderStyle.none),
            title: Text(
              widget.title,
              style: TextStyle(
                fontFamily: customTypography.body2Medium.fontFamily,
                fontSize: customTypography.body2Medium.fontSize,
                fontWeight: customTypography.body2Medium.fontWeight,
              ),
            ),
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Column(
                      children: widget.channels.map((channel) {
                        final isSelected = selectedChannel == channel.channel;
                  
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Channels(
                            channel: channel.channel,
                            icon: channel.icon,
                            isSelected: isSelected,
                            onClick: () {
                              setState(() {
                                selectedChannel = channel.channel;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
