import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/providers/models.dart';

class ApiService {
  final http.Client https;

  ApiService({required this.https});

  Future<Users> fetchApiResponse() async {
    final url = 'https://account-info-api.onrender.com/api/v1/ecommerce/';
    final response = await https.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
