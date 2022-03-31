import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';
import 'package:poorvaholiday/controller/add_traveller_controller.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/controller/country_controller.dart';
import 'package:poorvaholiday/controller/gender_controller.dart';
import 'package:poorvaholiday/controller/profile_controller.dart';
import 'package:poorvaholiday/controller/user_booking_controller.dart';
import 'package:poorvaholiday/controller/user_controller.dart';
import 'package:poorvaholiday/models/poorvauser.dart';
import 'package:poorvaholiday/models/user.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/custom_divider.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text_black.dart';

class LoggedIN extends StatelessWidget {
  LoggedIN({Key? key}) : super(key: key);

  List<Widget> widgetList = [
    PersonalDetails(),
    DocumentDetails(),
    TripDetails(),
    Container(),
    ChangePassword(),
  ];

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 410,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: profileController.i.value == 0
                              ? ColorConstant.blueColor
                              : ColorConstant.orangeColor,
                          radius: 3,
                        ),
                        GestureDetectorTextBlack(
                            value: "Personal Details",
                            onPressed: () {
                              profileController.onClick(0);
                            }),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: profileController.i.value == 2
                              ? ColorConstant.blueColor
                              : ColorConstant.orangeColor,
                          radius: 3,
                        ),
                        GestureDetectorTextBlack(
                            value: "Trip Details",
                            onPressed: () {
                              profileController.onClick(2);
                            }),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: profileController.i.value == 4
                              ? ColorConstant.blueColor
                              : ColorConstant.orangeColor,
                          radius: 3,
                        ),
                        GestureDetectorTextBlack(
                            value: "Change Password",
                            onPressed: () {
                              profileController.onClick(4);
                            }),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: profileController.i.value == 4
                              ? ColorConstant.blueColor
                              : ColorConstant.orangeColor,
                          radius: 3,
                        ),
                        GestureDetectorTextBlack(
                            value: "Sign Out",
                            onPressed: () {
                              AuthController.authInstance.signOut();
                            }),
                      ],
                    ),
                  ),
                ],
              )),
          CustomDivier(
              width: 2,
              height: 400,
              customColor: ColorConstant.blueColor,
              edgeInsets: EdgeInsets.all(5)),
          Obx(
            () => Expanded(
                flex: 2,
                child: SingleChildScrollView(
                    child: widgetList[profileController.i.value])),
          )
        ],
      ),
    );
  }
}

class TripDetails extends StatelessWidget {
  TripDetails({Key? key}) : super(key: key);
  UserBookingController userBookingController =
      Get.put(UserBookingController());
  @override
  Widget build(BuildContext context) {
    userBookingController.getAllBooking(auth.currentUser!.uid);
    return Obx(
      () => userBookingController.dataAvailable == true
          ? SizedBox(
              width: 500,
              height: 500,
              child: ListView.builder(
                itemCount: userBookingController.userbooking.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                value: 'Package ID :${userBookingController.userbooking[index].bookingPackageId}',
                                customColor: ColorConstant.blueColor),
                            Spacer(),
                            TextView(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                value: '${userBookingController.userbooking[index].bookingMethod}',
                                customColor: ColorConstant.blueColor),
                            Spacer(),
                            TextView(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                value: '${userBookingController.userbooking[index].bookingStatus}',
                                customColor: ColorConstant.blueColor),
                          ],
                        ),
                        SizedBox(width: 20,),
                        TextView(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            value: 'Date : ${userBookingController.userbooking[index].bookingDate}',
                            customColor: ColorConstant.blueColor),
                      ],
                    ),
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  TextStyle newMethod() {
    return GoogleFonts.poppins(
        fontSize: 12,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 1);
  }

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  AuthController registerController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Old Passowrd",
              customColor: ColorConstant.blackColor),
          TextField(
            controller: oldPassword,
            obscureText: true,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintStyle: newMethod(),
              hintText: "Enter Old Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your New Password",
              customColor: ColorConstant.blackColor),
          TextField(
            controller: newPassword,
            obscureText: true,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintStyle: newMethod(),
              hintText: "Enter New Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => registerController.isdataGeetingFetch == false
                ? ContainerButton(
                    onTap: () {
                      AuthController.authInstance
                          .changePassword(oldPassword.text, newPassword.text);
                    },
                    title: 'Update Password',
                    backGroundColor: ColorConstant.blueColor)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          )
        ],
      ),
    );
  }
}

