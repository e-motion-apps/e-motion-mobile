import 'city_provider.dart';
import 'country.dart';
import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String latitude;
  final String longitude;
  final List<CityProvider> cityProviders;
  final Country country;
  final List<dynamic> cityOpinions;

  const City({
    required this.id,
    required this.name,
    required this.slug,
    required this.latitude,
    required this.longitude,
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