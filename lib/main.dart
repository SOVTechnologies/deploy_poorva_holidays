import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/aboutUs/about_us.dart';
import 'package:poorvaholiday/screen/cancellationPolicies.dart';
import 'package:poorvaholiday/screen/contactus/contactus.dart';
import 'package:poorvaholiday/screen/homesection.dart';
import 'package:poorvaholiday/screen/packageDetails.dart';
import 'package:poorvaholiday/screen/policies.dart';
import 'package:poorvaholiday/screen/short_package_details/short_packages_details.dart';
import 'package:poorvaholiday/screen/termsandConditions.dart';
import 'package:poorvaholiday/utils/WebPayment.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:url_strategy/url_strategy.dart';
import 'screen/book_now/book_now.dart';
import 'screen/search/search.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Poorva Holidays',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeSection(),
      navigatorObservers: [seoRouteObserver],
      getPages: [
        GetPage(name: Routes.home, page: () => const HomeSection()),
        GetPage(
            name: Routes.shortpackagesdetails,
            page: () => const ShortPackagesDetails()),
        GetPage(
            name: Routes.packagesdetails,
            page: () => const PackagesDetails()), //
        GetPage(
            name: Routes.preBookingPackageDetails, page: () => const BookNow()),
        GetPage(name: Routes.contactus, page: () => const ContactUs()),
        GetPage(name: Routes.aboutus, page: () => const AboutUs()),
        GetPage(name: Routes.searchPage, page: () => Search()),
        GetPage(name: Routes.razorPay, page: () => RazorPayWeb()),
        GetPage(name: Routes.privacyPolicy, page: () => const PrivacyPolicy()),
        GetPage(
            name: Routes.cancellationPolicies,
            page: () => const CancellationPolicies()),
        GetPage(
            name: Routes.termsandConditions,
            page: () => const TermsAndCondition()),
      ],
      initialRoute: Routes.home,
    );
  }
}
