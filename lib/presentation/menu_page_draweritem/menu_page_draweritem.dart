
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MenuPageDraweritem extends StatefulWidget {
  const MenuPageDraweritem({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _MenuPageDraweritem createState() => _MenuPageDraweritem();
            }

class _MenuPageDraweritem extends State<MenuPageDraweritem> {
 

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: AppDecoration.fillWhiteA700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getHorizontalSize(
                270.00,
              ),
              padding: getPadding(
                left: 29,
                top: 14,
                right: 29,
                bottom: 14,
              ),
              decoration: AppDecoration.fillDeeporangeA100.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL151,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: getSize(
                      94.00,
                    ),
                    width: getSize(
                      94.00,
                    ),
                    margin: getMargin(
                      top: 80,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgInneroval,
                          height: getSize(
                            94.00,
                          ),
                          width: getSize(
                            94.00,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              47.00,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgEdit,
                          height: getSize(
                            18.00,
                          ),
                          width: getSize(
                            18.00,
                          ),
                          alignment: Alignment.bottomRight,
                          margin: getMargin(
                            right: 6,
                            bottom: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "lbl_steve_smith".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBalooBhaijaanRegular19,
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 50,
                bottom: 132,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getVerticalSize(
                      394.00,
                    ),
                    width: getHorizontalSize(
                      22.00,
                    ),
                    margin: getMargin(
                      bottom: 2,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: getHorizontalSize(
                              21.00,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgHome,
                                  height: getSize(
                                    21.00,
                                  ),
                                  width: getSize(
                                    21.00,
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgGrid,
                                  height: getSize(
                                    19.00,
                                  ),
                                  width: getSize(
                                    19.00,
                                  ),
                                  margin: getMargin(
                                    top: 38,
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgMenuPink900,
                                  height: getSize(
                                    21.00,
                                  ),
                                  width: getSize(
                                    21.00,
                                  ),
                                  margin: getMargin(
                                    top: 46,
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgMenuPink90021x21,
                                  height: getSize(
                                    21.00,
                                  ),
                                  width: getSize(
                                    21.00,
                                  ),
                                  margin: getMargin(
                                    top: 104,
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgLock,
                                  height: getSize(
                                    21.00,
                                  ),
                                  width: getSize(
                                    21.00,
                                  ),
                                  margin: getMargin(
                                    top: 40,
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgRefresh,
                                  height: getSize(
                                    21.00,
                                  ),
                                  width: getSize(
                                    21.00,
                                  ),
                                  margin: getMargin(
                                    top: 42,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgUser,
                          height: getSize(
                            21.00,
                          ),
                          width: getSize(
                            21.00,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_gaamma_cards".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoSansSemiBold16,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 39,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "lbl_digital_cards".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPink900,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  10.00,
                                ),
                                margin: getMargin(
                                  left: 80,
                                  top: 3,
                                  bottom: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 42,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "lbl_e_greetings".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPink900,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  10.00,
                                ),
                                margin: getMargin(
                                  left: 80,
                                  top: 5,
                                  bottom: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 3,
                            top: 38,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_my_profile".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPink900,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  10.00,
                                ),
                                margin: getMargin(
                                  left: 98,
                                  top: 7,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 39,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "lbl_make_payment".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPink900,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  10.00,
                                ),
                                margin: getMargin(
                                  left: 67,
                                  top: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 39,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "lbl_change_password".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPink900,
                                height: getVerticalSize(
                                  15.00,
                                ),
                                width: getHorizontalSize(
                                  10.00,
                                ),
                                margin: getMargin(
                                  left: 44,
                                  top: 5,
                                  bottom: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 44,
                          ),
                          child: Text(
                            "lbl_logout".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNunitoSansSemiBold16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
