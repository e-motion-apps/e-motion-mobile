import 'package:dartz/dartz.dart';
import 'package:emotion/src/features/city_details/domain/entities/country.dart';
import 'package:emotion/src/features/city_details/domain/usecases/get_country.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const testCountry = Country(
    id: 83,
    name: 'Germany',
    slug: 'germany',
    latitude: '51.00000000',
    longitude: '9.00000000',
    iso: 'de',
  );

  const testSlug = 'germany';

  test('should get country from the repository', () async {
    final mockCountryRepository = MockCountryRepository();
    when(mockCountryRepository.getCountry(testSlug))
        .thenAnswer((_) async => const Right(testCountry));

    GetCountryUseCase getCountryUseCase = GetCountryUseCase(mockCountryRepository);
    final result = await getCountryUseCase.execute(testSlug);

    expect(result, const Right(testCountry));
  });
  
}