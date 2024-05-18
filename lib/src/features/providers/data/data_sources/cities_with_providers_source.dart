import 'dart:convert';

import 'package:emotion/src/features/providers/data/models/cities_with_providers_model.dart';
import 'package:http/http.dart' as http;

abstract class CitiesWithProvidersSource {
  Future<CitiesWithProvidersModel> getCitiesWithProviders();
}

class CitiesWithProvidersSourceImpl extends CitiesWithProvidersSource {
  final http.Client client;

  CitiesWithProvidersSourceImpl({required this.client});

  @override
  Future<CitiesWithProvidersModel> getCitiesWithProviders() async {
    final response = await client.get(Uri.parse('https://dev.escooters.blumilk.pl/api/providers'));
    if (response.statusCode == 200) {
      return CitiesWithProvidersModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cities with providers status code: ${response.statusCode}');
    }
  }
}
