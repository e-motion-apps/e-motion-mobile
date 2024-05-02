import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';
import 'package:emotion/src/features/city_details/domain/usecases/get_city_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const CityProvider testCityProvider = CityProvider(
    id: 34,
    providerName: 'Bolt',
    cityId: 81,
    );
  
  const String testProviderName = 'Bolt'; 

  test('should return the city provider when the provider name is passed', () async {
    final MockCityProviderRepository mockCityProviderRepository = MockCityProviderRepository(); 
    when(mockCityProviderRepository.getCityProvider(testProviderName))
      .thenAnswer((_) async => const Right(testCityProvider));

    final GetCityProviderUseCase getCityProviderUseCase = GetCityProviderUseCase(mockCityProviderRepository);
    final Either<Failure, CityProvider> result = await getCityProviderUseCase.execute(testProviderName);

    expect(result, const Right(testCityProvider));
  });

}