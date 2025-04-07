import 'package:flutter/material.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/news_details_card.dart';
import 'package:styria_flutter_web/layouts/news/top_layout.dart';

class NewsDetailsLayout extends StatelessWidget {
  const NewsDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        children: [
          TopLayout(
            breadcrumbs: [
              BreadcrumbData(
                label: 'Apps',
                link: AppRoute.apps,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'News',
                link: AppRoute.news,
                isActive: true,
              ),
              BreadcrumbData(
                  label:
                      'Share price of Ashok Leyland jumps as Sensex gains 820.36 points.',
                  link: AppRoute.newsDetails,
                  isActive: false),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.8,
              child: SingleChildScrollView(
                child: NewsDetailsCard(
                    cardTitle:
                        "Share price of Ashok Leyland jumps as Sensex gains 820.36 points.",
                    imageUrl:
                        "https://s3-alpha-sig.figma.com/img/d52b/d667/12be549f6a93a5d263d866a0dc8a48da?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k-7S8m89e42o5FYu~PaupGjon0SxD4JHU2HlqR5LKkIJ1NTzEepG3osF~p9h~KF9O743npXkHQHHjTkWai3NP9smAwn7XdkW~FjWgFOeETrcua9qsLvQ-zeDSVXmsfy3NeJWRepUgCKRif9CvUOVw~OJsGfkHuJkTjgdONGRiST-pGMFyexH7pXXJY1fbDWGJQLE6Zr4HP9V8iI66XRSxgYq9icBDd3ZOlt5KpqTNfWHwTuRIWhgCnZ5hH3a6jT53dkgDmoiW-r6pDHhxscK4eknK1ikY8lrrSB4QIkieqNEQ-Sv6170xGM57HMvVmzFdBD4GPsFUndsJRtTRtL4hQ__",
                    timeData: "2 Hours ago",
                    onPress: () {},
                    description:
                        "Shares of Ashok Leyland Ltd. traded 3.0 per cent up at Rs 253.7 at 10:05AM (IST) on Friday, even as BSE benchmark Sensex gained 820.36 points to 79706.58. The scrip had settled at Rs 246.3 in the previous session. The stock quoted a 52-week high and 52-week low of Rs 258.95 and Rs 157.65, respectively. As per BSE data, total traded volume on the counter till 10:05AM (IST) stood at 10:05AM shares with turnover at Rs 8.41 crore. Shares of Ashok Leyland Ltd. traded 3.0 per cent up at Rs 253.7 at 10:05AM (IST) on Friday, even as BSE benchmark Sensex gained 820.36 points to 79706.58. The scrip had settled at Rs 246.3 in the previous session. The stock quoted a 52-week high and 52-week low of Rs 258.95 and Rs 157.65, respectively. As per BSE data, total traded volume on the counter till 10:05AM (IST) stood at 10:05AM shares with turnover at Rs 8.41 crore. Shareholding Details Promoters held 51.52 per cent stake in the company as of 30-Jun-2024, while FIIs owned 22.03 per cent and DIIs 14.04 per cent."),
              ))
        ],
      ),
    );
  }
}
