import 'package:equatable/equatable.dart';

class Country extends Equatable{
  final int id;
  final String name;
  final String slug;
  final String? alternativeName;
  final String latitude;
  final String longitude;
  final String iso;

  const Country({
    required this.id,
    required this.name,
    required this.slug,
    this.alternativeName,
    required this.latitude,
    required this.longitude,
    required this.iso,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    alternativeName,
    latitude,
    longitude,
    iso,
  ];
}