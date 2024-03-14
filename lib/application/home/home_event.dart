part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.homeloading(
      {required String query, required String country}) = Homeloading;
  const factory HomeEvent.categoriesloading(
      {required String categories,
      required String country}) = Categoriesloading;
}
