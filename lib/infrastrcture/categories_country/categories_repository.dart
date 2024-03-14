// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_api/domain/api_end_points.dart';
import 'package:news_app_api/domain/categories_and_country/categories_and_country.dart';
import 'package:news_app_api/domain/categories_and_country/model/categories_country.dart';
import 'package:news_app_api/domain/failure/main_failure.dart';

@LazySingleton(as: CategoriesAndCountryService)
class CategoriesCountryImplement implements CategoriesAndCountryService {
  @override
  Future<Either<MainFailure, CategoriesCountry>> getCategoriesCountry(
      {required String country, required String categories}) async {
    try {
      Response response = await Dio(BaseOptions())
          .get(ApiEndPoints(country: country).categoriesFN(categories));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CategoriesCountry.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } on SocketException catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
