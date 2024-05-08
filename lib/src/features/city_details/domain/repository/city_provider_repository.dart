

import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';

abstract class CityProviderRepository {
  Future<Either<Failure, CityProvider>> getCityProvider(String providerName);
}
