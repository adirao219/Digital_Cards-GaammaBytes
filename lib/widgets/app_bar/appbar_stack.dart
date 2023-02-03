import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarStack extends StatelessWidget {
  AppbarStack({this.margin, this.onTap});

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Container(
          height: getVerticalSize(
            46.00,
          ),
          width: getHorizontalSize(
            57.00,
          ),
          padding: getPadding(
            top: 9,
            bottom: 9,
          ),
          decoration: AppDecoration.fillWhiteA700,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 7,
                  ),
                  child: Text(
                    "lbl_en".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold20,
                  ),
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgArrowdown,
                height: getSize(
                  25.00,
                ),
                width: getSize(
                  25.00,
                ),
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
