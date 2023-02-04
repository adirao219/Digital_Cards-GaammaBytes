
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BandsScreen extends StatefulWidget {
  const BandsScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BandsScreen createState() => _BandsScreen();
            }

class _BandsScreen extends State<BandsScreen> {
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
                              left: 38, top: 44, right: 152, bottom: 7),
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                margin: getMargin(bottom: 6),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      AppbarImage(
                                          height: getVerticalSize(36.00),
                                          width: getHorizontalSize(38.00),
                                          svgPath: ImageConstant.imgContrast),
                                      AppbarImage(
                                          height: getVerticalSize(10.00),
                                          width: getHorizontalSize(5.00),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                          svgPath:
                                              ImageConstant.imgVectorstroke,
                                          margin: getMargin(
                                              left: 15,
                                              top: 13,
                                              right: 18,
                                              bottom: 13))
                                    ])),
                            AppbarTitle(
                                text: "lbl_bands2".tr.toUpperCase(),
                                margin: getMargin(left: 75, top: 14))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getSize(28.00),
                      width: getSize(28.00),
                      svgPath: ImageConstant.imgComputer,
                      margin:
                          getMargin(left: 32, top: 51, right: 32, bottom: 29),
                      onTap: onTapComputer)
                ],
                styleType: Style.bgStyle_30),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 24, top: 10, right: 56, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(right: 8),
                                  child: Text("msg_card_name_ex".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoBold18)),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_link".tr,
                                  margin: getMargin(top: 40, right: 6),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapLink),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_note".tr,
                                  margin: getMargin(top: 19, right: 6),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapNote),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_map".tr,
                                  margin: getMargin(top: 21, right: 6),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapMap),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_video".tr,
                                  margin: getMargin(top: 19, right: 6),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapVideo),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtGroup118();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(250.00),
                                      margin: getMargin(top: 23, right: 6),
                                      padding: getPadding(
                                          left: 30,
                                          top: 9,
                                          right: 94,
                                          bottom: 9),
                                      decoration: AppDecoration
                                          .txtOutlineBlack9003f
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtRoundedBorder15),
                                      child: Text("lbl_picture".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtNunitoSansBold14Pink900
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.36))))),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtGroup117();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(250.00),
                                      margin: getMargin(top: 18, right: 6),
                                      padding: getPadding(
                                          left: 30,
                                          top: 9,
                                          right: 72,
                                          bottom: 9),
                                      decoration: AppDecoration
                                          .txtOutlineBlack9003f
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtRoundedBorder15),
                                      child: Text("lbl_contact_band".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtNunitoSansBold14Pink900
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.36))))),
                              Container(
                                  height: getVerticalSize(169.00),
                                  width: getHorizontalSize(250.00),
                                  margin: getMargin(top: 20, right: 6),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapRectangle4205();
                                                },
                                                child: Container(
                                                    height:
                                                        getVerticalSize(40.00),
                                                    width: getHorizontalSize(
                                                        250.00),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .deepOrangeA10033,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    15.00)),
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
                                                              offset:
                                                                  Offset(0, 4))
                                                        ])))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapRectangle4206();
                                                },
                                                child: Container(
                                                    height:
                                                        getVerticalSize(40.00),
                                                    width: getHorizontalSize(
                                                        250.00),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .deepOrangeA10033,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    15.00)),
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
                                                              offset:
                                                                  Offset(0, 4))
                                                        ])))),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapRectangle4207();
                                                },
                                                child: Container(
                                                    height:
                                                        getVerticalSize(40.00),
                                                    width: getHorizontalSize(
                                                        250.00),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .deepOrangeA10033,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    15.00)),
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
                                                              offset:
                                                                  Offset(0, 4))
                                                        ])))),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                                width: getHorizontalSize(87.00),
                                                margin: getMargin(right: 73),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              "lbl_icon_group"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtNunitoSansBold14Pink900
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.36)))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 43),
                                                          child: Text(
                                                              "lbl_bank_details"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtNunitoSansBold14Pink900
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.36)))),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 10,
                                                              top: 46),
                                                          child: Text(
                                                              "lbl_upi_card".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtNunitoSansBold14Pink900
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.36))))
                                                    ])))
                                      ])),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtBtnConfirm();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(250.00),
                                      margin: getMargin(top: 104),
                                      padding: getPadding(
                                          left: 30,
                                          top: 8,
                                          right: 96,
                                          bottom: 8),
                                      decoration: AppDecoration.txtFillPink900
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtCircleBorder20),
                                      child: Text("lbl_save".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtNunitoSansBlack16)))
                            ]))))));
  }

  onTapLink() {
    Navigator.of(context).pushNamed(AppRoutes.bandLinkScreen);
  }

  onTapNote() {
    Navigator.of(context).pushNamed(AppRoutes.bandNoteScreen);
  }

  onTapMap() {
    Navigator.of(context).pushNamed(AppRoutes.bandMapScreen);
  }

  onTapVideo() {
    Navigator.of(context).pushNamed(AppRoutes.bandVideoScreen);
  }

  onTapTxtGroup118() {
    Navigator.of(context).pushNamed(AppRoutes.bandPictureScreen);
  }

  onTapTxtGroup117() {
    Navigator.of(context).pushNamed(AppRoutes.bandContactbandScreen);
  }

  onTapRectangle4205() {
    Navigator.of(context).pushNamed(AppRoutes.bandIcongroupScreen);
  }

  onTapRectangle4206() {
    Navigator.of(context).pushNamed(AppRoutes.bandBankaCdetailsScreen);
  }

  onTapRectangle4207() {
    Navigator.of(context).pushNamed(AppRoutes.bandUpicardScreen);
  }

  onTapTxtBtnConfirm() {
    Navigator.of(context).pushNamed(AppRoutes.customizationoneScreen);
  }

  onTapComputer() {
    Navigator.of(context).pushNamed(AppRoutes.bandsOneScreen);
  }
}
