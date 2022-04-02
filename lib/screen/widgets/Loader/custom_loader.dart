import 'package:flutter/cupertino.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 75,
          width: 75,
          child: Image.asset('animation.gif')),
    );
  }
}
