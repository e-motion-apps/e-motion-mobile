import 'city_provider.dart';
import 'country.dart';
import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String latitude;
  final String longitude;
  // ignore: non_constant_identifier_names
  final List<dynamic> city_alternative_names;
  final List<CityProvider> cityProviders;
  final Country country;
  final List<dynamic> cityOpinions;

  const City({
    required this.id,
    required this.name,
    required this.slug,
    required this.latitude,
    required this.longitude,
    // ignore: non_constant_identifier_names
    required this.city_alternative_names,
    required this.cityProviders,
    required this.country,
    required this.cityOpinions,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        latitude,
        longitude,
        cityProviders,
        country,
        cityOpinions,
      ];
}