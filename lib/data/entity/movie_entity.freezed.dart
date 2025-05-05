// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieEntity {

 String get title; String get year; String get bannerUrl;
/// Create a copy of MovieEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieEntityCopyWith<MovieEntity> get copyWith => _$MovieEntityCopyWithImpl<MovieEntity>(this as MovieEntity, _$identity);

  /// Serializes this MovieEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,year,bannerUrl);

@override
String toString() {
  return 'MovieEntity(title: $title, year: $year, bannerUrl: $bannerUrl)';
}


}

/// @nodoc
abstract mixin class $MovieEntityCopyWith<$Res>  {
  factory $MovieEntityCopyWith(MovieEntity value, $Res Function(MovieEntity) _then) = _$MovieEntityCopyWithImpl;
@useResult
$Res call({
 String title, String year, String bannerUrl
});




}
/// @nodoc
class _$MovieEntityCopyWithImpl<$Res>
    implements $MovieEntityCopyWith<$Res> {
  _$MovieEntityCopyWithImpl(this._self, this._then);

  final MovieEntity _self;
  final $Res Function(MovieEntity) _then;

/// Create a copy of MovieEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? year = null,Object? bannerUrl = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: null == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MovieEntity implements MovieEntity {
  const _MovieEntity({required this.title, required this.year, required this.bannerUrl});
  factory _MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);

@override final  String title;
@override final  String year;
@override final  String bannerUrl;

/// Create a copy of MovieEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieEntityCopyWith<_MovieEntity> get copyWith => __$MovieEntityCopyWithImpl<_MovieEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,year,bannerUrl);

@override
String toString() {
  return 'MovieEntity(title: $title, year: $year, bannerUrl: $bannerUrl)';
}


}

/// @nodoc
abstract mixin class _$MovieEntityCopyWith<$Res> implements $MovieEntityCopyWith<$Res> {
  factory _$MovieEntityCopyWith(_MovieEntity value, $Res Function(_MovieEntity) _then) = __$MovieEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, String year, String bannerUrl
});




}
/// @nodoc
class __$MovieEntityCopyWithImpl<$Res>
    implements _$MovieEntityCopyWith<$Res> {
  __$MovieEntityCopyWithImpl(this._self, this._then);

  final _MovieEntity _self;
  final $Res Function(_MovieEntity) _then;

/// Create a copy of MovieEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? year = null,Object? bannerUrl = null,}) {
  return _then(_MovieEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: null == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
