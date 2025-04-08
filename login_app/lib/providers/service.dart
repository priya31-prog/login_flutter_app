import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/providers/models.dart';

class ApiService {
  // final http.Client https;

  // ApiService({required this.https});

  Future<List<Users>> fetchApiResponse() async {
    final url = 'https://account-info-api.onrender.com/api/v1/ecommerce/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => Users.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
