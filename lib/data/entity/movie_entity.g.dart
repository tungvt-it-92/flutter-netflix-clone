// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => _MovieEntity(
  title: json['title'] as String,
  year: json['year'] as String,
  bannerUrl: json['bannerUrl'] as String,
);

Map<String, dynamic> _$MovieEntityToJson(_MovieEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'bannerUrl': instance.bannerUrl,
    };
