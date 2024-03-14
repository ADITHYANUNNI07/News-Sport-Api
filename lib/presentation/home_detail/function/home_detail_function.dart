import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

String publishedDate(String publishedDate) {
  DateTime dateTime = DateTime.parse(publishedDate);
  return DateFormat('dd MMM yyyy').format(dateTime);
}

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
