import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/AuthScreen/Authentication.dart';
import 'package:poorvaholiday/screen/aboutUs/about_us.dart';
import 'package:poorvaholiday/screen/book_now/book_now_copy.dart';
import 'package:poorvaholiday/screen/cancellationPolicies.dart';
import 'package:poorvaholiday/screen/contactus/contactus.dart';
import 'package:poorvaholiday/screen/HomeScreen/homesection.dart';
import 'package:poorvaholiday/screen/widgets/packageDetails/packageDetails.dart';
import 'package:poorvaholiday/screen/policies.dart';
import 'package:poorvaholiday/screen/search/search.dart';
import 'package:poorvaholiday/screen/short_package_details/short_packages_details.dart';
import 'package:poorvaholiday/screen/termsandConditions.dart';
import 'package:poorvaholiday/utils/WebPayment.dart';

RoutesLocationBuilder routeLocations(BuildContext context) =>
    RoutesLocationBuilder(routes: {
      Routes.home: (BuildContext context, BeamState state, data) =>
          const BeamPage(
            title: 'Welcome to Poorva holidays',
            child: HomeSection(),
          ),
      Routes.shortpackagesdetails:
          (BuildContext context, BeamState state, data) {
        final String? packageId = state.queryParameters['id'];
        final String? title = state.queryParameters['title'];
        return BeamPage(
          title: '$title - Poorva holidays',
          child: ShortPackagesDetails(
            packageId: packageId!,
          ), // ShortPackagesDetails(),
        );
      },
      Routes.authentication: (BuildContext context, BeamState state, data) {
        final String? type = state.queryParameters['type'];
        return BeamPage(
          title: '$type - Poorva holidays',
          child: Authentication(
            type: type!,
          ),
        );
      },
      Routes.packagesdetails: (BuildContext context, BeamState state, data) {
        final String? packageId = state.queryParameters['id'];
        final String? title = state.queryParameters['title'];
        return BeamPage(
          title: '$title - Poorva holidays',
          child: PackagesDetails(
            packageId: packageId!,
            // packageId: packageId!,
          ),
        );
      },
      Routes.preBookingPackageDetails:
          (BuildContext context, BeamState state, data) => const BookNow(),
      Routes.contactus: (BuildContext context, BeamState state, data) {
        return const BeamPage(
          title: 'Contact Us - Poorva holidays',
          child: ContactUs(),
        );
      },
      Routes.searchPage: (BuildContext context, BeamState state, data) =>
          Search(),
      Routes.razorPay: (BuildContext context, BeamState state, data) =>
          RazorPayWeb(),
      Routes.privacyPolicy: (BuildContext context, BeamState state, data) =>
          const PrivacyPolicy(),
      Routes.cancellationPolicies:
          (BuildContext context, BeamState state, data) =>
              const CancellationPolicies(),
      Routes.termsandConditions:
          (BuildContext context, BeamState state, data) =>
              const TermsAndCondition(),
    });

List<GetPage<dynamic>> pages() => [
      GetPage(name: Routes.home, page: () => const HomeSection()),
      GetPage(
          name: Routes.shortpackagesdetails,
          page: () => const ShortPackagesDetails(
                packageId: '',
              )),
      // GetPage(
      //     name: Routes.packagesdetails, page: () => const PackagesDetails()), //
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
    ];
