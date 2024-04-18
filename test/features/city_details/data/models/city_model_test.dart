import 'dart:convert';

import 'package:emotion/src/features/city_details/data/models/city_model.dart';
import 'package:emotion/src/features/city_details/data/models/country_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';


void main() {

  const testCountryModel = CountryModel(
    id: 83,
    name: 'Germany',
    slug: 'germany',
    latitude: '50.000000',
    longitude: "9.000000",
    iso: 'de',
    createdAt: '2023-09-08T11:01:46.000000Z',
    updatedAt: '2023-09-08T11:01:46.000000Z',
  );

  const testCityModel = CityModel(
    id : 81,
    name : 'Berlin',
    slug: 'berlin',
    latitude: '52.5170365',
    longitude: '13.3888599',
    city_alternative_names: [],
    cityProviders: [],
    country: testCountryModel,
    cityOpinions: [],
    );

  test('should be a subclass of city entity', () async {
    expect(testCityModel, isA<CityModel>());
  });

  test('should return a valid model from json' , () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_city_response.json'
      ),
    );

    final result = CityModel.fromJson(jsonMap);

    expect(result, testCityModel);
  });

}