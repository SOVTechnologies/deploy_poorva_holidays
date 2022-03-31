import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;
  final isPasswordMatch = false.obs;
  final isTextObs = true.obs;
  final isTextConfrim = true.obs;
  bool isError = false;
  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;
  final _isdataGeetingFetch = false.obs;
  bool get isdataGeetingFetch => _isdataGeetingFetch.value;


  @override
  void onInit() {
    Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAOon3eJouB6X5T-eq3-IskNkAmzzJYIfA",
          appId: "1:53744754183:web:b82b704c4f6bd230ca54a2",
          messagingSenderId: "53744754183",
          projectId: 'poorvaholiday-edc63'),
    ).then((FirebaseApp value) {

      if(auth!=null){
        if(auth.currentUser!=null){
          firebaseUser = Rx<User?>(auth.currentUser);
          firebaseUser.bindStream(auth.userChanges());
          _dataAvailable.value = true;
        }
      }
    });
  }

  bool verifyPassword(String password, String confrimPassword) {
    return false;
  }

  void verifyEmail() async {
    auth.currentUser!.sendEmailVerification().then((value) {
      Get.back();
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
    });
  }

  void register(String email, String password,String cpassword) async {
    if(password.isEmpty || password!=cpassword){
      snackbar("Password does not match");
      return;
    }
    auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseUser = Rx<User?>(auth.currentUser);
      firebaseUser.bindStream(auth.userChanges());
      _dataAvailable.value = true;
      Get.back();
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
    });
  }
  void forgotPassword(String email) async {
    auth.sendPasswordResetEmail(email: email).then((value) {
      snackbar("Email sent to register email id");
      Get.back();
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
    });
  }
  changePassword(String currentPassword, String newPassword) async {
    auth.currentUser!.updatePassword(newPassword).then((value) {
      snackbar("Email sent to register email id");
      Get.back();
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
    });
  }

  void login(String email, String password) async {
    auth.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseUser = Rx<User?>(auth.currentUser);
      firebaseUser.bindStream(auth.userChanges());
      _dataAvailable.value = true;
      Get.back();
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
    });
  }

  void signOut() {
    auth.signOut().then((value) {
      firebaseUser = Rx<User?>(auth.currentUser);
      firebaseUser.bindStream(auth.userChanges());
      _dataAvailable.value = false;
      Get.back();
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
    });
  }

  SnackbarController snackbar(String e) {
    return Get.snackbar("Error", e.toString(),
        maxWidth: 500,
        backgroundColor: ColorConstant.blueColor,
        colorText: ColorConstant.whiteColor,
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM);
  }
}
