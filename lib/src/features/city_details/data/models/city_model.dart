
import 'package:emotion/src/features/city_details/data/models/city_provider_model.dart';
import 'package:emotion/src/features/city_details/data/models/country_model.dart';
import 'package:emotion/src/features/city_details/domain/entities/city.dart';

class CityModel extends City {
  const CityModel({
    required int id,
    required String name,
    required String slug,
    required String latitude,
    required String longitude,
    // ignore: non_constant_identifier_names
    required List<dynamic> city_alternative_names,
    required List<CityProviderModel> cityProviders,
    required CountryModel country,
    required List<dynamic> cityOpinions,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          latitude: latitude,
          longitude: longitude,
          // ignore: non_constant_identifier_names
          city_alternative_names: city_alternative_names,
          cityProviders: cityProviders,
          country: country,
          cityOpinions: cityOpinions,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    var cityJson = json['city'];
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