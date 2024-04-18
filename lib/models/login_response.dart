import 'package:donation/models/user.dart';

class LoginResponse {
  User? user;
  String? accessToken;
  String status;
  String? error;

  LoginResponse({this.user, this.accessToken, required this.status, this.error});

  LoginResponse.fromJson(Map<String, dynamic>? json)
      : user = json != null && json['user'] != null ? User.fromJson(json['user']) : null,
        accessToken = json != null ? json['access_token'] : null,
        status = json != null ? json['status'] : null,
        error = json != null ? json['error']:null;

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'access_token': accessToken,
      'status': status,
    };
  }
}

