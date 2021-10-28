import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/homeview/home_api.dart';
import 'package:myapp/Screens/homeview/home_model.dart';
import 'package:myapp/helpers/sizer.dart';

class HomeController extends GetxController {
  // TextEditingController username = TextEditingController();
  // TextEditingController password = TextEditingController();
  // final box = GetStorage();
  RxList<Products> foodList = <Products>[].obs;
  RxList<Products> drinksList = <Products>[].obs;
  RxBool isLoading = true.obs;

  TextEditingController itemName = TextEditingController();
  TextEditingController itemDescription = TextEditingController();
  TextEditingController itemPrice = TextEditingController();

  TextEditingController updateitemName = TextEditingController();
  TextEditingController updateitemDescription = TextEditingController();
  TextEditingController updateitemPrice = TextEditingController();

  @override
  void onInit() async {
    await getFood();
    await getDrinks();
    isLoading(false);
    super.onInit();
  }

  Future<void> getFood() async {
    try {
      var result = await HomeApi.GetProduct(itemType: "Food");
      foodList.assignAll(result.reversed);
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  Future<void> getDrinks() async {
    try {
      var result = await HomeApi.GetProduct(itemType: "Drinks");
      drinksList.assignAll(result.reversed);
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  addProduct(
      {required String productname,
      required String productDescription,
      required String productPrice,
      required String itemType}) async {
    try {
      var result = await HomeApi.addProduct(
          productname: productname,
          productDescription: productDescription,
          productPrice: productPrice,
          itemType: itemType);
      print(result);
      if (result == true) {
        if (itemType == "Food") {
          getFood();
        } else {
          getDrinks();
        }

        Get.back();
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Unsuccessful Operation",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  updateItem(
      {required String productname,
      required String productDescription,
      required String productPrice,
      required String itemType,
      required String itemID}) async {
    try {
      var result = await HomeApi.updateItem(
          itemID: itemID,
          productname: productname,
          productDescription: productDescription,
          productPrice: productPrice,
          itemType: itemType);
      print(result);
      if (result == true) {
        if (itemType == "Food") {
          getFood();
        } else {
          getDrinks();
        }
        Get.back();
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Unsuccessful Operation",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  deleteItem({required String itemType, required String itemID}) async {
    try {
      var result = await HomeApi.deleteItem(itemID: itemID, itemType: itemType);
      print(result);
      if (result == true) {
        if (itemType == "Food") {
          getFood();
        } else {
          getDrinks();
        }
        Get.back();
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Unsuccessful Operation",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  void showDialog(
      {required String itemType,
      required String itemName,
      required String itemPrice,
      required String itemDescription,
      required String itemID}) {
    updateitemName.text = itemName;
    updateitemPrice.text = itemPrice;
    updateitemDescription.text = itemDescription;

    var context = Get.context;
    var s = Sizer();
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Update Product',
                textAlign: TextAlign.center,
                style: TextStyle(
                    // fontFamily: 'Rubik',
                    fontSize: s.font(context: context, fontsize: 20),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: s.width(context: context, width: 3),
                    right: s.width(context: context, width: 3)),
                child: TextFormField(
                  controller: updateitemName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    // prefixIcon: Icon(Icons.label),
                    hintText: "Product name",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: s.height(context: context, height: 1),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: s.width(context: context, width: 3),
                    right: s.width(context: context, width: 3)),
                child: TextFormField(
                  maxLines: 3,
                  controller: updateitemDescription,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    // prefixIcon: Icon(Icons.label),
                    hintText: "Description",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: s.height(context: context, height: 1),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: s.width(context: context, width: 3),
                    right: s.width(context: context, width: 3)),
                child: TextFormField(
                  controller: updateitemPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    // prefixIcon: Icon(Icons.label),
                    hintText: "Price",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Rubik',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateItem(
                            productname: updateitemName.text,
                            productDescription: updateitemDescription.text,
                            productPrice: updateitemPrice.text,
                            itemType: itemType,
                            itemID: itemID);
                      },
                      child: Text(
                        'UPDATE',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Rubik',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void deleteConfirmation({required String itemType, required String itemID}) {
    var context = Get.context;
    var s = Sizer();
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Do you wish to delete this item?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    // fontFamily: 'Rubik',
                    fontSize: s.font(context: context, fontsize: 20),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Rubik',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteItem(itemType: itemType, itemID: itemID);
                      },
                      child: Text(
                        'CONFIRM',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Rubik',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void modalBottomSheet({required String itemType}) {
    itemName.clear();
    itemPrice.clear();
    itemDescription.clear();
    var s = Sizer();
    var context = Get.context;
    Get.bottomSheet(
      SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                left: s.width(
                  context: context,
                  width: 5,
                ),
                right: s.width(context: context, width: 5)),
            height: s.height(context: Get.context, height: 50),
            // color: Colors.red,
            child: Column(
              children: [
                SizedBox(
                  height: s.height(context: context, height: 3),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Add Product ($itemType)",
                    style: TextStyle(
                        fontSize: s.font(context: context, fontsize: 20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: s.height(context: context, height: 3),
                ),
                Container(
                  child: TextFormField(
                    controller: itemName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      // prefixIcon: Icon(Icons.label),
                      hintText: "Product name",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height(context: context, height: 3),
                ),
                Container(
                  child: TextFormField(
                    maxLines: 3,
                    controller: itemDescription,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      // prefixIcon: Icon(Icons.label),
                      hintText: "Description",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height(context: context, height: 3),
                ),
                Container(
                  child: TextFormField(
                    controller: itemPrice,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      // prefixIcon: Icon(Icons.label),
                      hintText: "Price",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height(context: context, height: 1),
                ),
                Container(
                  // margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      onSurface: Colors.red,
                    ),
                    onPressed: () {
                      if (itemPrice.text.isEmpty ||
                          itemDescription.text.isEmpty ||
                          itemName.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Missing Input",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        addProduct(
                            productname: itemName.text,
                            productDescription: itemDescription.text,
                            productPrice: itemPrice.text,
                            itemType: itemType);
                      }
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
