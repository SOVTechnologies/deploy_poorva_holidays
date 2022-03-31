import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:poorvaholiday/routes/routes.dart';


class PoorvaLogo extends StatelessWidget {
  const PoorvaLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.home);
      },
      child: const Image(
        image: AssetImage('ft-logo.png'),
        width: 180,
        height: 70,
      ),
    );
  }
}
