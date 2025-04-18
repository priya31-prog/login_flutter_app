import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_app/api/header.dart';
import 'package:login_app/providers/models.dart';

class ApiService {
  // final http.Client https;

  // ApiService({required this.https});

  Future<List<Users>> fetchApiResponse() async {
    final url = 'https://account-info-api.onrender.com/api/v1/ecommerce/';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('data-------${data}');
        return data.map((userJson) => Users.fromJson(userJson)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('error message..-${e.toString()}');
      throw Exception('Failed to load data');
    }
  }
}

class RegisterAccount {
  Future<bool> registerUser({
    required String username,
    required String password,
    required String email,
  }) async {
    final headers = await getHeaders();
    final url = 'https://account-info-api.onrender.com/api/v1/ecommerce/';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          'user_name': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print('Account created successfully.!');
        return true;
      } else {
        print('unable to create an account..${response}');
        return false;
      }
    } catch (e) {
      print('exception $e');
      return false;
    }
  }
}
