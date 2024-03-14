import 'package:json_annotation/json_annotation.dart';

part 'categories_country.g.dart';

@JsonSerializable()
class CategoriesCountry {
  String? status;
  int? totalResults;
  List<ArticleCategories> articles;

  CategoriesCountry({this.status, this.totalResults, this.articles = const []});

  factory CategoriesCountry.fromJson(Map<String, dynamic> json) {
    return _$CategoriesCountryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoriesCountryToJson(this);
}

@JsonSerializable()
class ArticleCategories {
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  dynamic content;

  ArticleCategories({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleCategories.fromJson(Map<String, dynamic> json) {
    return _$ArticleCategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleCategoriesToJson(this);
}
