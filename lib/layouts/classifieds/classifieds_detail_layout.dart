import 'package:flutter/material.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/titledesc_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/seller_details_card.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/classifieds_item_card.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/classifieds/image_carousal_layout.dart';

class ClassifiedsDetailLayout extends StatelessWidget {
  const ClassifiedsDetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: PageBreadcrumbs(
              items: [
                BreadcrumbData(
                  label: 'Apps',
                  link: AppRoute.apps,
                  isActive: true,
                ),
                BreadcrumbData(
                  label: 'Classifieds',
                  link: AppRoute.classifieds,
                  isActive: true,
                ),
                BreadcrumbData(
                  label: 'Details',
                  link: AppRoute.classifiedDetails,
                  isActive: false,
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Classifieds',
            style: TextStyle(
              fontFamily: customTypography.h3Bold.fontFamily,
              fontSize: customTypography.h3Bold.fontSize,
              fontWeight: customTypography.h3Bold.fontWeight,
            ),
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ImageCarouselLayout(
                    images: [
                      'https://images.unsplash.com/photo-1621009063622-4467e453c3c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZWxlY3Ryb25pY3xlbnwwfHwwfHx8MA%3D%3D',
                      'https://images.unsplash.com/photo-1492140260770-41aec2341f6f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVsZWN0cm9uaWN8ZW58MHx8MHx8fDA%3D',
                      'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fGVsZWN0cm9uaWN8ZW58MHx8MHx8fDA%3D',
                      'https://images.unsplash.com/photo-1610680509231-08f1f08084d1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fGVsZWN0cm9uaWN8ZW58MHx8MHx8fDA%3D',
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClassifiedsItemCard(
                          itemPrice: '3000',
                          itemName: 'Keysto Mag 725',
                          location: 'Bangalore',
                          date: 'Dec 27',
                          isSecondary: true,
                        ),
                        SizedBox(height: 16),
                        TitleDescCard(
                          title: 'Product Description',
                          description:
                              'The High-quality double disc brakes on both front and rear wheels ensure stable and quick braking. The disc brakes help you navigate safely during challenging situations such as a crowded market.\nThe bike has a sturdy and reliable steel frame that can brave rough riding conditions and terrains. The top-notch construction quality ensures that the bike has a long lifespan.\nThe bike comes packed with light and strong single walled steel rims along with 26 inches wide tyres that supports comfortable riding and a major performance advantage on the road.\nEasily adjustable saddle height and an attractive grip offer superior comfort and well cushioned ride. The seat height can be adjusted without using any tools.\nMade from high quality steel frame these bikes are durably made to long last offering you excellent service life. \nEnjoy a quick ride to your work space, neighborhood rides, or trails on this Urban Terran Galaxy Pro.This product is brought to you by the cult.The High-quality double disc brakes on both front and rear wheels ensure stable and quick braking. The disc brakes help you navigate safely during challenging situations such as a crowded market.',
                          variant: 'Secondary',
                        ),
                        SizedBox(height: 16),
                        SellerDetailsCard(
                          sellerName: 'Pradeep Kumar AR',
                          sellerDesignation: 'Team Member - Engine Machining',
                          phoneNumber: '+91 987654321',
                          emailId: 'pradeepkumarar@gmail.com',
                          location: 'Bengaluru, Karnataka',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
