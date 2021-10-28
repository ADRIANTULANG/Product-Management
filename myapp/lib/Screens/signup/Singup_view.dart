// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Comm/genTextFormField.dart';
// import 'package:myapp/Screens/login/Login_View.dart';
import 'package:myapp/Screens/signup/singup_controller.dart';

class SignupForm extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      // appBar: AppBar(
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
                // genLoginSignupHeader('Login with Signup'),
                SizedBox(height: 150.0),
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
                // getTextFormField(
                //   controller: _conUserId,
                //   icon: Icons.person,
                //   hintName: 'User ID',
                //   inputType: TextInputType.none,
                // ),
                SizedBox(height: 5.0),
                getTextFormField(
                    controller: controller.conUserName,
                    icon: Icons.person_outline,
                    inputType: TextInputType.name,
                    hintName: 'User Name'),
                SizedBox(height: 5.0),
                getTextFormField(
                  controller: controller.conEmail,
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                  hintName: 'Email',
                ),
                SizedBox(height: 5.0),
                getTextFormField(
                  controller: controller.conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                  inputType: TextInputType.name,
                ),
                SizedBox(height: 5.0),
                getTextFormField(
                  controller: controller.conCPassword,
                  icon: Icons.lock,
                  hintName: 'Confirm Password',
                  isObscureText: true,
                  inputType: TextInputType.name,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      controller.checkIfAccountMaking();
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do you have an account? '),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text('Sign In'),
                        onPressed: () {
                          Get.back();
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
