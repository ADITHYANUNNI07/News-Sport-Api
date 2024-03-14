import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/presentation/profile/widget/widget_profile.dart';

class ProfileScrn extends StatelessWidget {
  const ProfileScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(
        top: 15,
      ),
      color: colorApp.withOpacity(0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Profile',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            CircleAvatar(
                radius: size.width / 3,
                backgroundImage: const AssetImage('assets/images/signup.png')),
            const SizedBox(height: 10),
            Text(
              'user!.name',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'user.email',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(7),
              width: size.width - 30,
              decoration: BoxDecoration(
                color: colorGrey.shade900,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: Column(
                children: [
                  AccountListTileWidget(
                      onTap: () {},
                      title: 'Edit Profile',
                      leadingIcon: LineAwesomeIcons.user_edit,
                      trailingIcon: LineAwesomeIcons.angle_right),
                  AccountListTileWidget(
                      onTap: () {},
                      title: 'User feedback',
                      leadingIcon: Icons.feedback,
                      trailingIcon: LineAwesomeIcons.angle_right),
                  AccountListTileWidget(
                    onTap: () {},
                    title: 'Share Application',
                    leadingIcon: Icons.share,
                  ),
                  AccountListTileWidget(
                    onTap: () async {},
                    title: 'Privacy Policy',
                    leadingIcon: Icons.privacy_tip,
                  ),
                  AccountListTileWidget(
                    onTap: () {},
                    title: 'Delete Account',
                    leadingIcon: Icons.delete,
                  ),
                  const Divider(),
                  AccountListTileWidget(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Logout"),
                              content: const Text(
                                  "Are you sure you want to logout?"),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorApp),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("cancel"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorApp),
                                  onPressed: () async {},
                                  child: const Text("Yes"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      title: 'Logout',
                      leadingIcon: Icons.logout,
                      trailingIcon: LineAwesomeIcons.angle_right),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
