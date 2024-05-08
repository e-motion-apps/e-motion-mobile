import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';

class CityProviderModel extends CityProvider
{
  const CityProviderModel ({
    required super.id,
    required super.providerName,
    required super.cityId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CityProviderModel.fromJson(Map<String, dynamic> json) {
    return CityProviderModel(
      id: json['id'],
      providerName: json['providerName'],
      cityId: json['cityId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'providerName': providerName,
      'cityId': cityId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

}
