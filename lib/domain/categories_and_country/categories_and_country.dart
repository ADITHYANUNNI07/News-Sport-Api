import 'package:dartz/dartz.dart';
import 'package:news_app_api/domain/categories_and_country/model/categories_country.dart';
import 'package:news_app_api/domain/failure/main_failure.dart';

abstract class CategoriesAndCountryService {
  Future<Either<MainFailure, CategoriesCountry>> getCategoriesCountry(
      {required String country, required String categories});
}
