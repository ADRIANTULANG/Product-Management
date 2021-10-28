import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:myapp/helpers/endpoints.dart';

class SplashScreenApi {
// Future<List<Bus>>
  static get({
    required String customerid,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getHistory.php"),
        body: {
          "customerid": customerid,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        // return historyFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getBus catch error $error');
      return Future.error(true);
    }
  }
}
