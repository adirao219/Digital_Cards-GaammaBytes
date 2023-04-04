import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/pandabar.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar(
      {this.onChanged, this.isPublishAvailable = false, this.onNextClicked});
  RxInt selectedIndex = 0.obs;

  bool isPublishAvailable;

  Function(BottomBarEnum)? onChanged;

  Function()? onNextClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: getMargin(top: 10),
        child: CustomBottomWidget(
          backgroundColor: ColorConstant.deepOrangeA10033,
          buttonColor: ColorConstant.pink900,
          buttonSelectedColor: ColorConstant.pink900,
          fabIcon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          fabColors: [ColorConstant.pink900, ColorConstant.pink900],
          buttonData: [
            BottomButtonData(
                id: 'publish',
                isVisible: isPublishAvailable,
                icon: Icons.cloud_upload_rounded,
                title: "lbl_publish".tr),
            BottomButtonData(
                id: 'back',
                isVisible: true,
                icon: Icons.arrow_circle_left_rounded,
                title: "lbl_go_back".tr),
            BottomButtonData(
                id: 'next',
                isVisible: true,
                icon: Icons.arrow_circle_right_rounded,
                title: "lbl_go_next".tr),
            BottomButtonData(
                id: 'share',
                isVisible: isPublishAvailable,
                icon: Icons.share,
                title: "lbl_share".tr),
          ],
          onChange: (id) {
            switch (id) {
              case "back":
                Navigator.of(context).pop();
                break;
              case "next":
                onNextClicked!();
                break;
            }
          },
          onFabButtonPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
          },
        ));
  }
}

enum BottomBarEnum {
  Vector,
  Arrowdownpink900,
  Share,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, required this.type});

  String icon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
