import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:news_app_api/application/home/home_bloc.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/domain/categories_and_country/model/categories_country.dart';
import 'package:news_app_api/domain/home/model/search_home.dart';
import 'package:news_app_api/presentation/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/presentation/home_detail/home_detail_screen.dart';
import 'package:share/share.dart';

class AppBarIconBtnWidget extends StatelessWidget {
  const AppBarIconBtnWidget({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(icon, color: Colors.white, size: 30, weight: 5),
    );
  }
}

class DrawerWiget extends StatelessWidget {
  const DrawerWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      backgroundColor: Colors.grey.shade900,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: <Widget>[
          SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                  // backgroundImage: imageUrl == ''
                  //     ? const AssetImage('Assets/images/profile-user.jpg')
                  //     : Image.network(
                  //         imageUrl,
                  //       ).image,
                  )),
          const SizedBox(height: 15),
          Text(
            'userName',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white
                // fontFamily: 'brandon_H',
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'email',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.white
                // fontFamily: 'brandon_H',
                ),
          ),
          const SizedBox(height: 25),
          const Divider(height: 2),
          MenuWidget(
              title: "Profile", icon: Icons.person, onPress: () async {}),
          MenuWidget(
              title: "Favorites",
              icon: Icons.star_border_rounded,
              onPress: () {}),
          MenuWidget(title: "FeedBack", icon: Icons.feedback, onPress: () {}),
          const Divider(),
          MenuWidget(
            title: "Logout",
            endIcon: false,
            icon: LineAwesomeIcons.alternate_sign_out,
            textColor: Colors.red,
            onPress: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () async {},
                        child: const Text("Yes"),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: colorApp.withOpacity(0.4),
        ),
        child: Icon(
          icon,
          color: Colors.white.withOpacity(0.6),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.white
                // fontFamily: 'brandon_H',
                )
            .apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.4)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
              ),
            )
          : null,
    );
  }
}

class ChoiceChipsWidget extends StatelessWidget {
  const ChoiceChipsWidget({
    super.key,
    required this.choicechipNumber,
    required this.title,
    required this.valueListenable,
    this.iscategories = false,
  });
  final int choicechipNumber;
  final String title;
  final ValueNotifier<int> valueListenable;
  final bool iscategories;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, choiceValue, child) => ChoiceChip(
        backgroundColor: lightBlack,
        label: Text(
          title,
          style: TextStyle(
              color: choiceValue == choicechipNumber ? colorWhite : colorGrey,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        selected: choiceValue == choicechipNumber,
        onSelected: (value) {
          valueListenable.value = choicechipNumber;
          if (iscategories == false) {
            BlocProvider.of<HomeBloc>(context)
                .add(Homeloading(query: title, country: 'in'));
            isCategories = false;
          } else {
            BlocProvider.of<HomeBloc>(context).add(Categoriesloading(
                categories: categoriesList[choiceChipsIndexNotiCategorie.value],
                country: 'in'));
          }
        },
        selectedColor: colorApp,
      ),
    );
  }
}

class NewsContainerBigWidget extends StatelessWidget {
  const NewsContainerBigWidget({
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
            Get.to(() => HomeDetailScrn(model: articles));
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width * 0.9,
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
                  width: Get.width * 0.9,
                  child: Align(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width * 0.8,
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

class CategoriesListTile extends StatelessWidget {
  const CategoriesListTile({super.key, required this.model});
  final ArticleCategories model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: Get.width,
      decoration: BoxDecoration(
          color: lightBlack.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: Get.width * 0.3,
            height: Get.width * 0.3,
            decoration: BoxDecoration(
                color: colorGrey.shade800,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(model.urlToImage != null
                        ? model.urlToImage!
                        : failImageUrl),
                    fit: BoxFit.fill)),
          ),
          sizedBox15W,
          Expanded(
            child: Center(
              child: Text(
                model.title ?? '',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
