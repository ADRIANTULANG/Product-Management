// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    required this.itemid,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.itemType,
  });

  String itemid;
  String itemName;
  String itemDescription;
  String itemPrice;
  String itemType;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        itemid: json["itemid"],
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        itemPrice: json["itemPrice"],
        itemType: json["itemType"],
      );

  Map<String, dynamic> toJson() => {
        "itemid": itemid,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "itemPrice": itemPrice,
        "itemType": itemType,
      };
}
