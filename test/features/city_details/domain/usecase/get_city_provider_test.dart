import 'package:dartz/dartz.dart';
import 'package:emotion/src/features/city_details/domain/entities/city_provider.dart';
import 'package:emotion/src/features/city_details/domain/usecases/get_city_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const testCityProvider = CityProvider(
    id: 34,
    providerName: 'Bolt',
    cityId: 81,
    );
  
  const testProviderName = 'Bolt'; 

  test('should return the city provider when the provider name is passed', () async {
    final mockCityProviderRepository = MockCityProviderRepository(); 
    when(mockCityProviderRepository.getCityProvider(testProviderName))
      .thenAnswer((_) async => const Right(testCityProvider));

    GetCityProviderUseCase getCityProviderUseCase = GetCityProviderUseCase(mockCityProviderRepository);
    final result = await getCityProviderUseCase.execute(testProviderName);

    expect(result, const Right(testCityProvider));
  });

}