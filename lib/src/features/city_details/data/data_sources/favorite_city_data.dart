import 'package:http/http.dart' as http;

class FavoriteCityData {
  int? cityId;
  http.Client client;
  String? token = ' ';

  FavoriteCityData({
    this.cityId,
    required this.client,
    this.token,
  });

  Future<bool> isFavoriteCity(int cityId, client, token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await client.get(
      Uri.parse('https://dev.escooters.blumilk.pl/api/favorites/$cityId'),
      headers: headers,
    );
    if (response.body == '1') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addFavoriteCity(int cityId, client, token) async {
    final body = '{"city_id": $cityId}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await client.post(
      Uri.parse('https://dev.escooters.blumilk.pl/api/favorites'),
      body: body,
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception(
          'Failed to add favorite city status code: ${response.statusCode}',);
    }
  }
}
