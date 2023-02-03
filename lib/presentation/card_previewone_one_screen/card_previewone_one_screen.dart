
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CardPreviewoneOneScreen extends StatefulWidget {
  const CardPreviewoneOneScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _CardPreviewoneOneScreen createState() => _CardPreviewoneOneScreen();
            }

class _CardPreviewoneOneScreen extends State<CardPreviewoneOneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(108.00),
                centerTitle: true,
                title: Container(
                    height: getVerticalSize(94.00),
                    width: size.width,
                    child: Stack(children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100),
                      Padding(
                          padding: getPadding(
                              left: 40, top: 35, right: 66, bottom: 6),
                          child: Row(children: [
                            AppbarIconbutton(
                                svgPath: ImageConstant.imgArrowleft,
                                margin: getMargin(top: 9, bottom: 6),
                                onTap: onTapArrowleft2),
                            AppbarSubtitle(
                                text: "lbl_card_preview".tr,
                                margin:
                                    getMargin(left: 33, top: 16, bottom: 11)),
                            AppbarImage(
                                height: getVerticalSize(53.00),
                                width: getHorizontalSize(55.00),
                                svgPath: ImageConstant.imgEye,
                                margin: getMargin(left: 9))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_12),
            body: Container(
                width: size.width,
                padding: getPadding(left: 19, top: 24, right: 19, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(529.00),
                          width: getHorizontalSize(335.00),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgClock,
                                height: getVerticalSize(46.00),
                                width: getHorizontalSize(42.00),
                                alignment: Alignment.topRight),
                            CustomImageView(
                                svgPath: ImageConstant.imgMinimize,
                                height: getVerticalSize(39.00),
                                width: getHorizontalSize(41.00),
                                alignment: Alignment.bottomLeft),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(left: 21, right: 18),
                                    padding: getPadding(
                                        left: 11, top: 8, right: 11, bottom: 8),
                                    decoration: AppDecoration
                                        .fillDeeporangeA100a3
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: getVerticalSize(456.00),
                                              width: getHorizontalSize(273.00),
                                              margin: getMargin(bottom: 6),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .purpleA2002d,
                                                  border: Border.all(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      width: getHorizontalSize(
                                                          2.00)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: ColorConstant
                                                            .black9003f,
                                                        spreadRadius:
                                                            getHorizontalSize(
                                                                2.00),
                                                        blurRadius:
                                                            getHorizontalSize(
                                                                2.00),
                                                        offset: Offset(0, 4))
                                                  ]))
                                        ])))
                          ])),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_ok2".tr,
                          margin: getMargin(top: 34, bottom: 5),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapOk)
                    ]))));
  }

  onTapOk() {
    Get.toNamed(AppRoutes.customizationoneScreen);
  }

  onTapArrowleft2() {
    Get.back();
  }
}
