
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _ShareScreen createState() => _ShareScreen();
            }

class _ShareScreen extends State<ShareScreen> {
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
                Padding(
                  padding: getPadding(
                    left: 38,
                    top: 44,
                    right: 152,
                    bottom: 7,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: getVerticalSize(
                          36.00,
                        ),
                        width: getHorizontalSize(
                          38.00,
                        ),
                        margin: getMargin(
                          bottom: 6,
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
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
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
                      AppbarTitle(
                        text: "lbl_share".tr.toUpperCase(),
                        margin: getMargin(
                          left: 77,
                          top: 14,
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
          styleType: Style.bgStyle_29,
        ),
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 24,
            top: 10,
            right: 24,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "msg_card_name_ex".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNunitoBold18,
              ),
              Container(
                margin: getMargin(
                  left: 38,
                  top: 74,
                  right: 56,
                  bottom: 5,
                ),
                padding: getPadding(
                  left: 13,
                  top: 17,
                  right: 13,
                  bottom: 17,
                ),
                decoration: AppDecoration.outlineBlack9003f4.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWhatsapplogoo1,
                      height: getVerticalSize(
                        30.00,
                      ),
                      width: getHorizontalSize(
                        37.00,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          5.00,
                        ),
                      ),
                      margin: getMargin(
                        left: 9,
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgGmaillogo1,
                      height: getSize(
                        30.00,
                      ),
                      width: getSize(
                        30.00,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgFile,
                      height: getSize(
                        30.00,
                      ),
                      width: getSize(
                        30.00,
                      ),
                      margin: getMargin(
                        left: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
