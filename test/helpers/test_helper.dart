import 'package:emotion/src/features/city_details/domain/repository/city_provider_repository.dart';
import 'package:emotion/src/features/city_details/domain/repository/country_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:emotion/src/features/city_details/domain/repository/city_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  CityRepository,
  CountryRepository,
  CityProviderRepository,
  ],
  customMocks: [
    MockSpec <http.Client>(as: #MockHttpClient),
  ]
  )

void main() {}

