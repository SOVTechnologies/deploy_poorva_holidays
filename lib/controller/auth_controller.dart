import 'dart:async';
import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool isloading = false;
  bool get isdataGeetingFetch => _isdataGeetingFetch.value;

  @override
  Future<void> onInit() async => await loadUser();

  loadUser() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAOon3eJouB6X5T-eq3-IskNkAmzzJYIfA",
          appId: "1:53744754183:web:b82b704c4f6bd230ca54a2",
          messagingSenderId: "53744754183",
          projectId: 'poorvaholiday-edc63'),
    ).then((FirebaseApp value) {
      if (auth != null) {
        _isdataGeetingFetch.value = true;

        firebaseUser = Rx<User?>(auth.currentUser);
        if (firebaseUser != null) {
          _dataAvailable.value = true;
        }
        _isdataGeetingFetch.value = false;
        firebaseUser.bindStream(auth.userChanges());
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

  void register(
    String email,
    String password,
    String cpassword,
    BuildContext context, {
    String? lastLocation,
  }) async {
    if (password.isEmpty || password != cpassword) {
      snackbar("Password does not match");
      return;
    }
    _isdataGeetingFetch.value = true;
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseUser = Rx<User?>(auth.currentUser);
      firebaseUser.bindStream(auth.userChanges());
      _dataAvailable.value = true;
      _isdataGeetingFetch.value = false;
      if (lastLocation != null) {
        Beamer.of(context).popToNamed(lastLocation);
      } else {
        Beamer.of(context).popRoute();
      }
    }).onError((FirebaseAuthException error, stackTrace) {
      snackbar("${error.message}");
      _isdataGeetingFetch.value = true;
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

  void login(
    String email,
    String password,
    BuildContext context, {
    String? lastLocation,
  }) async {
    _isdataGeetingFetch.value = true;
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseUser = Rx<User?>(auth.currentUser);
      firebaseUser.bindStream(auth.userChanges());
      _dataAvailable.value = true;
      _isdataGeetingFetch.value = false;
      if (lastLocation != null) {
        Beamer.of(context).popToNamed(lastLocation);
      } else {
        Beamer.of(context).popRoute();
      }
    }).onError((FirebaseAuthException error, stackTrace) {
      _isdataGeetingFetch.value = false;
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

  snackbar(String e) {
    Fluttertoast.showToast(
      msg: e,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      textColor: Colors.white,
      webBgColor: 'linear-gradient(to right, #FF0000, #FF0000)',
      fontSize: 16.0,
    );
  }
}
