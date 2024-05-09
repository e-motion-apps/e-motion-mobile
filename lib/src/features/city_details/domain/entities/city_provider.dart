import 'package:equatable/equatable.dart';

class CityProvider extends Equatable {
  final int id;
  final String providerName;
  final int cityId;
  final String? createdAt;
  final String? updatedAt;

  const CityProvider({
    required this.id,
    required this.providerName,
    required this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => <Object?>[
        id,
        providerName,
        cityId,
        createdAt,
        updatedAt,
      ];
}
