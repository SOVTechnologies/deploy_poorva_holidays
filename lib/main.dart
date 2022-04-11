import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/helpers/Seo/helpers/renderer_state.dart';
import 'package:poorvaholiday/helpers/Seo/helpers/robot_detector_web.dart';
import 'package:poorvaholiday/routes/Router.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  Get.lazyPut(() => AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RobotDetector(
      debug: true,
      child: GetMaterialApp.router(
        title: 'Poorva Holidays',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: BeamerDelegate(
          routeListener: (RouteInformation p0, BeamerDelegate p1) => {},
          locationBuilder: routeLocations(context),
          navigatorObservers: [seoRouteObserver],
        ),
      ),
    );
  }
}
