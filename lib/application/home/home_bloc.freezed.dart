// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  String get country => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String country) homeloading,
    required TResult Function(String categories, String country)
        categoriesloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String country)? homeloading,
    TResult? Function(String categories, String country)? categoriesloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String country)? homeloading,
    TResult Function(String categories, String country)? categoriesloading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Homeloading value) homeloading,
    required TResult Function(Categoriesloading value) categoriesloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Homeloading value)? homeloading,
    TResult? Function(Categoriesloading value)? categoriesloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Homeloading value)? homeloading,
    TResult Function(Categoriesloading value)? categoriesloading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeEventCopyWith<HomeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
  @useResult
  $Res call({String country});
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeloadingImplCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$$HomeloadingImplCopyWith(
          _$HomeloadingImpl value, $Res Function(_$HomeloadingImpl) then) =
      __$$HomeloadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, String country});
}

/// @nodoc
class __$$HomeloadingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeloadingImpl>
    implements _$$HomeloadingImplCopyWith<$Res> {
  __$$HomeloadingImplCopyWithImpl(
      _$HomeloadingImpl _value, $Res Function(_$HomeloadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? country = null,
  }) {
    return _then(_$HomeloadingImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeloadingImpl implements Homeloading {
  const _$HomeloadingImpl({required this.query, required this.country});

  @override
  final String query;
  @override
  final String country;

  @override
  String toString() {
    return 'HomeEvent.homeloading(query: $query, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeloadingImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeloadingImplCopyWith<_$HomeloadingImpl> get copyWith =>
      __$$HomeloadingImplCopyWithImpl<_$HomeloadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String country) homeloading,
    required TResult Function(String categories, String country)
        categoriesloading,
  }) {
    return homeloading(query, country);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String country)? homeloading,
    TResult? Function(String categories, String country)? categoriesloading,
  }) {
    return homeloading?.call(query, country);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String country)? homeloading,
    TResult Function(String categories, String country)? categoriesloading,
    required TResult orElse(),
  }) {
    if (homeloading != null) {
      return homeloading(query, country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Homeloading value) homeloading,
    required TResult Function(Categoriesloading value) categoriesloading,
  }) {
    return homeloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Homeloading value)? homeloading,
    TResult? Function(Categoriesloading value)? categoriesloading,
  }) {
    return homeloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Homeloading value)? homeloading,
    TResult Function(Categoriesloading value)? categoriesloading,
    required TResult orElse(),
  }) {
    if (homeloading != null) {
      return homeloading(this);
    }
    return orElse();
  }
}

abstract class Homeloading implements HomeEvent {
  const factory Homeloading(
      {required final String query,
      required final String country}) = _$HomeloadingImpl;

  String get query;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$HomeloadingImplCopyWith<_$HomeloadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesloadingImplCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$$CategoriesloadingImplCopyWith(_$CategoriesloadingImpl value,
          $Res Function(_$CategoriesloadingImpl) then) =
      __$$CategoriesloadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categories, String country});
}

/// @nodoc
class __$$CategoriesloadingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$CategoriesloadingImpl>
    implements _$$CategoriesloadingImplCopyWith<$Res> {
  __$$CategoriesloadingImplCopyWithImpl(_$CategoriesloadingImpl _value,
      $Res Function(_$CategoriesloadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? country = null,
  }) {
    return _then(_$CategoriesloadingImpl(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoriesloadingImpl implements Categoriesloading {
  const _$CategoriesloadingImpl(
      {required this.categories, required this.country});

  @override
  final String categories;
  @override
  final String country;

  @override
  String toString() {
    return 'HomeEvent.categoriesloading(categories: $categories, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesloadingImpl &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesloadingImplCopyWith<_$CategoriesloadingImpl> get copyWith =>
      __$$CategoriesloadingImplCopyWithImpl<_$CategoriesloadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String country) homeloading,
    required TResult Function(String categories, String country)
        categoriesloading,
  }) {
    return categoriesloading(categories, country);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String country)? homeloading,
    TResult? Function(String categories, String country)? categoriesloading,
  }) {
    return categoriesloading?.call(categories, country);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String country)? homeloading,
    TResult Function(String categories, String country)? categoriesloading,
    required TResult orElse(),
  }) {
    if (categoriesloading != null) {
      return categoriesloading(categories, country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Homeloading value) homeloading,
    required TResult Function(Categoriesloading value) categoriesloading,
  }) {
    return categoriesloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Homeloading value)? homeloading,
    TResult? Function(Categoriesloading value)? categoriesloading,
  }) {
    return categoriesloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Homeloading value)? homeloading,
    TResult Function(Categoriesloading value)? categoriesloading,
    required TResult orElse(),
  }) {
    if (categoriesloading != null) {
      return categoriesloading(this);
    }
    return orElse();
  }
}

abstract class Categoriesloading implements HomeEvent {
  const factory Categoriesloading(
      {required final String categories,
      required final String country}) = _$CategoriesloadingImpl;

  String get categories;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$CategoriesloadingImplCopyWith<_$CategoriesloadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  List<HomeArticles> get newsList => throw _privateConstructorUsedError;
  List<ArticleCategories> get categoriesList =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<HomeArticles> newsList,
      List<ArticleCategories> categoriesList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsList = null,
    Object? categoriesList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      newsList: null == newsList
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<HomeArticles>,
      categoriesList: null == categoriesList
          ? _value.categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<ArticleCategories>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HomeArticles> newsList,
      List<ArticleCategories> categoriesList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsList = null,
    Object? categoriesList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$HomeStateImpl(
      newsList: null == newsList
          ? _value._newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<HomeArticles>,
      categoriesList: null == categoriesList
          ? _value._categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<ArticleCategories>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required final List<HomeArticles> newsList,
      required final List<ArticleCategories> categoriesList,
      required this.isLoading,
      required this.isError})
      : _newsList = newsList,
        _categoriesList = categoriesList;

  final List<HomeArticles> _newsList;
  @override
  List<HomeArticles> get newsList {
    if (_newsList is EqualUnmodifiableListView) return _newsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsList);
  }

  final List<ArticleCategories> _categoriesList;
  @override
  List<ArticleCategories> get categoriesList {
    if (_categoriesList is EqualUnmodifiableListView) return _categoriesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(newsList: $newsList, categoriesList: $categoriesList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._newsList, _newsList) &&
            const DeepCollectionEquality()
                .equals(other._categoriesList, _categoriesList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newsList),
      const DeepCollectionEquality().hash(_categoriesList),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final List<HomeArticles> newsList,
      required final List<ArticleCategories> categoriesList,
      required final bool isLoading,
      required final bool isError}) = _$HomeStateImpl;

  @override
  List<HomeArticles> get newsList;
  @override
  List<ArticleCategories> get categoriesList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
