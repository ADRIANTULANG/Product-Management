import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/homeview/home_tabbar_View.dart';
import 'package:myapp/Screens/login/login_api.dart';
import 'package:myapp/Screens/login/login_model.dart';
import 'package:myapp/helpers/storage.dart';

class LoginController extends GetxController {
  TextEditingController conUserId = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  RxList<User> userInfo = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      var result = await LoginApi.get(
        username: conUserId.text,
        password: conPassword.text,
      );

      userInfo.assignAll(result);
      if (userInfo.length != 0) {
        print("store data");
        Get.find<StorageService>().storeUserCredentials(
            userid: userInfo[0].userid,
            password: userInfo[0].password,
            username: userInfo[0].username,
            email: userInfo[0].email);
        Get.offAll(() => HomeView());
      } else {
        Fluttertoast.showToast(
            msg: "Invalid User!",
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
}
