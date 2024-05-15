
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthSource {
  
  AuthSource({required this.client, this.token});

  final http.Client client;
  String? token;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://dev.escooters.blumilk.pl/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    token = jsonDecode(response.body)['access_token'];
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('Failed to sign in status code: ${response.statusCode}');
    }
  }
}
