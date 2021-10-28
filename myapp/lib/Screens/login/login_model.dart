// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.userid,
    required this.username,
    required this.password,
    required this.email,
  });

  String userid;
  String username;
  String password;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userid: json["userid"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "username": username,
        "password": password,
        "email": email,
      };
}
