import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';
import 'package:emotion/src/features/city_details/domain/repository/city_provider_repository.dart';

class GetCityProviderUseCase {
  final CityProviderRepository cityProviderRepository;

  const GetCityProviderUseCase(this.cityProviderRepository);

  Future<Either<Failure, CityProvider>> execute(String providerName) async {
    return cityProviderRepository.getCityProvider(providerName);
  }
}
