import 'package:http/http.dart' as http;

class ChangeLanguage {
  String? language;

  ChangeLanguage({this.language});

  Future<void> changeLanguage(String language) async {
    final url =
        Uri.parse('https://dev.escooters.blumilk.pl/api/language/$language');
    final headers = {'Content-Type': 'application/json'};

    try {
      await http.post(url, headers: headers);
    } catch (e) {
      throw Exception('Failed to change language: $e');
    }
  }
}
