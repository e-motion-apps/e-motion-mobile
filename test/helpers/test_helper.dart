import 'package:emotion/src/features/auth/domain/repository/user_repository.dart';
import 'package:emotion/src/features/city_details/domain/repository/city_provider_repository.dart';
import 'package:emotion/src/features/city_details/domain/repository/city_repository.dart';
import 'package:emotion/src/features/city_details/domain/repository/country_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(<Type>[
  CityRepository,
  CountryRepository,
  CityProviderRepository,
  UserRepository,
  ],
  customMocks: <MockSpec>[
    MockSpec <http.Client>(as: #MockHttpClient),
  ],
  )

void main() {}

