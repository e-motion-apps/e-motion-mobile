import 'dart:convert';
import 'package:emotion/src/core/slug.dart';
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
    cityName = Slug.generate(cityName);
    countryName = Slug.generate(countryName);
    final response = await client.get(Uri.parse('https://dev.escooters.blumilk.pl/api/$countryName/$cityName'));
    if (response.statusCode == 200) {
      return CityDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load city details status code: ${response.statusCode}');
    }
  }
}
