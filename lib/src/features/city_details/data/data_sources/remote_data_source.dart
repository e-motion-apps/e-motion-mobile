import 'package:emotion/src/features/city_details/data/models/city_details_model.dart';
import 'package:http/http.dart' as http;


abstract class CityDetailsRemoteDataSource {
  Future<CityDetailsModel> getCityDetails(String cityName, String countryName);
}

class CityDetailsRemoteDataSourceImpl extends CityDetailsRemoteDataSource {
  final http.Client client; 

  CityDetailsRemoteDataSourceImpl({required this.client});

  @override
  Future<CityDetailsModel> getCityDetails(String cityName, String countryName) async {
    final http.Response response = await client.get(
      Uri.parse('https://dev.escooters.blumilk.pl/api/$countryName/$cityName'),
      );
    if (response.statusCode == 200) {
      return CityDetailsModel.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception();
    }
  }
}
