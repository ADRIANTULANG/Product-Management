import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/spalshscreen/splashscreen_controller.dart';
import 'package:myapp/helpers/sizer.dart';

class SplashScreen extends GetView<SplashscreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = Sizer();
    Get.put(SplashscreenController());
    return Scaffold(
      body: Center(
        child: Container(
          height: s.height(context: context, height: 30),
          width: s.width(context: context, width: 20),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/logo.png",
            height: s.height(context: context, height: 30),
            width: s.width(context: context, width: 20),
          ),
        ),
      ),
    );
  }
}