class DocumentDetails extends StatelessWidget {
  DocumentDetails({Key? key}) : super(key: key);
  TextStyle newMethod() {
    return GoogleFonts.poppins(
        fontSize: 12,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 1);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(
            height: 30,
          ),
          ContainerButton(
              onTap: () {},
              title: 'Submit',
              backGroundColor: ColorConstant.blueColor)
        ],
      ),
    );
  }
}


class PersonalDetails extends StatelessWidget {
  UserController userController = Get.put(UserController());

  PersonalDetails({Key? key}) : super(key: key);

  TextStyle newMethod() {
    return GoogleFonts.poppins(
        fontSize: 12,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        wordSpacing: 1);
  }

  @override
  Widget build(BuildContext context) {

    userController.getUserByID(auth.currentUser!.uid);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your Name",
              customColor: ColorConstant.blackColor),
          TextField(
            controller: userController.firstName,
            onChanged: (value) {},
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: newMethod(),
              hintText: "Enter Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your Mobile Number",
              customColor: ColorConstant.blackColor),
          TextField(
              keyboardType: TextInputType.number,
              controller: userController.mobileNumber,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintStyle: newMethod(),
                  hintText: "Enter Mobile Number",
                  border: OutlineInputBorder())),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  value: "Your Email",
                  customColor: ColorConstant.blackColor),
              Spacer(),
              GestureDetector(
                onTap: () {
                  AuthController.authInstance.verifyEmail();
                },
                child: TextView(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    value: auth.currentUser!.emailVerified == false
                        ? "Not Verified"
                        : "Verified",
                    customColor: ColorConstant.blackColor),
              ),
            ],
          ),
          TextField(
              keyboardType: TextInputType.emailAddress,
              controller: userController.emailID,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintStyle: newMethod(),
                  hintText: "Enter Email",
                  border: OutlineInputBorder())),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Date Of Birth",
              customColor: ColorConstant.blackColor),
          GestureDetector(
            onTap: () => userController.selectDate(context),
            child: TextField(
                controller: userController.myDate,
                enabled: false,
                style: newMethod(),
                decoration: InputDecoration(
                    hintStyle: newMethod(),
                    hintText: "Date Of Birth",
                    border: OutlineInputBorder())),
          ),
          SizedBox(
            height: 30,
          ),
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
                    userController.userSelectedGender =
                        data.toString().toLowerCase();
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
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your City",
              customColor: ColorConstant.blackColor),
          TextField(
            controller: userController.city,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: newMethod(),
              hintText: "Enter City",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your PAN Number",
              customColor: ColorConstant.blackColor),
          TextField(
            controller: userController.panNumber,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintStyle: newMethod(),
              hintText: "Enter Pan Number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your Adhaar Number",
              customColor: ColorConstant.blackColor),
          TextField(
              controller: userController.adhaarNumber,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintStyle: newMethod(),
                  hintText: "Enter Adhaar Number",
                  border: OutlineInputBorder())),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your Passport Number",
              customColor: ColorConstant.blackColor),
          TextField(
              controller: userController.passportNumber,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintStyle: newMethod(),
                  hintText: "Enter Passport Number",
                  border: OutlineInputBorder())),
          SizedBox(
            height: 30,
          ),
          TextView(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              value: "Your Driving License",
              customColor: ColorConstant.blackColor),
          TextField(
              controller: userController.drivingLicense,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintStyle: newMethod(),
                  hintText: "Enter Driving License",
                  border: OutlineInputBorder())),
          SizedBox(
            height: 30,
          ),
          ContainerButton(
              onTap: () {
                PoorvaUser poorvaUser = PoorvaUser();
                poorvaUser.name = userController.firstName.text;
                poorvaUser.email = userController.emailID.text;
                poorvaUser.phone = userController.mobileNumber.text;
                poorvaUser.dob = userController.myDate.text;
                poorvaUser.city = userController.city.text;
                poorvaUser.country = 'India';
                poorvaUser.gender = userController.userSelectedGender;
                poorvaUser.profilePic = '';
                poorvaUser.age = userController.age;

                GovermentDocument governmentsDocuments = GovermentDocument();
                governmentsDocuments.pan_card = userController.panNumber.text;
                governmentsDocuments.aadhaar = userController.adhaarNumber.text;
                governmentsDocuments.passport = userController.passportNumber.text;
                governmentsDocuments.driving_license = userController.drivingLicense.text;
                poorvaUser.govermentDocument = governmentsDocuments;

                userController.createUser(poorvaUser);
              },
              title: 'Submit',
              backGroundColor: ColorConstant.blueColor)
        ],
      ),
    );
  }
}
