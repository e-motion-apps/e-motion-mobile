import 'package:emotion/src/features/city_details/domain/entities/country.dart';

class CountryModel extends Country {
  const CountryModel({
    required int id,
    required String name,
    required String slug,
    required String latitude,
    required String longitude,
    required String iso, 
    required String? createdAt,
    required String? updatedAt,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          latitude: latitude,
          longitude: longitude,
          iso: iso,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      iso: json['iso'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'latitude': latitude,
      'longitude': longitude,
      'iso': iso,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}