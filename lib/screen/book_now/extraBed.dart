import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/add_traveller_controller.dart';
import 'package:poorvaholiday/controller/booking_controller.dart';
import 'package:poorvaholiday/controller/extra_bed_controller.dart';
import 'package:poorvaholiday/controller/gender_controller.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class ExtraBed extends StatefulWidget {
  ExtraBed({
    Key? key,
  }) : super(key: key);

  @override
  State<ExtraBed> createState() => _ExtraBedState();
}

class _ExtraBedState extends State<ExtraBed> {
  TextEditingController fname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController pancardController = TextEditingController();

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
        dob.text == '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
        bookingController.bookingExtraBedDetails.extraBedDOB = dob.text;
      } else {
        bookingController.bookingExtraBedDetails.extraBedDOB = '';
        dob.text = '';
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                    controller: fname,
                    onChanged: (value) {
                      bookingController.bookingExtraBedDetails.extraBedName =
                          value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: ColorConstant.blueColor,
                      ),
                      hintStyle: newMethod(),
                      hintText: "Enter Name",
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
                            bookingController.bookingExtraBedDetails
                                .extraBedGender = data.toString();
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
            const SizedBox(
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
        const SizedBox(
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
                      value: "Your Pancard",
                      customColor: ColorConstant.blackColor),
                  TextField(
                    controller: pancardController,
                    onChanged: (value) {
                      bookingController.bookingExtraBedDetails.extraBedPanCard =
                          value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.portrait_rounded,
                        color: ColorConstant.blueColor,
                      ),
                      hintStyle: newMethod(),
                      hintText: "Enter Pancard Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
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
