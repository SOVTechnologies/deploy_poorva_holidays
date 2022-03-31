import 'package:flutter/material.dart';
import 'package:poorvaholiday/utils/responsive.dart';

class ConstantSize{

  double getReviewHeight(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.20
        : 200;
  }
  double getReviewWidth(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.25
        : 350;
  }


  double getServicesHeight(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.20
        : 200;
  }
  double getServicesWidth(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.25
        : 350;
  }







  double getTourHeight(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.30
        : MediaQuery.of(context).size.height * 0.25;
  }

  double getTourWidht(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.25
        : MediaQuery.of(context).size.width * 0.35;
  }

  double unforgotabelSize(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 50
        : 30;
  }
  double unforgotabelDividerSize(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 250
        : 150;
  }



  double getBestViewHeight(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.45
        : MediaQuery.of(context).size.height * 0.25;
  }
  double getBestViewWidth(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.45
        : MediaQuery.of(context).size.width * 0.45;
  }

  double getContainerButtonWidth(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 250
        : 170;
  }

  double iteneraryContentMargin(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 50
        : 20;
  }



  double getiteneraryHeight(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.065
        : MediaQuery.of(context).size.width * 0.15;
  }
  double getiteneraryWidth(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.70
        : MediaQuery.of(context).size.width * 0.50;
  }

  double getHotelInfoSingleItem(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 250
        : 200;
  }


  double getiteneraryTourHeight(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.height * 0.56
        : MediaQuery.of(context).size.height * 0.40;
  }
  double getiteneraryTourWidth(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.width * 0.22
        : MediaQuery.of(context).size.width * 0.4;
  }

  double bannerHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  // Reponsivenes.isLargeScreen(context) ? MediaQuery.of(context).size.height
  //     : MediaQuery.of(context).size.height/2;

  int hotelInfoGridCount(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 4
        : 2;
  }

  double packageDetailMainTitle(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 25
        : 15;
  }

  double hotelInfoFontSize(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 16
        : 12;
  }


  double hotelItemGallery(BuildContext context){
    return Reponsivenes.isLargeScreen(context) ? 270
        : 300;
  }
  // width: MediaQuery.of(context).size.width * 0.4,
  // height: MediaQuery.of(context).size.height * 0.5,
}