import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/country.dart';
import 'package:emotion/src/features/city_details/domain/repository/country_repository.dart';

class GetCountryUseCase {
  final CountryRepository countryRepository;

  const GetCountryUseCase(this.countryRepository);

  Future<Either<Failure, Country>> execute(String slug) async {
    return countryRepository.getCountry(slug);
  }
}