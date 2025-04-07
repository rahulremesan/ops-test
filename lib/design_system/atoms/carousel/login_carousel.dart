import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class LoginCarousel extends StatefulWidget {
  final List<String>? contentTitles;
  final List<String>? contentSubtitles;
  final List<String>? imagePaths;
  final Color? activeColor;
  final Color? inactiveColor;

  const LoginCarousel({
    super.key,
    this.contentTitles,
    this.contentSubtitles,
    this.imagePaths,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  State<LoginCarousel> createState() => _LoginCarouselState();
}

class _LoginCarouselState extends State<LoginCarousel> {
  late CarouselSliderController innerCarouselController;
  int currentIndex = 0;

  // Define screen width breakpoints
  final double desktopBreakpoint = 1080.0;
  final double tabletBreakpoint = 786.0;

  @override
  void initState() {
    innerCarouselController = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imagePaths = widget.imagePaths ??
        [
          'assets/logo/carousel_dummy.svg',
          'assets/logo/carousel_dummy.svg',
          'assets/logo/carousel_dummy.svg',
        ];

    final contentTitles = widget.contentTitles ??
        [
          'Daily Email Notifications: Create custom email notifications based',
          'Stay updated with the latest trends',
          'Join the community of creators',
        ];

    final contentSubtitles = widget.contentSubtitles ??
        [
          'on the triggers that are most important to your goals',
          'Get insights into the latest trends.',
          'Connect with people just like you.',
        ];

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < tabletBreakpoint;

    // Define SVG height based on screen size
    double svgHeight;
    if (screenWidth >= desktopBreakpoint) {
      svgHeight = 324; // For 1080p and larger screens
    } else if (screenWidth >= tabletBreakpoint) {
      svgHeight = 270; // For tablets between 786 and 1080p
    } else {
      svgHeight = 200; // For mobile devices less than 786px
    }

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: isMobile ? 600 : 700,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Slider
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 640),
              child: CarouselSlider(
                carouselController: innerCarouselController,
                items: imagePaths.map((path) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: isMobile
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: svgHeight,
                            child: SvgPicture.asset(
                              path,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: isMobile ? 20 : 20,
                              top: isMobile ? 20 : 80,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  contentTitles[currentIndex],
                                  textAlign: TextAlign.center,
                                  style: isMobile
                                      ? customTypography.title1Bold
                                          .copyWith(fontSize: 18)
                                      : TextStyle(
                                          fontFamily: customTypography
                                              .title1Bold.fontFamily,
                                          fontSize: customTypography
                                              .title1Bold.fontSize,
                                          fontWeight: customTypography
                                              .title1Bold.fontWeight,
                                          letterSpacing: 0,
                                        ),
                                ),
                                SizedBox(height: isMobile ? 2 : 4),
                                Text(
                                  contentSubtitles[currentIndex],
                                  textAlign: TextAlign.center,
                                  style: isMobile
                                      ? customTypography.title1Regular
                                          .copyWith(fontSize: 14)
                                      : TextStyle(
                                          fontFamily: customTypography
                                              .title1Regular.fontFamily,
                                          fontSize: customTypography
                                              .title1Regular.fontSize,
                                          fontWeight: customTypography
                                              .title1Regular.fontWeight,
                                          letterSpacing: 0,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: isMobile ? 500 : 650.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: isMobile ? 1.0 : 0.9,
                  aspectRatio: 642 / 475,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),

            /// Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imagePaths.length,
                (index) {
                  bool isSelected = currentIndex == index;
                  return GestureDetector(
                    onTap: () {
                      innerCarouselController.animateToPage(index);
                    },
                    child: AnimatedContainer(
                      margin:
                          EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                      height: isMobile ? 8 : 10,
                      width: isSelected
                          ? (isMobile ? 24 : 30)
                          : (isMobile ? 8 : 10),
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? widget.activeColor ?? colorScheme.primary
                            : widget.inactiveColor ?? colorScheme.secondary,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
