import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/controller/news_controller.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import '../../../constant/color_constant.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  State<NewsLetter> createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  TextEditingController message = TextEditingController();
  var getXController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                value: "Subscribe to our NEWS",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                customColor: ColorConstant.blueColor,
              ),
              Expanded(
                child: TextField(
                  controller: message,
                  style: GoogleFonts.poppins(
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1,
                      wordSpacing: 1),
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorConstant.blueColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorConstant.blueColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorConstant.blueColor,
                          width: 1.0,
                        ),
                      ),
                      hintText: "Enter Email",
                      hintStyle: GoogleFonts.poppins(
                          color: ColorConstant.blueColor,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1,
                          wordSpacing: 1)),
                ),
              ),
            ],
          )),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ContainerButton(
                height: 50,
                onTap: () {
                  getXController
                      .contactUs(Api.mainUrl + Api.newsletter, message.text)
                      .then((value) {
                    int code = value.statusCode;
                    if (code == 200 || code == 201) {
                      message.text = "";
                      Get.defaultDialog(
                          title: "Success",
                          middleText: "You have successfully subscribe!!!");
                    }
                  });
                },
                title: "Submit",
                backGroundColor: ColorConstant.blueColor),
          ),
        ],
      ),
    );
  }
}
