import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/news_secondary_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/news_primary_card.dart';

class CardsLayout extends StatelessWidget {
  CardsLayout({super.key});

  final List<Map<String, dynamic>> newsItems1 = [
    {
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/b4a2/b5da/4292e220abd886910ddfd8f425b03d2b?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jDQ8n7t5lmKH2BTpIltHduyWcXuYb2fKGjJlEnQ1VbeD6ReD4kM~HH4~EPGzKxM2pIQK1dhDipd6rS~QGQuK9M5QnU7pwfK62EiiY87NW-XMT5iSojZbWYMcXnNgYB7Xf1PSBvaZACJnsO7l3Z3UVl5QpEqfh6DxTsHXMYgsJituTTJRwW4NBCSKUF8x8-F3g8yyKMq5Bj704oSP8JHdWkTggvvQ0yzUuJLD9CYJ3JqQYyFcMLwc3SczDYa~lo3E7EqCIObh4bNbN6FHT~3jqxW4OJ6D~ySdxq2dwhdhRDBG0Xi6fo22FSUFdGX87bsjBT0dURfiA2dP6348fL7EBg__",
      "tag": "Trending",
      "title":
          "Share price of Ashok Leyland jumps as Sensex gains 820.36 points.",
      "subTitle":
          "The share price of Ashok Leyland Ltd. gained 3.0 percent to Rs 253.7 at 10:05 AM (IST) in Friday's trade. The stock has hit a high of Rs 254.6 and a low of Rs 250.2 during the session. This upward movement reflects positive market sentiment following the company’s recent quarterly earnings report, which exceeded analyst expectations.",
      "time": "2",
      "tagStatus": false,
      "isSecondary": true,
    },
    {
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/79cd/d6ae/523df291ed89c5147f8ebf434a739d01?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bGRr-rmBCgH5828HzavYo1Qf9rvKniEe3A6QOjAeeD2NabyC7gY35XLZnq7yYdiofp8GejnZuC7msyAYKPghM56cEmjyyUQ1Br529lEiifxsqF0flWNw5eOH776cDmS4vc4r55R3y-cWqYrjCXHZVUOxeL15qqkc7R8j~ew57RaHC~icCEyrZSY5zAa~C-3WMImgKiASsEDTbcyr6mE3pvLN0oz9GgVKpvgy4W73t2jj0BJhb6qt8yMxpuR9iarKgI8iPYhSPYVwNEGOT1Iuo8wLKA-v489WC0jN86yZcxkkiuUReLBP3VLVt7GVg-J6lyOMfaL-O0dm67zNLPM8-g__",
      "tag": "Trending",
      "title":
          "Share price of Ashok Leyland jumps as Sensex gains 820.36 points.",
      "subTitle":
          "The share price of Ashok Leyland Ltd. gained 3.0 percent to Rs 253.7 at 10:05 AM (IST) in Friday's trade. The stock has hit a high of Rs 254.6 and a low of Rs 250.2 during the session. This upward movement reflects positive market sentiment following the company’s recent quarterly earnings report, which exceeded analyst expectations.",
      "time": "2",
      "tagStatus": false,
      "isSecondary": true,
    },
    {
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/50e4/65b7/bb65de36c4ec3eebbf56268699a06472?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WC8aMTA199tYPkCE7otOmZvJr5OknYxnGI4W0G5HHZ2LPy6YtMjCM0wLRN1XDKmxBATXpfFJkb3CDv-P4jusXp2TbL88ZZhKW931sIGP5O-GthPm2RvApzRb3bzFBbg3NJ~9EMm-QVxZTQ8en4UXvayIfXQyNy7sKypv-1inbBTR-ijpKh4eJqlAZpnWjawFcbpOwLCHjFHPAWP7MhmS3Nvvsupk7QzjRyvOok~Voxq483v7JtGkSHdc8fa6RFClAehQmhJPZwEDI64Mp5Z49pwB~ssAEAQ4p-dHSnnjmjhr2VTxjCcBtsgtHwg-3OezkbYS4cd5V2q0PMy30K6lMw__",
      "tag": "Trending",
      "title": "Ashok Leyland introduces new electric vehicles.",
      "subTitle":
          "The company expands its electric vehicle portfolio, catering to the growing demand for sustainable transport.",
      "time": "1",
      "tagStatus": false,
      "isSecondary": true,
    },
    {
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/d52b/d667/12be549f6a93a5d263d866a0dc8a48da?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k-7S8m89e42o5FYu~PaupGjon0SxD4JHU2HlqR5LKkIJ1NTzEepG3osF~p9h~KF9O743npXkHQHHjTkWai3NP9smAwn7XdkW~FjWgFOeETrcua9qsLvQ-zeDSVXmsfy3NeJWRepUgCKRif9CvUOVw~OJsGfkHuJkTjgdONGRiST-pGMFyexH7pXXJY1fbDWGJQLE6Zr4HP9V8iI66XRSxgYq9icBDd3ZOlt5KpqTNfWHwTuRIWhgCnZ5hH3a6jT53dkgDmoiW-r6pDHhxscK4eknK1ikY8lrrSB4QIkieqNEQ-Sv6170xGM57HMvVmzFdBD4GPsFUndsJRtTRtL4hQ__",
      "tag": "Trending",
      "title": "Ashok Leyland’s market strategies post-pandemic.",
      "subTitle":
          "The company outlines its approach to navigate the challenges in the automotive sector post-COVID.",
      "time": "1",
      "tagStatus": false,
      "isSecondary": true,
    },
  ];

