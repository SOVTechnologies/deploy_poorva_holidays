import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/add_traveller_controller.dart';
import 'package:poorvaholiday/controller/booking_controller.dart';
import 'package:poorvaholiday/controller/child_controller.dart';
import 'package:poorvaholiday/controller/gender_controller.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class ChildDetails extends StatefulWidget {
  ChildDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  TextEditingController myDate = TextEditingController();
  TextEditingController name = TextEditingController();
  BookingController bookingController = Get.put(BookingController());

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: currentDate);
    if (pickedDate != null && pickedDate != currentDate) {
      if (DateTime.now().difference(pickedDate) > const Duration(days: 4015)) {
        bookingController.bookingChildDetails.childDOB =
            '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
        myDate.text =
            '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      } else {
        bookingController.bookingChildDetails.childDOB = '';
        myDate.text = '';
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
                      value: "Your Name",
                      customColor: ColorConstant.blackColor),
                  TextField(
                    controller: name,
                    onChanged: (value) {
                      bookingController.bookingChildDetails.childName = value;
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
                            bookingController.bookingChildDetails.childGender =
                                data.toString();
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
                        controller: myDate,
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
