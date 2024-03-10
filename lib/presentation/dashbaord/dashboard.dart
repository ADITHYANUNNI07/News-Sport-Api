import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/presentation/explore/explore_screen.dart';
import 'package:news_app_api/presentation/home/home_screen.dart';
import 'package:news_app_api/presentation/profile/profile_screen.dart';
import 'package:news_app_api/presentation/search/search_screen.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
List<Widget> pages = [
  const HomeScrn(),
  const ExploreScrn(),
  const SearchScrn(),
  const ProfileScrn()
];

class DashboardScrn extends StatelessWidget {
  const DashboardScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF773BFF).withOpacity(0.5),
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, newIndex, _) {
            return Scaffold(
              body: pages[newIndex],
              bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GNav(
                      onTabChange: (index) {
                        indexChangeNotifier.value = index;
                      },
                      tabBackgroundColor: colorApp,
                      activeColor: colorWhite,
                      padding: const EdgeInsets.all(10),
                      tabActiveBorder: Border.all(
                        color: const Color(0xFF773BFF).withOpacity(0.5),
                      ),
                      tabs: const [
                        GButton(
                          iconActiveColor: colorWhite,
                          icon: Icons.home_rounded,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.explore_rounded,
                          text: 'Explore',
                        ),
                        GButton(
                          icon: Icons.search_rounded,
                          text: 'Search',
                        ),
                        GButton(
                          icon: Icons.person_rounded,
                          text: 'Profile',
                        )
                      ])),
            );
          },
        ),
      ),
    );
  }
}
