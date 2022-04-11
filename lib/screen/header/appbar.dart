import 'package:beamer/beamer.dart';
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
import 'package:poorvaholiday/screen/auth_screen/login.dart';
import 'package:poorvaholiday/screen/auth_screen/register.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';

class PoorvaAppBar extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isShowlogo;
  final Color? shortBackground;
  const PoorvaAppBar({
    Key? key,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.isShowlogo = true,
    this.shortBackground,
  }) : super(key: key);

  @override
  _PoorvaAppBarState createState() => _PoorvaAppBarState();
}

class _PoorvaAppBarState extends State<PoorvaAppBar> {
  AuthController registerController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: widget.shortBackground == null
          ? widget.padding
          : const EdgeInsets.only(left: 20),
      color: widget.backgroundColor ?? Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isShowlogo
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: const MouseRegion(
                      cursor: SystemMouseCursors.click, child: PoorvaLogo()),
                )
              : Container(),
          widget.shortBackground != null
              ? Container(
                  color: widget.shortBackground ?? ColorConstant.blueColor,
                  padding: widget.padding,
                  child: buildNavItems(context))
              : buildNavItems(context)
        ],
      ),
    );
  }

  buildNavItems(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetectorText(
          fontSize: 16,
          textColor: widget.textColor ?? Colors.white,
          value: "Home",
          onPressed: () {
            Beamer.of(context).beamToNamed(Routes.home);
          },
          herf: Routes.home,
        ),
        GestureDetectorText(
          fontSize: 16,
          value: "Contact Us",
          textColor: widget.textColor ?? Colors.white,
          onPressed: () {
            Beamer.of(context).beamToNamed(Routes.contactus);
          },
          herf: Routes.aboutus,
        ),
        Obx(
          () => registerController.dataAvailable == true
              ? buildPostLoign()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetectorText(
                      fontSize: 16,
                      value: "Login",
                      textColor: widget.textColor ?? Colors.white,
                      onPressed: () {
                        BeamState beamState = Beamer.of(context)
                            .currentBeamLocation
                            .state as BeamState;
                        // print(beamState.uri.toString());
                        final lastLocation = beamState.uriBlueprint;
                        print(lastLocation.toString());
                        Beamer.of(context).beamToNamed(
                          '${Routes.authentication}?type=Login',
                          data: lastLocation,
                        );
                      },
                      herf: '${Routes.authentication}?type=Login',
                    ),
                    GestureDetectorText(
                      fontSize: 16,
                      value: "Register",
                      textColor: widget.textColor ?? Colors.white,
                      onPressed: () {
                        Beamer.of(context).beamToNamed(
                            '${Routes.authentication}?type=Register');
                      },
                      herf: '${Routes.authentication}?type=Register',
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  GestureDetector buildPostLoign() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: LoggedIN(),
              );
            });
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
      textColor: widget.textColor ?? Colors.white,
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
      },
      herf: '',
    );
  }

  GestureDetectorText buildRegister() {
    return GestureDetectorText(
      fontSize: 16,
      value: "Register",
      textColor: widget.textColor ?? Colors.white,
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
      },
      herf: '',
    );
  }
}
