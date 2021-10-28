import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/Screens/homeview/home_model.dart';
import 'package:myapp/helpers/endpoints.dart';

class HomeApi {
// Future<List<Products>>
  static Future<List<Products>> GetProduct({
    required String itemType,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/get-products.php"),
        body: {
          "itemType": itemType,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return productsFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('GetProduct catch error $error');
      return Future.error(true);
    }
  }

  static addProduct(
      {required String productname,
      required String productDescription,
      required String productPrice,
      required String itemType}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/addItem.php"),
        body: {
          "itemType": itemType,
          "itemName": productname,
          "itemDescription": productDescription,
          "itemPrice": productPrice,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return true;
        // return productsFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('addProduct catch error $error');
      return Future.error(true);
    }
  }

  static updateItem(
      {required String productname,
      required String productDescription,
      required String productPrice,
      required String itemType,
      required String itemID}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/updateItem.php"),
        body: {
          "itemType": itemType,
          "itemName": productname,
          "itemDescription": productDescription,
          "itemPrice": productPrice,
          "itemid": itemID
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return true;
        // return productsFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('updateItem catch error $error');
      return Future.error(true);
    }
  }

  static deleteItem({required String itemType, required String itemID}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/deleteItem.php"),
        body: {"itemid": itemID},
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print('getHistory code ${response.statusCode}');
      // print('getHistory body ${response.body}');
      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return true;
        // return productsFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('updateItem catch error $error');
      return Future.error(true);
    }
  }
}
