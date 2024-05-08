import 'package:emotion/src/features/city_details/data/data_sources/remote_data_source.dart';
import 'package:emotion/src/features/city_details/data/models/city_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late CityDetailsRemoteDataSourceImpl cityDetailsRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    cityDetailsRemoteDataSourceImpl = CityDetailsRemoteDataSourceImpl(client: mockHttpClient);
  });
  
  group('getCityDetails', () {
    test('should return CityDetailsModel when the response code is 200', () async {
      when(mockHttpClient.get(Uri.parse('https://dev.escooters.blumilk.pl/api/Poland/Warsaw')))
        .thenAnswer((_) async => http.Response('{"city": {"id": 1, "name": "Warsaw"}, "providers": [{"name": "Provider 1"}, {"name": "Provider 2"}], "cityOpinions": [{"id": 1, "rating": 5, "content": "Great city!"}, {"id": 2, "rating": 3, "content": "Average city."}]}', 200));

      final CityDetailsModel result = await cityDetailsRemoteDataSourceImpl.getCityDetails('Warsaw', 'Poland');

      expect(result, isA<CityDetailsModel>());
    });

    test('should throw an exception when the response code is not 200', () async {

      when(mockHttpClient.get(Uri.parse('https://dev.escooters.blumilk.pl/api/Poland/Warsaw')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

      final Future<CityDetailsModel> Function(String cityName, String countryName) call = cityDetailsRemoteDataSourceImpl.getCityDetails;

      expect(() => call('Warsaw', 'Poland'), throwsException);
    });
  });
}
