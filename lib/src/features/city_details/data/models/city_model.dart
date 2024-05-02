
import 'package:emotion/src/features/city_details/data/models/city_provider_model.dart';
import 'package:emotion/src/features/city_details/data/models/country_model.dart';
import 'package:emotion/src/features/city_details/domain/entities/city.dart';

class CityModel extends City {
  const CityModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.latitude,
    required super.longitude,
    // ignore: non_constant_identifier_names
    required super.city_alternative_names,
    required List<CityProviderModel> super.cityProviders,
    required CountryModel super.country,
    required super.cityOpinions,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    final cityJson = json['city'];
    return CityModel(
      id: cityJson['id'],
      name: cityJson['name'],
      slug: cityJson['slug'],
      latitude: cityJson['latitude'],
      longitude: cityJson['longitude'],
      // ignore: non_constant_identifier_names
      city_alternative_names: cityJson['city_alternative_names'],
      cityProviders: (cityJson['cityProviders'] as List)
          .map((e) => CityProviderModel.fromJson(e))
          .toList(),
      country: CountryModel.fromJson(cityJson['country']),
      cityOpinions: cityJson['cityOpinions'],
    );
  }
  
}