import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:poorvaholiday/helpers/Seo/helpers/renderer_state.dart';
import 'package:poorvaholiday/helpers/Seo/helpers/robot_detector_web.dart';
import 'package:poorvaholiday/routes/Router.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
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
          locationBuilder: routeLocations(context),
          navigatorObservers: [seoRouteObserver],
        ),
      ),
    );
  }
}
