import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/auth_screen/loggedIn.dart';
import 'package:poorvaholiday/screen/auth_screen/register.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/auth_screen/login.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';

class PoorvaAppBar extends StatefulWidget {
  const PoorvaAppBar({Key? key}) : super(key: key);

  @override
  _PoorvaAppBarState createState() => _PoorvaAppBarState();
}

class _PoorvaAppBarState extends State<PoorvaAppBar> {
  AuthController registerController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.blueColor,
      child: Row(
        children: [
          const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: PoorvaLogo()),

          //const PoorvaLogo(),
          const Spacer(),
          GestureDetectorText(
            fontSize: 16,
            value: "Tour",
            onPressed: () {
              Get.toNamed(Routes.home);
            },
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetectorText(
            fontSize: 16,
            value: "About Us",
            onPressed: () {
              Get.toNamed(Routes.aboutus);
            },
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetectorText(
            fontSize: 16,
            value: "Contact Us",
            onPressed: () {
              Get.toNamed(Routes.contactus);
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Obx(
            () => registerController.dataAvailable == true
                ? buildPostLoign()
                : Row(
                    children: [
                      buildLogin(),
                      const SizedBox(
                        width: 20,
                      ),
                      buildRegister(),
                    ],
                  ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }

  GestureDetector buildPostLoign() {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
            content: LoggedIN(),
            radius: 0.0,
            title: "",
            contentPadding: EdgeInsets.zero);
      },
      child: CircleAvatar(
        backgroundColor: ColorConstant.orangeColor,
        child: registerController.isdataGeetingFetch == true
            ? const Center(child: CircularProgressIndicator())
            : TextView(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                value: "PH",
                customColor: ColorConstant.whiteColor),
      ),
    );
  }

  GestureDetectorText buildLogin() {
    return GestureDetectorText(
        fontSize: 16,
        value: "Login",
        onPressed: () {
          Get.defaultDialog(
              radius: 0.0,
              title: "",
              contentPadding: EdgeInsets.zero,
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerBoxradiusDecorations(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextView(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            value: "Welcome to \nPoorva Holiday",
                            customColor: ColorConstant.whiteColor),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  Login()
                ],
              ));
        });
  }

  GestureDetectorText buildRegister() {
    return GestureDetectorText(
        fontSize: 16,
        value: "Register",
        onPressed: () {
          Get.defaultDialog(
              radius: 0.0,
              title: "",
              contentPadding: EdgeInsets.zero,
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerBoxradiusDecorations(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextView(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            value: "Register with \nPoorva Holiday",
                            customColor: ColorConstant.whiteColor),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  RegisterScreen()
                ],
              ));
        });
  }
}