  final List<Map<String, String>> newsItems = [
    {
      "title": "Ashok Leyland launches 'M&HCV Expo' series from Delhi",
      "content":
          "This initiative aims to bring Ashok Leyland's Medium and Heavy Commercial Vehicles...",
      "time": "5 hours ago",
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/ecf2/9f79/e35eb3a3a0f2906591734807d688349d?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Pd3AYsYgMEs9H8bLgBWLhbjkW7-Gxmqjh5c6s0rVaYFsLXD0pU5jNjlZCQDxIjXhIef5eo7HoAaKSJF5P0cwWjGmvVPYTrQeB19UlOQ3RcKlgGIXVeK1j8YVBucV~h~ov66JxZKhXTd-LuYY6hUOCclqxmJA6ecGrslqpVbKu~oif~x~fzrAwS3AnzL5jcvKdy2cYWokwjb51JcDIyi1abQqk4nMsK3no4DfquhjPTEZ4vYzIxtCcF5XeiV2XLO7OLmoZnGsS5v2jVBEzFGd3iLVW7Risn-s~AmqsPIpuefPVn804~mLzvrc2nWLK0siD5TyHADbqAYsc2ojohKIXA__",
    },
    {
      "title": "New Electric Vehicle Models Unveiled by Ashok Leyland",
      "content":
          "The latest models focus on sustainability and efficiency in urban transport...",
      "time": "3 hours ago",
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/6d63/7f1d/9c7016dfe7b0f6155285c769f4588868?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TpWdiUM~ex3IjLtnHeayS5UQsJ1LPe8bYq~NusjAn80hZGqwMyzVn1cfIKqY~cFVJzCtMrKzhR0jnUrtx6kHqUFqQOuU8H2wptijsOcEAP~sB4AL6HFBhdHAmRvP8sdRSVTV7mmOW8YnWt6-RvJv0FT9~30CfRITAinsrPFgGBw-60Iubv4DbSi1-iIpyEYldthtlsxRkg2hdgi8F1w9RJlEwr5f-B5MnWlxtR64aUleuCCV3vDmxlSjpzaocYKl8aymw7OB1v8xbwyPsBEb-XIYKXQX~AneZkU5AWbT0a0O~3wL8XBYUnJ8FNsku4RUHoFk41fLDIOsqHoP7HzM5Q__",
    },
    {
      "title": "Ashok Leyland Expands Operations in South Asia",
      "content":
          "The company aims to increase its market share in the growing South Asian vehicle market...",
      "time": "2 hours ago",
      "imageUrl":
          "https://s3-alpha-sig.figma.com/img/2b86/2ce1/22c4b8bae6424491cf0ea736f3351b33?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j1nEUcPR3Q1sY35JQiOoBsZhlCCM99ntofwg1iSAQVqUgvV~uE8Yhjk66pveVRrWeFHl5JQ6SEi8nKAwYqhJ4Ls-AkKRvPfN8w6yKet2VxBSY-HKmIw19jLGQJFHEIZ7vW3vxs7EC6VBUW39QOiG10WzNW5CDcjWq4YsMOaT4wMWUVXGVthkrJ2T9HDSjjUzBk1U-9EA-Fg4uNkRIMLvzirZY2ev8lAbttDkwZ2nZM~mRw8KAVkjipwYPK5OIE-USH75-67U~hb2XwF9o56ZNxKIuEwpIu-WQbURLRwromxsvm53gCdwBOugrzGgyBItRwuMb0J4i-zOrd~fGj6YKQ__",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 1440) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewsPrimaryCard(
            imageUrl:
                "https://s3-alpha-sig.figma.com/img/d52b/d667/12be549f6a93a5d263d866a0dc8a48da?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k-7S8m89e42o5FYu~PaupGjon0SxD4JHU2HlqR5LKkIJ1NTzEepG3osF~p9h~KF9O743npXkHQHHjTkWai3NP9smAwn7XdkW~FjWgFOeETrcua9qsLvQ-zeDSVXmsfy3NeJWRepUgCKRif9CvUOVw~OJsGfkHuJkTjgdONGRiST-pGMFyexH7pXXJY1fbDWGJQLE6Zr4HP9V8iI66XRSxgYq9icBDd3ZOlt5KpqTNfWHwTuRIWhgCnZ5hH3a6jT53dkgDmoiW-r6pDHhxscK4eknK1ikY8lrrSB4QIkieqNEQ-Sv6170xGM57HMvVmzFdBD4GPsFUndsJRtTRtL4hQ__",
            tag: "Trending",
            title:
                "Share price of Ashok Leyland jumps as Sensex gains 820.36 points.",
            subTitle:
                "The share price of Ashok Leyland Ltd. gained 3.0 percent to Rs 253.7 at 10:05 AM (IST) in Friday's trade. The stock has hit a high of Rs 254.6 and a low of Rs 250.2 during the session. This upward movement reflects positive market sentiment following the company’s recent quarterly earnings report, which exceeded analyst expectations.",
            time: "2",
            tagStatus: true,
            onTap: () {
              context.go(AppRoute.newsDetails);
            },
          ),
          const SizedBox(height: 20),
          ...List.generate(
            newsItems.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: NewsSecondaryCard(
                content: newsItems[index]['content']!,
                title: newsItems[index]['title']!,
                time: newsItems[index]['time']!,
                imageUrl: newsItems[index]['imageUrl']!,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                double cardSpacing = 16.0;

                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 4;
                  cardSpacing = 16.0;
                } else if (constraints.maxWidth > 900) {
                  crossAxisCount = 3;
                  cardSpacing = 16.0;
                } else if (constraints.maxWidth > 425) {
                  crossAxisCount = 2;
                  cardSpacing = 10.0;
                } else {
                  crossAxisCount = 1;
                  cardSpacing = 0.0;
                }

                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: List.generate(newsItems1.length, (index) {
                    return SizedBox(
                      width:
                          (constraints.maxWidth / crossAxisCount) - cardSpacing,
                      child: NewsPrimaryCard(
                        imageUrl: newsItems1[index]['imageUrl'],
                        tag: newsItems1[index]['tag'],
                        title: newsItems1[index]['title'],
                        subTitle: newsItems1[index]['subTitle'],
                        time: newsItems1[index]['time'],
                        tagStatus: false,
                        isSecondary: true,
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 162,
                child: NewsPrimaryCard(
                  imageUrl:
                      "https://s3-alpha-sig.figma.com/img/d52b/d667/12be549f6a93a5d263d866a0dc8a48da?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k-7S8m89e42o5FYu~PaupGjon0SxD4JHU2HlqR5LKkIJ1NTzEepG3osF~p9h~KF9O743npXkHQHHjTkWai3NP9smAwn7XdkW~FjWgFOeETrcua9qsLvQ-zeDSVXmsfy3NeJWRepUgCKRif9CvUOVw~OJsGfkHuJkTjgdONGRiST-pGMFyexH7pXXJY1fbDWGJQLE6Zr4HP9V8iI66XRSxgYq9icBDd3ZOlt5KpqTNfWHwTuRIWhgCnZ5hH3a6jT53dkgDmoiW-r6pDHhxscK4eknK1ikY8lrrSB4QIkieqNEQ-Sv6170xGM57HMvVmzFdBD4GPsFUndsJRtTRtL4hQ__",
                  tag: "Trending",
                  title:
                      "Share price of Ashok Leyland jumps as Sensex gains 820.36 points.",
                  subTitle:
                      "The share price of Ashok Leyland Ltd. gained 3.0 percent to Rs 253.7 at 10:05 AM (IST) in Friday's trade. The stock has hit a high of Rs 254.6 and a low of Rs 250.2 during the session. This upward movement reflects positive market sentiment following the company’s recent quarterly earnings report, which exceeded analyst expectations.",
                  time: "2",
                  tagStatus: true,
                  onTap: () {
                    context.go(AppRoute.newsDetails);
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 137,
                child: Column(
                  children: List.generate(
                    newsItems.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                          bottom: index == newsItems.length - 1 ? 0 : 20),
                      child: NewsSecondaryCard(
                        content: newsItems[index]['content']!,
                        title: newsItems[index]['title']!,
                        time: newsItems[index]['time']!,
                        imageUrl: newsItems[index]['imageUrl']!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 4;
                } else if (constraints.maxWidth > 900) {
                  crossAxisCount = 3;
                } else if (constraints.maxWidth > 425) {
                  crossAxisCount = 2;
                } else {
                  crossAxisCount = 1;
                }

                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: List.generate(newsItems1.length, (index) {
                    return SizedBox(
                      width: (constraints.maxWidth / crossAxisCount) - 15,
                      child: NewsPrimaryCard(
                        imageUrl: newsItems1[index]['imageUrl'],
                        tag: newsItems1[index]['tag'],
                        title: newsItems1[index]['title'],
                        subTitle: newsItems1[index]['subTitle'],
                        time: newsItems1[index]['time'],
                        tagStatus: false,
                        isSecondary: true,
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
