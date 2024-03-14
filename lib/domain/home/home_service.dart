import 'package:dartz/dartz.dart';
import 'package:news_app_api/domain/failure/main_failure.dart';
import 'package:news_app_api/domain/home/model/search_home.dart';

abstract class HomeService {
  Future<Either<MainFailure, SearchHome>> getHomeSearchFn(
      {required String country, required String query});
}
