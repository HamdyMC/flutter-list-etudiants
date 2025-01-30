import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rattrapage_list/model/Etudiants.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  Future<List<Etudiants>> fetchEtudiants({String? classe}) async {
    final url = classe != null
        ? Uri.parse('$baseUrl/inscription?classe=$classe')
        : Uri.parse('$baseUrl/inscription');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Etudiants.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}
