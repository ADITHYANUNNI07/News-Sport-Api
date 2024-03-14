import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:news_app_api/application/home/home_bloc.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/core/widgets/widget.dart';
import 'package:news_app_api/domain/home/model/search_home.dart';
import 'package:news_app_api/presentation/home/home_screen.dart';
import 'package:news_app_api/presentation/home_detail/function/home_detail_function.dart';
import 'package:news_app_api/presentation/home_detail/widget/home_detail_widget.dart';
import 'package:share/share.dart';
import 'package:shimmer/shimmer.dart';

class HomeDetailScrn extends StatelessWidget {
  final dynamic model;
  const HomeDetailScrn({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context)
          .add(Homeloading(query: model.title ?? '', country: 'in'));
    });
    return WillPopScope(
      onWillPop: () async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<HomeBloc>(context)
              .add(const Homeloading(query: 'Breaking news', country: 'in'));
          choiceChipsIndexNoti.value = 0;
        });
        BlocProvider.of<HomeBloc>(context).add(Categoriesloading(
            categories: categoriesList[choiceChipsIndexNotiCategorie.value],
            country: 'in'));
        return true;
      },
      child: Container(
        color: colorApp,
        child: SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: Get.width,
                      height: Get.height * 0.4,
                      decoration: BoxDecoration(
                        color: lightBlack,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        image: model.urlToImage != null
                            ? DecorationImage(
                                image: NetworkImage(model.urlToImage!),
                                fit: BoxFit.fill)
                            : null,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorGrey.shade900,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                BlocProvider.of<HomeBloc>(context).add(
                                    const Homeloading(
                                        query: 'Breaking news', country: 'in'));
                                choiceChipsIndexNoti.value = 0;
                                BlocProvider.of<HomeBloc>(context).add(
                                    Categoriesloading(
                                        categories: categoriesList[
                                            choiceChipsIndexNotiCategorie
                                                .value],
                                        country: 'in'));
                              });
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorGrey.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Share.share(
                                  '${model.title}\n${model.description}\n${model.url}');
                            },
                            icon: const Icon(Icons.share)),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        width: Get.width,
                        child: Align(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(
                              color: colorGrey.shade900,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                model.title ?? '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
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
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.description ?? '',
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.justify,
                      ),
                      sizedBox15H,
                      model.author != null
                          ? Row(
                              children: [
                                const Icon(LineAwesomeIcons.alternate_pencil),
                                sizedBox10W,
                                Text(model.author ?? '')
                              ],
                            )
                          : Container(),
                      sizedBox10H,
                      model.publishedAt != null
                          ? Row(
                              children: [
                                const Icon(Icons.calendar_month_outlined),
                                sizedBox10W,
                                Text(publishedDate(model.publishedAt ?? ''))
                              ],
                            )
                          : Container(),
                      sizedBox10H,
                      ElevatedBtnWidget(
                        onPressed: () {
                          launchURL(model.url ?? '');
                        },
                        title: 'Read More',
                        btnColor: colorApp,
                      ),
                      sizedBox10H,
                      const Text(
                        'Similar News',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      sizedBox10H,
                      SizedBox(
                        height: Get.height * 0.3,
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state.newsList.isNotEmpty) {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    state.newsList.length,
                                    (index) => NewsContainerSmallWidget(
                                        imageurl:
                                            state.newsList[index].urlToImage,
                                        title: state.newsList[index].title,
                                        url: state.newsList[index].url,
                                        description:
                                            state.newsList[index].description,
                                        articles: state.newsList[index])),
                              );
                            } else {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey.shade900
                                                .withOpacity(0.4),
                                            highlightColor: colorGrey.shade900,
                                            child: Container(
                                              padding: const EdgeInsets.all(20),
                                              width: Get.width * 0.9 / 2,
                                              height: Get.height * 0.3,
                                              decoration: BoxDecoration(
                                                  color: lightBlack,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 20,
                                            child: SizedBox(
                                              width: Get.width * 0.9 / 2,
                                              child: Align(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors
                                                      .grey.shade900
                                                      .withOpacity(0.4),
                                                  highlightColor:
                                                      colorGrey.shade800,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    width: Get.width * 0.8 / 2,
                                                    height: Get.height * 0.1,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            colorGrey.shade800,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      sizedBox15W
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
