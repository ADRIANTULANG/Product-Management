import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/Screens/homeview/home_tabbar_View.dart';
import 'package:myapp/Screens/login/Login_View.dart';

class SplashscreenController extends GetxController {
  RxString string = "SplashScreen".obs;
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    initializeCheckUser();
  }

  initializeCheckUser() {
    Timer(Duration(seconds: 3), () {
      if (box.read('userid') == null) {
        Get.offAll(() => LoginForm());
      } else {
        Get.offAll(() => HomeView());
      }
    });
  }

  // Future<void> login() async {
  //   try {
  //     var result = await LoginApi.loginApi(
  //       username: username.text,
  //       password: password.text,
  //     );
  //     userInfo.assignAll(result);
  //     if (userInfo.length != 0) {
  //       Get.find<StorageService>().storeUserCredentials(
  //           userid: userInfo[0].userid,
  //           fullname: userInfo[0].fullname,
  //           password: userInfo[0].password,
  //           username: userInfo[0].username,
  //           contactnumber: userInfo[0].contactnumber);
  //       Get.offAll(() => HomeView());
  //     }
  //   } catch (error) {
  //     if (error == true) {}
  //   } finally {}
  // }
}
