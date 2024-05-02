import 'package:equatable/equatable.dart';

class Country extends Equatable{
  final int id;
  final String name;
  final String slug;
  // ignore: non_constant_identifier_names
  final String? alternative_name;
  final String latitude;
  final String longitude;
  final String iso;
  final String? createdAt;
  final String? updatedAt;


  const Country({
    required this.id,
    required this.name,
    required this.slug,
    // ignore: non_constant_identifier_names
    this.alternative_name,
    required this.latitude,
    required this.longitude,
    required this.iso,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    slug,
    alternative_name,
    latitude,
    longitude,
    iso,
    createdAt,
    updatedAt,
  ];

  toJson() {}
}