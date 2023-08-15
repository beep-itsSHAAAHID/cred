// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());

class UserModel {
  String name;
  String email;
  String phone;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["age"],
    phone: json["mark"],
      password:json["password"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": email,
    "mark": phone,
    "password":password
  };
}
