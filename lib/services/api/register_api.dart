import 'dart:async';
import 'dart:convert';
import 'package:donation/models/login_response.dart';
import 'package:http/http.dart' as http;

Future<LoginResponse> register(String email, String password,String firstName, String lastName,String phoneNumber) async {
  final String apiUrl = 'http://127.0.0.1:3000/api/v1/users/register';

  Map<String, String> requestBody = {
    "first_name":firstName,
    "last_name":lastName,
    "phone_number":phoneNumber,
    "email": email,
    "password": password
  };

  String requestBodyJson = jsonEncode(requestBody);

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
