import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ColorGuide extends StatelessWidget {
  const ColorGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final colorData = [
      ColorItem(
        color: AppColors.brandBlue,
        hexCode: '#4D33B7',
        name: 'Primary',
        textColor: AppColors.brandBlueSecondary,
      ),
      ColorItem(
        color: AppColors.brandBlueSecondary,
        hexCode: '#F1F1F1',
        name: 'Secondary',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.coralRed,
        hexCode: '#FA3F3F',
        name: 'Coral Red',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.lacqueredLiquorice,
        hexCode: '#383838',
        name: 'Lacquered Liquorice',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.luckyGrey,
        hexCode: '#767676',
        name: 'Lucky Grey',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.oilGreen,
        hexCode: '#64B529',
        name: 'Oil Green',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.capucineOrange,
        hexCode: '#FDAB61',
        name: 'Capucine Orange',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.paleCeruleanBlue,
        hexCode: '#82D1EF',
        name: 'Pale Cerulean Blue',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.scarletRed,
        hexCode: '#CB0000',
        name: 'Scarlet Red',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.cadmiumYellow,
        hexCode: '#FBBB00',
        name: 'Cadmium Yellow',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.grenadineRed,
        hexCode: '#FF481F',
        name: 'Grenadine Red',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.candlelightIvory,
        hexCode: '#FDF6E2',
        name: 'Candlelight Ivory',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.placeboMagenta,
        hexCode: '#FDEDF5',
        name: 'Placebo Magenta',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.placeboGreen,
        hexCode: '#EBFDE6',
        name: 'Placebo Green',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.yellowOcher,
        hexCode: '#D6A439',
        name: 'Yellow Ocher',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.roseColor,
        hexCode: "#E14C8E",
        name: 'Rose Color',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.vividGreen,
        hexCode: "#36B37E",
        name: 'Vivid Green',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.dreamyCloud,
        hexCode: "#E5E6EB",
        name: 'Dreamy Cloud',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.nickel,
        hexCode: "#929292",
        name: 'Nickel',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.dreamyCloud,
        hexCode: "#E5E6EB",
        name: 'Dreamy Cloud',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.platinum,
        hexCode: "#E7E7E7",
        name: 'Platinum',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.neutralGray,
        hexCode: "#F8F8F8",
        name: 'Light Grey',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.lilacGray,
        hexCode: "#B9B9B9",
        name: 'Lilac Gray',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.blackWash,
        hexCode: "rgba(13, 11, 11, 0.2)",
        name: 'Black Wash',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.black06,
        hexCode: "rgba(0, 0, 0, 0.6)",
        name: 'Black 06',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.primary_900,
        hexCode: "#20154D",
        name: 'Primary_900',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.neutral_400,
        hexCode: "#424242",
        name: 'Neutral_400',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.neutral_500,
        hexCode: "#131313",
        name: 'Neutral_500',
        textColor: Colors.white,
      ),
      ColorItem(
          color: AppColors.rapunzelSilver,
          hexCode: "#D2D3D6",
          name: 'Rapunzel Silver',
          textColor: Colors.black),
      ColorItem(
        color: AppColors.dreamyCloud,
        hexCode: "#E5E6EB",
        name: 'Dreamy Cloud',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.wolFrame,
        hexCode: "#B6B6B6",
        name: 'WolFrame',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.distantHorizon,
        hexCode: "#F1F6F9",
        name: 'Distant Horizon',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.outrageousOrange,
        hexCode: "#FF6D4C",
        name: 'Outrageous Orange',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.neutral_300,
        hexCode: "#616161",
        name: 'Neutral_300',
        textColor: Colors.white,
      ),
      ColorItem(
          color: AppColors.rapunzelSilver,
          hexCode: "#D2D3D6",
          name: 'Rapunzel Silver',
          textColor: Colors.black),
      ColorItem(
        color: AppColors.primary_600,
        hexCode: "#462EA7",
        name: 'Primary 600',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.snowFlake,
        hexCode: "#F0F0F0",
        name: 'SnowFlake',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.sailAway,
        hexCode: "#54B0DF",
        name: 'Sail Away',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.neutralGray,
        hexCode: "#EDEBF8",
        name: 'Neutral Gray',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.deepChicoryBlue,
        hexCode: "#8876CF",
        name: 'Deep Chocory Blue',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.primary_50,
        hexCode: "#EDEBF8FF",
        name: 'Primary_50',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.placeboRGB,
        hexCode: "rgba(231, 231, 231, 1)",
        name: 'Placebo RGB',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.blackV1,
        hexCode: "#0B0E19",
        name: 'Black v1',
        textColor: Colors.white,
      ),
      ColorItem(
        color: AppColors.neutralGray3,
        hexCode: "#0B0E19",
        name: 'Neutral Gray 3',
        textColor: Colors.black,
      ),
      ColorItem(
        color: AppColors.bleachedSilk,
        hexCode: "#F2F2F2",
        name: 'Bleached Silk',
        textColor: Colors.black,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth ~/ 150;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: colorData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = colorData[index];
            return ColorTile(
              item: item,
              typography: customTypography,
            );
          },
        );
      },
    );
  }
}

class ColorTile extends StatelessWidget {
  final ColorItem item;
  final CustomTypography typography;

  const ColorTile({
    required this.item,
    required this.typography,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: item.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            item.hexCode,
            maxFontSize: typography.body3Regular.fontSize!.toDouble(),
            maxLines: 1,
            style: TextStyle(
              color: item.textColor,
              fontFamily: typography.body3Regular.fontFamily,
              fontSize: typography.body3Regular.fontSize,
              fontWeight: typography.body3Regular.fontWeight,
            ),
          ),
          const SizedBox(height: 4),
          AutoSizeText(
            item.name,
            maxFontSize: typography.body3Regular.fontSize!.toDouble(),
            maxLines: 1,
            style: TextStyle(
              color: item.textColor,
              fontFamily: typography.body3Regular.fontFamily,
              fontSize: typography.body3Regular.fontSize,
              fontWeight: typography.body3Regular.fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}

class ColorItem {
  final Color color;
  final String hexCode;
  final String name;
  final Color textColor;

  ColorItem({
    required this.color,
    required this.hexCode,
    required this.name,
    required this.textColor,
  });
}
