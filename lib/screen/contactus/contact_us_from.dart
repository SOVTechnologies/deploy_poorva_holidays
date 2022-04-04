import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/contacus_controller.dart';
import 'package:poorvaholiday/controller/country_controller.dart';
import 'package:poorvaholiday/controller/gender_controller.dart';
import 'package:poorvaholiday/models/contactus_errro_response.dart';
import 'package:poorvaholiday/models/country.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/screen/footer/footer.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsFrom extends StatelessWidget {
  var getXController = Get.put(ContactUsController());

  ContactUsFrom({Key? key}) : super(key: key);
  TextStyle newMethod() {
    return GoogleFonts.poppins(
        fontSize: 12,
        color: ColorConstant.blueColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              value: 'Name',
              customColor: ColorConstant.blueColor),
          TextField(
            controller: getXController.name,
            keyboardType: TextInputType.text,
            style: newMethod(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: ColorConstant.blueColor,
              ),
              hintStyle: newMethod(),
              hintText: "Enter Full Name",
              labelStyle: newMethod(),
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
              value: 'Email ID',
              customColor: ColorConstant.blueColor),
          TextField(
            controller: getXController.emailId,
            keyboardType: TextInputType.emailAddress,
            style: newMethod(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: ColorConstant.blueColor,
              ),
              hintStyle: newMethod(),
              hintText: "Enter Email ID",
              labelStyle: newMethod(),
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
              value: 'Mobile Number',
              customColor: ColorConstant.blueColor),
          TextField(
            controller: getXController.mobileNumber,
            keyboardType: TextInputType.number,
            style: newMethod(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                color: ColorConstant.blueColor,
              ),
              hintStyle: newMethod(),
              hintText: "Enter Mobile Number",
              labelStyle: newMethod(),
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
              value: 'Enter Location',
              customColor: ColorConstant.blueColor),
          GetX<CounrtyController>(
              init: CounrtyController(),
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: ColorConstant.blueColor)),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: ColorConstant.blueColor,
                    value: controller.countryList[0],
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    isDense: true,
                    style: newMethod(),
                    focusColor: ColorConstant.blueColor,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (data) {
                      getXController.location.text = data.toString();
                    },
                    items: controller.countryList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: TextView(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            value: value,
                            customColor: ColorConstant.blueColor),
                      );
                    }).toList(),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          TextView(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              value: 'Enter Message',
              customColor: ColorConstant.blueColor),
          TextField(
            controller: getXController.message,
            keyboardType: TextInputType.text,
            style: newMethod(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.messenger_sharp,
                color: ColorConstant.blueColor,
              ),
              hintStyle: newMethod(),
              labelStyle: newMethod(),
              hintText: "Enter Message",
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
          ContainerButton(
              onTap: () {
                getXController.contactUs();
              },
              title: "Submit",
              backGroundColor: ColorConstant.orangeColor)
        ],
      ),
    );
  }
}
