import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_api/domain/categories_and_country/categories_and_country.dart';
import 'package:news_app_api/domain/categories_and_country/model/categories_country.dart';
import 'package:news_app_api/domain/home/home_service.dart';
import 'package:news_app_api/domain/home/model/search_home.dart';
import 'package:news_app_api/presentation/home/home_screen.dart';
//import 'package:news_app_api/presentation/home/home_screen.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  final CategoriesAndCountryService _categoriesAndCountryService;
  HomeBloc(this._homeService, this._categoriesAndCountryService)
      : super(HomeState.initial()) {
    on<Homeloading>((event, emit) async {
      log('search for ${event.query}');
      emit(HomeState(
          newsList: [],
          categoriesList: state.categoriesList,
          isLoading: true,
          isError: false));
      final result = await _homeService.getHomeSearchFn(
          country: event.country.toLowerCase(),
          query: event.query.toLowerCase());
      result.fold((l) {
        emit(HomeState(
            newsList: [],
            categoriesList: state.categoriesList,
            isLoading: false,
            isError: true));
      }, (SearchHome r) {
        emit(HomeState(
            newsList: r.articles,
            categoriesList: state.categoriesList,
            isLoading: false,
            isError: false));
      });
    });
    on<Categoriesloading>((event, emit) async {
      log('search for ${event.categories}:::${event.country}$isCategories');
      if (state.categoriesList.isNotEmpty && isCategories) {
        isCategories = true;
        emit(state);
        return;
      }
      emit(HomeState(
          newsList: state.newsList,
          categoriesList: [],
          isLoading: true,
          isError: false));
      final result = await _categoriesAndCountryService.getCategoriesCountry(
          country: event.country.toLowerCase(),
          categories: event.categories.toLowerCase());
      result.fold((l) {
        emit(HomeState(
            newsList: state.newsList,
            categoriesList: [],
            isLoading: false,
            isError: true));
      }, (r) {
        emit(HomeState(
            newsList: state.newsList,
            categoriesList: r.articles,
            isLoading: false,
            isError: false));
      });
    });
  }
}
