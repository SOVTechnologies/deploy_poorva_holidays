import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';
import 'package:poorvaholiday/screen/widgets/poorva_bottombar.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'home_body.dart';
import '../header/appbar.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Reponsivenes(
        largeScreen: Scaffold(
          // extendBody: true,
          extendBodyBehindAppBar: true,
          // appBar: PreferredSize(
          //   child: const PoorvaAppBar(),
          //   preferredSize: Size(MediaQuery.of(context).size.width, 150),
          // ),
          body: HomeBody(),
        ),
        smallScreen:
            Scaffold(body: HomeBody(), bottomNavigationBar: PoorvaBottomBar()),
        mediumScreen: Scaffold(
          // appBar: PreferredSize(
          //   child:  PoorvaAppBar(),
          //   preferredSize: Size(MediaQuery.of(context).size.width, 150),
          // ),
          body: const HomeBody(),
        ));
  }
}
