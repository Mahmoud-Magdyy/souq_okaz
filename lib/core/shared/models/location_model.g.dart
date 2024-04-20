// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      title: json['title'] as String,
      image: json['image'] as String,
      website: json['website'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'website': instance.website,
      'location': instance.location,
    };
