import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/add_traveller_controller.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  final genderController = Get.put(AddTravelerController());
  DateTime currentDate = DateTime.now();
  String myDate = '01/01/2020';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      // setState(() {
      //   currentDate = pickedDate;
      //   myDate.text =
      //       '${currentDate.day}/${currentDate.month}/${currentDate.year}';
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const PoorvaAppBar(),
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
      ),
      body: ContainerImageDecorations(
          imageName: 'egypt.jpeg',
          child: Container(
            margin:
                const EdgeInsets.only(top: 20, bottom: 20, right: 50, left: 50),
            child: Column(
              children: [
                ContainerBoxradiusDecorations(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      value: "Gender",
                                      customColor: ColorConstant.whiteColor),
                                  GetX<AddTravelerController>(builder: (controller) {
                                    return DropdownButtonFormField<String>(
                                      value: controller.spinnerItems[0],
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onChanged: (data) {
                                        genderController
                                            .setselectioin(data.toString());
                                      },
                                      items: controller.spinnerItems
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: TextView(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              value: value,
                                              customColor:
                                                  ColorConstant.whiteColor),
                                        );
                                      }).toList(),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      value: "Date Of Birth",
                                      customColor: ColorConstant.whiteColor),
                                  const SizedBox(height: 8,),    
                                  GestureDetector(
                                    onTap: () => _selectDate(context),
                                    child: TextView(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        value: myDate,
                                        customColor: ColorConstant.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                              width: 200,
                              child: ContainerButton(
                                  onTap: () {},
                                  title: "Search",
                                  backGroundColor: ColorConstant.orangeColor)),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)))
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          opacity: 0,
          borderRadius: BorderRadius.zero),
    );
  }

  TextStyle newMethod() {
    return GoogleFonts.poppins(
        fontSize: 12,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 1);
  }
}
