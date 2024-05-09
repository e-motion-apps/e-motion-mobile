import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/country.dart';

abstract class CountryRepository {
  Future<Either<Failure, Country>> getCountry(String slug);
}
