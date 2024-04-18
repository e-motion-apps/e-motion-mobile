import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';

class CityProviderModel extends CityProvider
{
  const CityProviderModel ({
    required int id,
    required String providerName,
    required int cityId,
    required String? createdAt,
    required String? updatedAt,
  }) : super(
    id: id,
    providerName: providerName,
    cityId: cityId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory CityProviderModel.fromJson(Map<String, dynamic> json) {
    return CityProviderModel(
      id: json['id'],
      providerName: json['providerName'],
      cityId: json['cityId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'providerName': providerName,
      'cityId': cityId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

}