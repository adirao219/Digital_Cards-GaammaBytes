import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage(
      {required this.height,
      required this.width,
      this.imagePath,
      this.svgPath,
      this.margin,
      this.onTap});

  double height;

  double width;

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class MoreOptionMenu extends StatelessWidget {
  MoreOptionMenu();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_vert,
        size: 30,
        color: ColorConstant.pink900,
      ),
      onSelected: (item) {
        switch (item) {
          case 1:
            Navigator.of(context).pushNamed(AppRoutes.helponeScreen);
            break;
          case 2:
            Navigator.of(context).pushNamed(AppRoutes.bandVideoScreen);
            break;
        }
        ;
      },
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 1,
            child: Row(children: [
              Icon(
                Icons.help,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Help')
            ])),
        PopupMenuItem<int>(
            value: 2,
            child: Row(children: [
              Icon(
                Icons.videocam_rounded,
                color: ColorConstant.pink900,
                size: 20,
              ),
              Text(' Watch Video')
            ])),
      ],
    );
  }
}
