import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/controller/booking_controller.dart';
import 'package:poorvaholiday/controller/gender_controller.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key? key}) : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController firstName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController pancard = TextEditingController();
  TextEditingController emailID = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController specialRequest = TextEditingController();
  AuthController authController = Get.put(AuthController());
  BookingController bookingController = Get.put(BookingController());

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: currentDate);
    if (pickedDate != null && pickedDate != currentDate) {
      if (DateTime.now().difference(pickedDate) > const Duration(days: 6570)) {
        dob.text = '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
        bookingController.bookingPersonalDetails.personalDOB = dob.text;
      } else {
        dob.text = "";
        bookingController.bookingPersonalDetails.personalDOB = "";
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      if (auth.currentUser.isNull) {
        emailID.text = '';
        bookingController.bookingPersonalDetails.personalEmail = '';
      } else {
        emailID.text = authController.firebaseUser.value!.email!;
        bookingController.bookingPersonalDetails.personalEmail =
            authController.firebaseUser.value!.email!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextView(
            style: TextView.headerStyle(
              size: 20,
              weight: FontWeight.bold,
              color: ColorConstant.blueColor,
            ),
            value: "Personal Details",
            customColor: ColorConstant.blackColor),
        TextView(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            value:
                "*All communication would be sent to this traveller. Age must be more than 18 years",
            customColor: ColorConstant.blackColor),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: "Your Name(Same as Pancard)",
                      customColor: ColorConstant.blackColor),
                  TextField(
                    controller: firstName,
                    onChanged: (value) {
                      bookingController.bookingPersonalDetails.personalName =
                          value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: ColorConstant.blueColor,
                      ),
                      hintStyle: newMethod(),
                      hintText: "Enter First Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: "Gender",
                      customColor: ColorConstant.blackColor),
                  GetX<GenderController>(
                      init: GenderController(),
                      builder: (controller) {
                        return DropdownButtonFormField<String>(
                          value: controller.spinnerItems[0],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          icon: const Icon(Icons.arrow_drop_down),
                          style: newMethod(),
                          onChanged: (data) {
                            bookingController.bookingPersonalDetails
                                .personalGender = data.toString();
                          },
                          items: controller.spinnerItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: TextView(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  value: value,
                                  customColor: ColorConstant.blackColor),
                            );
                          }).toList(),
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: "Date Of Birth",
                      customColor: ColorConstant.blackColor),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: TextField(
                        controller: dob,
                        enabled: false,
                        style: newMethod(),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: ColorConstant.blueColor,
                            ),
                            hintStyle: newMethod(),
                            hintText: "Date Of Birth",
                            border: OutlineInputBorder())),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: "Your Email",
                      customColor: ColorConstant.blackColor),
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailID,
                      onChanged: (value) {
                        bookingController.bookingPersonalDetails.personalEmail =
                            value;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: ColorConstant.blueColor,
                          ),
                          hintStyle: newMethod(),
                          hintText: "Enter Email",
                          border: OutlineInputBorder())),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: "Your Pancard",
                      customColor: ColorConstant.blackColor),
                  TextField(
                      controller: pancard,
                      onChanged: (value) {
                        bookingController
                            .bookingPersonalDetails.personalPanCard = value;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.portrait_rounded,
                            color: ColorConstant.blueColor,
                          ),
                          hintStyle: newMethod(),
                          hintText: "Enter Pancard Number",
                          border: OutlineInputBorder())),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: "Your Mobile Number",
                      customColor: ColorConstant.blackColor),
                  TextField(
                      keyboardType: TextInputType.number,
                      controller: mobileNumber,
                      onChanged: (value) {
                        bookingController.bookingPersonalDetails
                            .personalMobileNumber = value;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: ColorConstant.blueColor,
                          ),
                          hintStyle: newMethod(),
                          hintText: "Enter Mobile Number",
                          border: OutlineInputBorder())),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                value: "Special Request",
                customColor: ColorConstant.blackColor),
            TextField(
                controller: specialRequest,
                onChanged: (value) {
                  bookingController.bookingPersonalDetails.personalSuggestion =
                      value;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.message,
                      color: ColorConstant.blueColor,
                    ),
                    hintStyle: newMethod(),
                    hintText: "Special Request",
                    border: OutlineInputBorder())),
          ],
        )
      ],
    );
  }

  TextStyle newMethod() {
    return GoogleFonts.poppins(
        fontSize: 12,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 1);
  }
}
