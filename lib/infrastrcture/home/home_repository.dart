// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_api/domain/api_end_points.dart';
import 'package:news_app_api/domain/failure/main_failure.dart';
import 'package:news_app_api/domain/home/home_service.dart';
import 'package:news_app_api/domain/home/model/search_home.dart';

@LazySingleton(as: HomeService)
class HomeImplementation implements HomeService {
  @override
  Future<Either<MainFailure, SearchHome>> getHomeSearchFn(
      {required String country, required String query}) async {
    try {
      Response response = await Dio(BaseOptions())
          .get(ApiEndPoints(country: country).searchFN(query));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final result = SearchHome.fromJson(response.data);
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
    } on WaitingTimeOutException catch (e) {
      print("TimeoutException: $e");
      return const Left(MainFailure.clientFailure());
      // Handle timeout exception
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
