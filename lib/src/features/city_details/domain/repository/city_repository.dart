import "package:dartz/dartz.dart";
import "package:emotion/src/core/error/failure.dart";
import "package:emotion/src/features/city_details/domain/entities/city.dart";

abstract class CityRepository {
  Future<Either<Failure, City>> getCityDetails(String slug);
}