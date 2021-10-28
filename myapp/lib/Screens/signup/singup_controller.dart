import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/Screens/signup/singup_api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpController extends GetxController {
  final box = GetStorage();
  final TextEditingController conUserName = TextEditingController();
  final TextEditingController conEmail = TextEditingController();
  final TextEditingController conPassword = TextEditingController();
  final TextEditingController conCPassword = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  checkIfAccountMaking() {
    if (conPassword.text == conCPassword.text) {
      singup();
    } else if (!conEmail.text.isEmail) {
      Fluttertoast.showToast(
          msg: "Invalid Email!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Password does not match!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> singup() async {
    try {
      var result = await SignupApi.addUser(
        username: conUserName.text,
        password: conPassword.text,
        email: conEmail.text,
      );
      print(result);
      Get.back();
      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (error) {
      if (error == true) {}
    } finally {}
  }
}
