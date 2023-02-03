import 'controller/change_password_controller.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends GetWidget<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            108.00,
          ),
          centerTitle: true,
          title: Container(
            height: getVerticalSize(
              94.00,
            ),
            width: size.width,
            child: Stack(
              children: [
                AppbarImage(
                  height: getVerticalSize(
                    94.00,
                  ),
                  width: getHorizontalSize(
                    375.00,
                  ),
                  imagePath: ImageConstant.imgVectorDeepOrangeA100,
                ),
                Container(
                  height: getVerticalSize(
                    36.00,
                  ),
                  width: getHorizontalSize(
                    38.00,
                  ),
                  margin: getMargin(
                    left: 38,
                    top: 44,
                    right: 299,
                    bottom: 14,
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      AppbarImage(
                        height: getVerticalSize(
                          36.00,
                        ),
                        width: getHorizontalSize(
                          38.00,
                        ),
                        svgPath: ImageConstant.imgContrast,
                      ),
                      AppbarImage(
                        height: getVerticalSize(
                          10.00,
                        ),
                        width: getHorizontalSize(
                          5.00,
                        ),
                        svgPath: ImageConstant.imgVectorstroke,
                        margin: getMargin(
                          left: 15,
                          top: 13,
                          right: 18,
                          bottom: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarImage(
              height: getVerticalSize(
                35.00,
              ),
              width: getHorizontalSize(
                43.00,
              ),
              svgPath: ImageConstant.imgOverflowmenu,
              margin: getMargin(
                left: 3,
                top: 47,
                right: 3,
                bottom: 26,
              ),
            ),
          ],
          styleType: Style.bgStyle_10,
        ),
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 31,
            top: 24,
            right: 31,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 16,
                ),
                child: Text(
                  "lbl_change_password".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold20,
                ),
              ),
              Container(
                height: getVerticalSize(
                  66.00,
                ),
                width: getHorizontalSize(
                  295.00,
                ),
                margin: getMargin(
                  top: 27,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: getPadding(
                          left: 20,
                          top: 16,
                          right: 20,
                          bottom: 16,
                        ),
                        decoration: AppDecoration.outlineGray200.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder15,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 3,
                              ),
                              child: Text(
                                "lbl".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansBold16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 23,
                        ),
                        child: Text(
                          "lbl_new_password".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoSansRegular12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(
                  66.00,
                ),
                width: getHorizontalSize(
                  295.00,
                ),
                margin: getMargin(
                  top: 14,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: getPadding(
                          left: 20,
                          top: 16,
                          right: 20,
                          bottom: 16,
                        ),
                        decoration: AppDecoration.outlineGray200.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder15,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 3,
                              ),
                              child: Text(
                                "lbl".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansBold16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 28,
                        ),
                        child: Text(
                          "lbl_confirm".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoSansRegular12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                height: 40,
                width: 250,
                text: "lbl_save".tr,
                margin: getMargin(
                  top: 40,
                  bottom: 5,
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
