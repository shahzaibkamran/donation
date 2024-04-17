class User {
  int id;
  String email;
  String? phoneNumber;
  String? firstName;
  String? error;

  User({required this.id, required this.email, this.phoneNumber, this.firstName,this.error});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        phoneNumber = json['phone_number'],
        firstName = json['first_name'],
        error = json['error'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone_number': phoneNumber,
      'first_name': firstName,
    };
  }
}
