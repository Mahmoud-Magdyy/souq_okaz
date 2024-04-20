import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  String title;
  String image;
  String website;
  String location;
  LocationModel ({ required this.title,required this.image,required this.website,required this.location});
  /// factory.
  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}