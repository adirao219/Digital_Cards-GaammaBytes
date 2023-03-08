
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DigitalCardOptionsScreen extends StatefulWidget {
  const DigitalCardOptionsScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _DigitalCardOptionsScreen createState() => _DigitalCardOptionsScreen();
            }

class _DigitalCardOptionsScreen extends State<DigitalCardOptionsScreen> {
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
                      Container(
                          height: getVerticalSize(36.00),
                          width: getHorizontalSize(38.00),
                          margin: getMargin(
                              left: 38, top: 44, right: 299, bottom: 14),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            AppbarImage(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                svgPath: ImageConstant.imgContrast,
                                onTap: onTapContrast7),
                            AppbarImage(
                                height: getVerticalSize(10.00),
                                width: getHorizontalSize(5.00),
                                svgPath: ImageConstant.imgVectorstroke,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                margin: getMargin(
                                    left: 15, top: 13, right: 18, bottom: 13))
                          ]))
                    ])),
                 // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_20),
            body: Container(
                width: size.width,
                padding: getPadding(left: 29, top: 46, right: 29, bottom: 46),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 11),
                          child: Text("msg_choose_card_type".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoBold20)),
                      Padding(
                          padding: getPadding(left: 2, top: 18),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapColumnbusinesscard();
                                    },
                                    child: Container(
                                        padding: getPadding(
                                            left: 5,
                                            top: 9,
                                            right: 5,
                                            bottom: 9),
                                        decoration: AppDecoration
                                            .outlineGray30001
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: getPadding(left: 18),
                                                  child: Text(
                                                      "lbl_business_card".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNunitoBlack14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.36)))),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgBusinesscard1,
                                                  height:
                                                      getVerticalSize(61.00),
                                                  width:
                                                      getHorizontalSize(93.00),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: getMargin(
                                                      top: 12, bottom: 1))
                                            ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapColumnvisitingcard();
                                    },
                                    child: Container(
                                        padding: getPadding(top: 6, bottom: 6),
                                        decoration: AppDecoration
                                            .outlineGray300011
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 13, top: 5),
                                                  child: Text(
                                                      "lbl_visiting_card".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNunitoBlack14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.36)))),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgBusinessvisiti,
                                                  height:
                                                      getVerticalSize(61.00),
                                                  width:
                                                      getHorizontalSize(132.00),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: getMargin(top: 15))
                                            ])))
                              ])),
                      Padding(
                          padding: getPadding(left: 2, top: 9),
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(119.00),
                                width: getHorizontalSize(165.00),
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: GestureDetector(
                                              onTap: () {
                                                onTapColumnlocationcard();
                                              },
                                              child: Container(
                                                  padding: getPadding(
                                                      left: 23,
                                                      top: 13,
                                                      right: 23,
                                                      bottom: 13),
                                                  decoration: AppDecoration
                                                      .fillRed10001
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder5),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                bottom: 71),
                                                            child: Text(
                                                                "lbl_location_card"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtNunitoBlack14
                                                                    .copyWith(
                                                                        letterSpacing:
                                                                            getHorizontalSize(0.36))))
                                                      ])))),
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgGooglelogo181x122,
                                          height: getVerticalSize(81.00),
                                          width: getHorizontalSize(122.00),
                                          alignment: Alignment.bottomRight)
                                    ])),
                            GestureDetector(
                                onTap: () {
                                  onTapColumnprofilecard();
                                },
                                child: Container(
                                    padding: getPadding(
                                        left: 9, top: 10, right: 9, bottom: 10),
                                    decoration: AppDecoration.outlineGray300012
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding:
                                                  getPadding(left: 9, top: 4),
                                              child: Text("lbl_profile_card".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoBlack14
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.36)))),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgProfiletransparent,
                                              height: getVerticalSize(71.00),
                                              width: getHorizontalSize(66.00),
                                              alignment: Alignment.centerRight,
                                              margin: getMargin(top: 3))
                                        ])))
                          ])),
                      GestureDetector(
                          onTap: () {
                            onTapColumneventcard();
                          },
                          child: Container(
                              width: getHorizontalSize(150.00),
                              margin: getMargin(left: 4, top: 9, bottom: 5),
                              padding: getPadding(
                                  left: 5, top: 13, right: 5, bottom: 13),
                              decoration: AppDecoration.outlineGray300013
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(left: 16, top: 4),
                                        child: Text("lbl_event_card".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtNunitoBlack14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.img1251257339hos,
                                        height: getVerticalSize(49.00),
                                        width: getHorizontalSize(110.00),
                                        alignment: Alignment.centerRight,
                                        margin: getMargin(top: 19))
                                  ])))
                    ]))));
  }

  onTapColumnbusinesscard() {
 Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen);
  }

  onTapColumnvisitingcard() {
 Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen);
  }

  onTapColumnlocationcard() {
 Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen);
  }

  onTapColumnprofilecard() {
 Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen);
  }

  onTapColumneventcard() {
 Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen);
  }

  onTapContrast7() {
    Navigator.of(context).pushNamed(AppRoutes.myDigitalCardsScreen);
  }
}
