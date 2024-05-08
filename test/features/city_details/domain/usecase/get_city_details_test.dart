import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/city.dart';
import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';
import 'package:emotion/src/features/city_details/domain/entities/country.dart';
import 'package:emotion/src/features/city_details/domain/usecases/get_city_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const City testCityDetail = City(
  id: 81,
  name: 'Berlin',
  slug: 'berlin',
  latitude: '52.5170365',
  longitude: '13.3888599',
  city_alternative_names: <String>[],
  cityProviders: <CityProvider>[],
  country: Country(
    id: 83, 
    name: 'Germany', 
    slug: 'germany', 
    latitude: '51.00000000', 
    longitude: '9.00000000', 
    iso: 'de',
    createdAt: '2023-09-08T11:01:46.000000Z',
    updatedAt: '2023-09-08T11:01:46.000000Z',
    ),
  cityOpinions: <List>[],);

  const String testSlug = 'berlin';

  test('should get city details from the repository', () async {
    final MockCityRepository mockCityRepository = MockCityRepository();
    when(mockCityRepository.getCityDetails(testSlug))
    .thenAnswer((_) async => const Right(testCityDetail));

    final GetCityDetailsUseCase getCityDetailsUseCase = GetCityDetailsUseCase(mockCityRepository);
    final Either<Failure, City> result = await getCityDetailsUseCase.execute(testSlug);

    expect(result, const Right(testCityDetail));
  });
}
