import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/models/packages_list_response.dart';
import 'package:poorvaholiday/screen/HomeScreen/widget/TourSection/TourCard.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class TourSection extends StatefulWidget {
  final String title;
  final List<PackagesListResponse> tourList;
  const TourSection({
    Key? key,
    required this.title,
    required this.tourList,
  }) : super(key: key);

  @override
  State<TourSection> createState() => _TourSectionState();
}

class _TourSectionState extends State<TourSection> {
  final SwiperController _controller = SwiperController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Row(children: [
          Expanded(flex: 2, child: Container(color: ColorConstant.blueColor)),
          Expanded(flex: 4, child: Container())
        ]),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                customColor: ColorConstant.whiteColor,
                value: widget.title,
                style: TextView.headerStyle(
                  size: 30,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextView(
                customColor: ColorConstant.whiteColor,
                value: '${widget.tourList.length} Tours',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              // details of selected tour
              if (widget.tourList.isNotEmpty &&
                  selectedIndex < widget.tourList.length)
                Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Column(
                    children: [
                      Expanded(
                        child: TextView(
                          value: widget.tourList[selectedIndex].packageInfo
                                      .length >
                                  300
                              ? widget.tourList[selectedIndex].packageInfo
                                      .substring(0, 300) +
                                  '...'
                              : widget.tourList[selectedIndex].packageInfo,
                          customColor: ColorConstant.whiteColor,
                          fontSize: 12,
                          align: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 4,
              child: Swiper(
                controller: _controller,
                index: selectedIndex,
                onIndexChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) => TourCard(
                  tour: widget.tourList[index],
                ),
                viewportFraction: 0.4,
                itemCount: widget.tourList.length,
                autoplayDisableOnInteraction: false,
              ),
            ),
          ],
        ),
        Positioned(
          right: 40,
          top: 0,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _controller.previous();
                },
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorConstant.blueColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  _controller.next();
                },
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorConstant.blueColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
