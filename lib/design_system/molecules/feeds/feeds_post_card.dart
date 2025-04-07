import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsPostCard extends StatelessWidget {
  final String bannerImageUrl;
  final String title;
  final String description;

  const FeedsPostCard({
    super.key,
    required this.bannerImageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            title,
            style: TextStyle(
              fontFamily: customTypography.body1Bold.fontFamily,
              fontSize: customTypography.body1Bold.fontSize,
              fontWeight: customTypography.body1Bold.fontWeight,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            style: TextStyle(
              fontFamily: customTypography.body2Regular.fontFamily,
              fontSize: customTypography.body2Regular.fontSize,
              fontWeight: customTypography.body2Regular.fontWeight,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 685,
              maxWidth: 1000,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Image.network(
                bannerImageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 389,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 389,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
