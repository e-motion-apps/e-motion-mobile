import 'package:emotion/src/features/city_details/domain/entities/city.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:emotion/src/features/city_details/domain/usecases/get_city_details.dart';
import 'package:emotion/src/features/city_details/domain/entities/country.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const testCityDetail = City(
  id: 81,
  name: 'Berlin',
  slug: 'berlin',
  latitude: '52.5170365',
  longitude: '13.3888599',
  cityProviders: [],
  country: Country(
    id: 83, 
    name: 'Germany', 
    slug: 'germany', 
    latitude: '51.00000000', 
    longitude: '9.00000000', 
    iso: 'de'),
  cityOpinions: []);

  const testSlug = 'berlin';

  test('should get city details from the repository', () async {
    final mockCityRepository = MockCityRepository();
    when(mockCityRepository.getCityDetails(testSlug))
    .thenAnswer((_) async => const Right(testCityDetail));

    GetCityDetailsUseCase getCityDetailsUseCase = GetCityDetailsUseCase(mockCityRepository);
    final result = await getCityDetailsUseCase.execute(testSlug);

    expect(result, const Right(testCityDetail));
  });
}