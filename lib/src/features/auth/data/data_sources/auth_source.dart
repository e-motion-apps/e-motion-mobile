import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthSource {
  AuthSource({required this.client, this.token});

  final http.Client client;
  String? token = ' ';

  Future<String?> setToken(value) async {
    token = value;
    return token;
  }

  String getToken() {
    return token!;
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await client.post(
      Uri.parse('https://dev.escooters.blumilk.pl/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      token = jsonDecode(response.body)['access_token'];
    } else {
      throw Exception('Failed to sign in status code: ${response.statusCode}');
    }
    setToken(token);
  }

  Future<bool> signUpWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    final response = await client.post(
      Uri.parse('https://dev.escooters.blumilk.pl/api/register'),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to sign up status code: ${response.statusCode}');
    }
  }

  bool isSignedInSync() {
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<String?> isSignedIn() async {
    if (token!.isEmpty) {
      throw Exception('User is not signed in');
    }
    if (token!.isNotEmpty) {
      return token;
    }
    return null;
  }

  Future<void> signOut() async {
    await client.post(
      Uri.parse('https://dev.escooters.blumilk.pl/api/logout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    token = null;
  }

  AuthSource useToken(String token) {
    this.token = token;
    return this;
  }
}
