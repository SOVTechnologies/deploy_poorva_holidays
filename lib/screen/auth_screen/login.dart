import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text_black.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';

import '../widgets/container_button.dart';
import '../widgets/custom_text.dart';

class Login extends StatelessWidget {
  final String? lastLocation;
  Login({
    Key? key,
    this.lastLocation,
  }) : super(key: key);

  TextEditingController forgotEmail = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController registerController = Get.put(AuthController());

  bool isTextObs = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage('logo.png'),
            width: 250,
            height: 70,
          ),
          const SizedBox(
            height: 20,
          ),
          TextView(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              value: 'Email ID Or Number',
              customColor: ColorConstant.blackColor),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: ColorConstant.blueColor,
              ),
              isDense: true,
              //hintStyle: newMethod(),
              hintText: "Enter Email ID Or Number",
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorConstant.blueColor, width: 0.0),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextView(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              value: 'Password',
              customColor: ColorConstant.blackColor),
          Obx(
            () => TextField(
              controller: passwordController,
              obscureText: AuthController.authInstance.isTextObs.value,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.security,
                  color: ColorConstant.blueColor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    AuthController.authInstance.isTextObs.toggle();
                  },
                  child: Icon(
                    AuthController.authInstance.isTextObs.value == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorConstant.blueColor,
                  ),
                ),
                //hintStyle: newMethod(),
                hintText: "Enter Password",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorConstant.blueColor, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  contentPadding: const EdgeInsets.all(25),
                  title: "Email ID",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: forgotEmail,
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: ColorConstant.blueColor,
                          ),
                          //hintStyle: newMethod(),
                          hintText: "Enter EmailID",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.blueColor, width: 0.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ContainerButton(
                          onTap: () {
                            AuthController.authInstance
                                .forgotPassword(forgotEmail.text);
                          },
                          title: 'Update Password',
                          backGroundColor: ColorConstant.blueColor)
                      //
                    ],
                  ),
                );
              },
              child: TextView(
                  customColor: ColorConstant.blackColor,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value: 'Forgot Password')),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => registerController.isdataGeetingFetch == false
                ? ContainerButton(
                    onTap: () {
                      AuthController.authInstance.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          context,
                          lastLocation: lastLocation);
                    },
                    title: "Login",
                    backGroundColor: ColorConstant.blueColor)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
