import 'package:news_app_api/core/api_key.dart';
import 'package:news_app_api/core/string.dart';

class ApiEndPoints {
  String country;
  ApiEndPoints({required this.country});
  String categoriesFN(String category) {
    return '$kBaseUrl/top-headlines?country=$country&category=$category&apiKey=$apiKey';
  }

  String searchFN(String query) {
    return '$kBaseUrl/everything?q=$query&apiKey=$apiKey';
  }
}
