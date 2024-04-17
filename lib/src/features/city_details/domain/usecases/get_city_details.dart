import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/city.dart';
import 'package:emotion/src/features/city_details/domain/repository/city_repository.dart';

class GetCityDetailsUseCase {
  final CityRepository cityRepository;

  const GetCityDetailsUseCase(this.cityRepository);

  Future<Either<Failure, City>> execute(String slug) {
    return cityRepository.getCityDetails(slug);
  }
}