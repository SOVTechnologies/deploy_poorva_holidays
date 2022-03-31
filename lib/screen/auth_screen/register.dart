import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';

import '../widgets/container_button.dart';
import '../widgets/custom_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimPassword = TextEditingController();
  AuthController registerController = Get.put(AuthController());

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
            controller: name,
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
              controller: password,
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
          // TextField(
          //   controller: password,
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.security,color: ColorConstant.blueColor,),
          //     isDense: true,
          //     //hintStyle: newMethod(),
          //     hintText: "Enter Password",
          //     enabledBorder: OutlineInputBorder(
          //       borderSide:
          //           BorderSide(color: ColorConstant.blueColor, width: 0.0),
          //     ),
          //     border: const OutlineInputBorder(),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          TextView(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              value: 'Confrim Password',
              customColor: ColorConstant.blackColor),
          Obx(
            () => TextField(
              controller: confrimPassword,
              obscureText: AuthController.authInstance.isTextConfrim.value,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.security,
                  color: ColorConstant.blueColor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    AuthController.authInstance.isTextConfrim.toggle();
                  },
                  child: Icon(
                    AuthController.authInstance.isTextConfrim.value == true
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

          const SizedBox(
            height: 20,
          ),
          Obx(
            () => registerController.isdataGeetingFetch == false
                ? ContainerButton(
                    onTap: () {
                      AuthController.authInstance
                          .register(name.text.trim(), password.text.trim(),confrimPassword.text.trim());
                    },
                    title: "Register",
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
