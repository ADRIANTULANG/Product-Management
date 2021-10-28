import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/spalshscreen/splashscreen_controller.dart';

class SplashScreen extends GetView<SplashscreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashscreenController());
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(controller.string.value),
      ),
    );
  }
}
