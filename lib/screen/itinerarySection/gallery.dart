import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/text_with_Icon.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ContainerImageDecorations(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          opacity: 0,
          width: 70,
          height: 50,
          imageName: 'egypt.jpeg',
          child: Container(),
        ),
        const SizedBox(
          width: 10,
        ),
        ContainerImageDecorations(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          opacity: 0,
          width: 70,
          height: 50,
          imageName: 'egypt.jpeg',
          child: Container(),
        ),
        const SizedBox(
          width: 10,
        ),
        ContainerImageDecorations(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          opacity: 0,
          width: 70,
          height: 50,
          imageName: 'egypt.jpeg',
          child: Container(),
        ),
      ],
    );
  }
}