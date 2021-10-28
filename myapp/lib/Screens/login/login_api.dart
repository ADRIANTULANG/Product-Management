import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/Screens/login/login_model.dart';
import 'package:myapp/helpers/endpoints.dart';

class LoginApi {
// Future<List<User>>
  static Future<List<User>> get({
    required String username,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/login-user.php"),
        body: {
          "username": username,
          "password": password,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return userFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBus catch error $error');
      return Future.error(true);
    }
  }
}
