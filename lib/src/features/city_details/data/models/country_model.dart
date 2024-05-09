import 'package:emotion/src/features/city_details/domain/entities/country.dart';

class CountryModel extends Country {
  const CountryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.latitude,
    required super.longitude,
    required super.iso,
    required super.createdAt,
    required super.updatedAt,
  });

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
    return <String, dynamic>{
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
