// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore, deprecated_member_use, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/Comm/genTextFormField.dart';
import 'package:myapp/Screens/login/login_controller.dart';
import 'package:myapp/Screens/signup/Singup_view.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      // appBar: AppBar(
      //   // ignore: prefer_const_constructors
      //   title: Text('Login with Signup'),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200.0),
                Text(
                  'Login with Signup',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40.0),
                ),
                SizedBox(height: 10.0),
                Image.asset(
                  "assets/images/logo.png",
                  height: 150.0,
                  width: 150.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Sample Code',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 25.0),
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: controller.conUserId,
                  icon: Icons.person,
                  hintName: 'User',
                  inputType: TextInputType.name,
                ),
                SizedBox(height: 5.0),
                getTextFormField(
                  controller: controller.conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                  inputType: TextInputType.name,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('DOes not have account? '),
                      // ignore: deprecated_member_use
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text('Signup'),
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => SignupForm()));
                          Get.to(() => SignupForm());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
