import 'package:flutter/material.dart';

class ImageCarouselLayout extends StatefulWidget {
  final List<String> images;

  const ImageCarouselLayout({
    super.key,
    required this.images,
  });

  @override
  ImageCarouselLayoutState createState() => ImageCarouselLayoutState();
}

class ImageCarouselLayoutState extends State<ImageCarouselLayout> {
  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      if (_currentIndex < widget.images.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 500,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.images[_currentIndex],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey,
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: _previousImage,
                ),
              ),
              Positioned(
                right: 16,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: _nextImage,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 80),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.cover,
                        width: 100,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
