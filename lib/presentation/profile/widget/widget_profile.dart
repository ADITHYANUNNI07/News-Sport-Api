import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/core/color/colors.dart';

class AccountListTileWidget extends StatelessWidget {
  const AccountListTileWidget({
    super.key,
    required this.title,
    this.trailingIcon,
    required this.leadingIcon,
    this.onTap,
  });
  final String title;
  final IconData? trailingIcon;
  final IconData leadingIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: colorApp.withOpacity(0.09),
        ),
        child: Icon(
          leadingIcon,
          color: colorApp,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: colorApp,
        size: 20,
      ),
    );
  }
}
