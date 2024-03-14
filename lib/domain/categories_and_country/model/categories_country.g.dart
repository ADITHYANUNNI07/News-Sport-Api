// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesCountry _$CategoriesCountryFromJson(Map<String, dynamic> json) =>
    CategoriesCountry(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
              ?.map(
                  (e) => ArticleCategories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoriesCountryToJson(CategoriesCountry instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

ArticleCategories _$ArticleCategoriesFromJson(Map<String, dynamic> json) =>
    ArticleCategories(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'],
      url: json['url'] as String?,
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] as String?,
      content: json['content'],
    );

Map<String, dynamic> _$ArticleCategoriesToJson(ArticleCategories instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
