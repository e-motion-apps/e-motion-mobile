import 'package:equatable/equatable.dart';

class CityProvider extends Equatable {

  final int id;
  final String providerName;
  final int cityId;

  const CityProvider({
    required this.id,
    required this.providerName,
    required this.cityId,
  });

  @override
  List<Object?> get props => [
    id,
    providerName,
    cityId,
  ];
}