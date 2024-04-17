import 'dart:async';
import 'dart:convert';
import 'package:donation/models/login_response.dart';
import 'package:http/http.dart' as http;

Future<LoginResponse> login(String email, String password) async {
  final String apiUrl = 'http://127.0.0.1:3000/api/v1/users/auth';

  // Request body
  Map<String, String> requestBody = {
    "email": email,
    "password": password,
  };

  // Encode the request body as JSON
  String requestBodyJson = jsonEncode(requestBody);

  // Set up the HTTP POST request
  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: requestBodyJson,
  );
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login. Status code: ${response.statusCode}');
  }
}
