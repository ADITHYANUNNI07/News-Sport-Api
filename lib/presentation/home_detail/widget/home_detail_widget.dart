import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/domain/home/model/search_home.dart';
import 'package:news_app_api/presentation/home_detail/home_detail_screen.dart';
import 'package:share/share.dart';

class NewsContainerSmallWidget extends StatelessWidget {
  const NewsContainerSmallWidget({
    super.key,
    required this.imageurl,
    required this.title,
    required this.url,
    required this.description,
    required this.articles,
  });
  final String? imageurl;
  final String? title;
  final String? url;
  final String? description;
  final HomeArticles articles;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.to(HomeDetailScrn(model: articles));
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width * 0.9 / 2,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  color: lightBlack,
                  borderRadius: BorderRadius.circular(20),
                  image: imageurl != null
                      ? DecorationImage(
                          image: NetworkImage(
                            imageurl!,
                          ),
                          fit: BoxFit.fill)
                      : null,
                ),
              ),
              Positioned(
                top: 10,
                right: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorGrey.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Share.share('$title\n$description\n$url');
                      },
                      icon: const Icon(Icons.share)),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  width: Get.width * 0.9 / 2,
                  child: Align(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width * 0.8 / 2,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                        color: colorGrey.shade800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          title ?? '',
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        sizedBox15W
      ],
    );
  }
}
