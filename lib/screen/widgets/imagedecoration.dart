import 'package:flutter/material.dart';

import 'custom_imgae_loader.dart';
import 'custom_loader.dart';

class ContainerImageDecorations extends StatelessWidget {
  String imageName;
  Widget child;
  double width;
  double height;
  double opacity;
  BorderRadius borderRadius;
  ContainerImageDecorations(
      {Key? key,
      required this.imageName,
      required this.child,
      required this.width,
      required this.height,
      required this.opacity,
      required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: imageName.contains('http')
                  ? Image.network(
                      imageName,
                      height: height,
                      width: width,
                      cacheHeight: height.toInt(),
                      cacheWidth: width.toInt(),
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if(loadingProgress==null){
                            return child;
                        }else{
                          return CustomImageLoader();
                        }
                      },
                    )

                  : Image.asset(
                      imageName,
                      height: height,
                      width: width,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(bottom: 0, top: 0, right: 0, left: 0, child: child),
        ],
      ),
    );
  }
}

