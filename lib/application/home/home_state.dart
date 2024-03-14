part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required List<HomeArticles> newsList,
      required List<ArticleCategories> categoriesList,
      required bool isLoading,
      required bool isError}) = _HomeState;
  factory HomeState.initial() => const HomeState(
      newsList: [], categoriesList: [], isLoading: false, isError: false);
}
