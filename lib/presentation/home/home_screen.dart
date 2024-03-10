// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/presentation/dashbaord/dashboard.dart';
import 'package:news_app_api/presentation/home/weather/model/weather_model.dart';
import 'package:news_app_api/presentation/home/weather/service/weather_service.dart';
import 'package:news_app_api/presentation/home/widget/home_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeScrn extends StatefulWidget {
  const HomeScrn({super.key});

  @override
  State<HomeScrn> createState() => _HomeScrnState();
}

final weatherService =
    WeatherService(apiKey: '7ebd8a1d73aeaebbf72f1715754d32ca');
ValueNotifier<Weather?> weatherNotifier = ValueNotifier(null);
featchWeather() async {
  String cityName = await weatherService.getCurrentCity();
  print(cityName);
  try {
    final weather = await weatherService.getWeather(cityName);
    weatherNotifier.value = weather;
    weatherNotifier.notifyListeners();
  } catch (e) {
    log(e.toString());
  }
}

List<String> categoriesList = [
  'General',
  'Business',
  'Health',
  'Technology',
  'Sports',
  'Music',
  'Entertainment'
];
ValueNotifier<int> choiceChipsIndexNoti = ValueNotifier(0);
ValueNotifier<int> choiceChipsIndexNotiCategorie = ValueNotifier(0);

class _HomeScrnState extends State<HomeScrn> {
  @override
  void initState() {
    featchWeather();

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    String? greeting;
    if (currentHour >= 0 && currentHour < 12) {
      greeting = 'Good Morning ☀️';
    } else if (currentHour >= 12 && currentHour < 17) {
      greeting = 'Good Afternoon 🌤️';
    } else if (currentHour >= 17 && currentHour < 21) {
      greeting = 'Good Evening 🌙';
    } else {
      greeting = 'Good Night 🌜';
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWiget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 60),
                    decoration: const BoxDecoration(
                      color: colorApp,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppBarIconBtnWidget(
                              icon: Icons.menu_rounded,
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            const Spacer(),
                            Text(
                              'News Sport'.toUpperCase(),
                              style: GoogleFonts.oswald(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            AppBarIconBtnWidget(
                              icon: Icons.notifications_rounded,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        sizedBox10H,
                        Text(
                          '$greeting, Adithyan R',
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: Get.width,
                    child: Column(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: weatherNotifier,
                          builder: (context, weathermodel, child) => Container(
                            width: Get.width - 50,
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 20),
                            decoration: BoxDecoration(
                                color: lightBlack,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: weathermodel == null
                                  ? Shimmer.fromColors(
                                      baseColor:
                                          Colors.grey.shade900.withOpacity(0.4),
                                      highlightColor: colorGrey.shade800,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: colorBlack,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 60,
                                        height: 60,
                                      ),
                                    )
                                  : Image.asset(
                                      'assets/images/sun.png',
                                      width: 60,
                                    ),
                              title: weathermodel == null
                                  ? Shimmer.fromColors(
                                      baseColor:
                                          Colors.grey.shade900.withOpacity(0.4),
                                      highlightColor: colorGrey.shade800,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: colorBlack,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 19,
                                      ),
                                    )
                                  : Text(weathermodel.cityName),
                              subtitle: weathermodel == null
                                  ? Column(
                                      children: [
                                        sizedBox5H,
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade900
                                              .withOpacity(0.4),
                                          highlightColor: colorGrey.shade800,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: colorBlack,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            height: 19,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      '${weathermodel.temperature.round().toString()}%',
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceChipsWidget(
                          title: 'Breaking News',
                          choicechipNumber: 0,
                          valueListenable: choiceChipsIndexNoti),
                      ChoiceChipsWidget(
                          title: 'Political',
                          choicechipNumber: 1,
                          valueListenable: choiceChipsIndexNoti),
                      ChoiceChipsWidget(
                          title: 'Entertainment',
                          choicechipNumber: 2,
                          valueListenable: choiceChipsIndexNoti)
                    ],
                  ),
                  sizedBox15H,
                  SizedBox(
                    height: Get.height * 0.3,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        10,
                        (index) => Row(
                          children: [
                            Stack(
                              children: [
                                Shimmer.fromColors(
                                  baseColor:
                                      Colors.grey.shade900.withOpacity(0.4),
                                  highlightColor: colorGrey.shade900,
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    width: Get.width * 0.9,
                                    height: Get.height * 0.3,
                                    decoration: BoxDecoration(
                                        color: lightBlack,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: SizedBox(
                                    width: Get.width * 0.9,
                                    child: Align(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade900
                                            .withOpacity(0.4),
                                        highlightColor: colorGrey.shade800,
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          width: Get.width * 0.8,
                                          height: Get.height * 0.1,
                                          decoration: BoxDecoration(
                                              color: colorGrey.shade800,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
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
                    ),
                  ),
                  sizedBox15H,
                  const Text(
                    'Categories ➡️',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  sizedBox10H,
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) => ChoiceChipsWidget(
                        choicechipNumber: index,
                        title: categoriesList[index],
                        valueListenable: choiceChipsIndexNotiCategorie,
                      ),
                      separatorBuilder: (context, index) => sizedBox15W,
                    ),
                  ),
                  sizedBox15H,
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: lightBlack.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade900.withOpacity(0.4),
                          highlightColor: colorGrey.shade800,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            decoration: BoxDecoration(
                                color: colorGrey.shade800,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        sizedBox15W,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade900.withOpacity(0.4),
                              highlightColor: colorGrey.shade800,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: colorBlack,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 30,
                                width: Get.width * 0.49,
                              ),
                            ),
                            sizedBox15H,
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade900.withOpacity(0.4),
                              highlightColor: colorGrey.shade800,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: colorBlack,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 30,
                                width: Get.width * 0.3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
