// import 'dart:async';
// import 'dart:html';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/editable_text.dart';
// import 'package:get/get.dart';
// import 'package:poorvaholiday/constant/color_constant.dart';
// import 'package:poorvaholiday/constant/firebase_constants.dart';
//
// class AuthController extends GetxController {
//   static AuthController authInstance = Get.find();
//   late Rx<User?> firebaseUser;
//
//   final isTextObs = true.obs;
//   final isTextConfrim = true.obs;
//   bool isError = false;
//   final _dataAvailable = false.obs;
//   bool get dataAvailable => _dataAvailable.value;
//
//   final _isdataGeetingFetch = false.obs;
//   bool get isdataGeetingFetch => _isdataGeetingFetch.value;
//   late Future<FirebaseApp> fbInit;
//
//   @override
//   void onInit() {
//     fbInit = firebaseInitialization;
//
//   }
//
//   final isPasswordMatch = false.obs;
//   bool verifyPassword(String password, String confrimPassword) {
//     if (!password.isEmpty &&
//         !confrimPassword.isEmpty &&
//         password == confrimPassword) {
//       isPasswordMatch.value = true;
//       return isPasswordMatch.value;
//     }
//     Get.snackbar(
//       "Password",
//       'Password Does not Match!!!',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//     return isPasswordMatch.value;
//   }
//
//   void verifyEmail() async {
//     // try {
//     //   await auth.currentUser!.sendEmailVerification();
//     // } on FirebaseAuthException catch (e) {
//     //   snackbar(e.message.toString());
//     // } catch (e) {
//     //   snackbar(e.toString());
//     // }
//   }
//
//   void register(String email, String password) async {
//     if (email.length == 0) {
//       snackbar("Email Id cannot be empty!!!");
//       return;
//     }
//
//     if (password.length == 0) {
//       snackbar("Password Id cannot be empty!!!");
//       return;
//     }
//
//     _isdataGeetingFetch.value = true;
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       snackbar(e.message.toString());
//     } catch (e) {
//       snackbar(e.toString());
//     } finally {
//       firebaseUser = Rx<User?>(auth.currentUser);
//       firebaseUser.bindStream(auth.userChanges());
//       _dataAvailable.value = true;
//       _isdataGeetingFetch.value = false;
//       Get.back();
//     }
//   }
//
//   void forgotPassword(String email) async {
//     try {
//       //await auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       snackbar(e.message.toString());
//     } catch (e) {
//       snackbar(e.toString());
//     } finally {
//       Get.back();
//     }
//   }
//
//   void changePassword(String currentPassword, String newPassword) async {
//     if (currentPassword.isEmpty) {
//       snackbar("Passowrd Cannot be empty");
//       return;
//     }
//     if (newPassword.isEmpty) {
//       snackbar("Passowrd Cannot be empty");
//       return;
//     }
//
//     _isdataGeetingFetch.value = true;
//     try {
//       //await auth.currentUser!.updatePassword(newPassword);
//     } on FirebaseAuthException catch (e) {
//       snackbar(e.message.toString());
//     } catch (e) {
//       print(e.toString());
//       snackbar(e.toString());
//     } finally {
//       Timer(
//         Duration(seconds: 3),
//         () async {
//           _dataAvailable.value = true;
//           _isdataGeetingFetch.value = false;
//           Get.back();
//         },
//       );
//     }
//   }
//
//   SnackbarController snackbar(String e) {
//     return Get.snackbar("Error", e.toString(),
//         maxWidth: 500,
//         backgroundColor: ColorConstant.blueColor,
//         colorText: ColorConstant.whiteColor,
//         margin: const EdgeInsets.all(20),
//         snackPosition: SnackPosition.BOTTOM);
//   }
//
//   void login(String email, String password) async {
//     auth
//         .signInWithEmailAndPassword(email: email, password: password)
//         .then((value) {
//       firebaseUser = Rx<User?>(auth.currentUser);
//       firebaseUser.bindStream(auth.userChanges());
//       _dataAvailable.value = true;
//       _isdataGeetingFetch.value = false;
//       Get.back();
//     }).onError((FirebaseAuthException error, stackTrace) {
//       snackbar("${error.message}");
//     });
//   }
//
//   void signOut() {
//     //_isdataGeetingFetch.value = true;
//
//     auth.signOut().onError((FirebaseAuthException error, stackTrace) {
//       snackbar("${error.message}");
//     });
//     // try {
//     //   auth.signOut();
//     //   //onReady();
//     //   Get.back();
//     // } catch (e) {
//     //   print(e.toString());
//     //   snackbar(e.toString());
//     // } finally {
//     //   _dataAvailable.value = true;
//     //   _isdataGeetingFetch.value = false;
//     // }
//   }
//
// // if (email.length == 0) {
// //   snackbar("Email Id cannot be empty!!!");
// //   return;
// // }
// //
// // if (password.length == 0) {
// //   snackbar("Password Id cannot be empty!!!");
// //   return;
// // }
// //
// // _isdataGeetingFetch.value = true;
// // try {
// //   await auth.signInWithEmailAndPassword(email: email, password: password);
// //   isError == false;
// // } on FirebaseAuthException catch (e) {
// //   snackbar(e.message.toString());
// //   isError == true;
// // } catch (e) {
// //   snackbar(e.toString());
// //   isError == true;
// // } finally {
// //   if (!isError) {
// //     print('auth  isError${auth.currentUser}');
// //     firebaseUser = Rx<User?>(auth.currentUser);
// //     firebaseUser.bindStream(auth.userChanges());
// //     _dataAvailable.value = true;
// //     _isdataGeetingFetch.value = false;
// //     Get.back();
// //   } else {
// //     _dataAvailable.value = false;
// //     _isdataGeetingFetch.value = true;
// //   }
// // }
//   // if(_dataAvailable.value==true){
//   // _isdataGeetingFetch.value = false;
//   // Get.back();
//   //
//   // }
//   // snackbar(e);
//   // if(e.toString() == 'The password is invalid or the user does not have a password'){
//   //   _dataAvailable.value = false;
//   //   _isdataGeetingFetch.value = true;
//   // }
//
// }
// // @override
// // void onReady() {
// //   super.onReady();
// //   try {
// //
// //     //firebaseUser = Rx<User?>(auth.currentUser);
// //    // firebaseUser.bindStream(auth.userChanges());
// //     _dataAvailable.value = true;
// //   } on FirebaseAuthException catch (e) {
// //     print(e.message);
// //     snackbar(e);
// //   } catch (e) {
// //     print(e.toString());
// //     snackbar(e);
// //   }
// // }
