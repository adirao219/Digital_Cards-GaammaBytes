
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BandsOneScreen extends StatefulWidget {
  const BandsOneScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BandsOneScreen createState() => _BandsOneScreen();
            }

class _BandsOneScreen extends State<BandsOneScreen> {
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
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                          width: getHorizontalSize(5.00),
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
                      onTap: onTapComputer1)
                ],
                styleType: Style.bgStyle_31),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        width: size.width,
                        margin: getMargin(top: 10, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 24),
                                  child: Text("msg_card_name_ex".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoBold18)),
                              Container(
                                  height: getVerticalSize(218.00),
                                  width: size.width,
                                  margin: getMargin(top: 14),
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                width: size.width,
                                                margin: getMargin(bottom: 167),
                                                padding: getPadding(
                                                    left: 21,
                                                    top: 1,
                                                    right: 21,
                                                    bottom: 1),
                                                decoration:
                                                    AppDecoration.fillGray5004,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 7, top: 6),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_heading1"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtNunitoSansRegular16),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            left:
                                                                                1),
                                                                    child: Text(
                                                                        "lbl_type1"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoSansRegular14Gray70001))
                                                              ])),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMaximizefill0,
                                                          height:
                                                              getVerticalSize(
                                                                  31.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  30.00),
                                                          margin: getMargin(
                                                              top: 16))
                                                    ]))),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgMaximizefill0,
                                            height: getVerticalSize(31.00),
                                            width: getHorizontalSize(30.00),
                                            alignment: Alignment.topRight,
                                            margin:
                                                getMargin(top: 25, right: 21)),
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                width: size.width,
                                                margin: getMargin(
                                                    top: 54, bottom: 113),
                                                padding: getPadding(
                                                    left: 21,
                                                    top: 1,
                                                    right: 21,
                                                    bottom: 1),
                                                decoration:
                                                    AppDecoration.fillGray20001,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 7, top: 6),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_heading2"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtNunitoSansRegular16),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            left:
                                                                                1),
                                                                    child: Text(
                                                                        "lbl_type2"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoSansRegular14Gray70001))
                                                              ])),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMaximizefill0,
                                                          height:
                                                              getVerticalSize(
                                                                  31.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  30.00),
                                                          margin: getMargin(
                                                              top: 16))
                                                    ]))),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgMaximizefill0,
                                            height: getVerticalSize(31.00),
                                            width: getHorizontalSize(30.00),
                                            alignment: Alignment.topRight,
                                            margin:
                                                getMargin(top: 79, right: 21)),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                width: size.width,
                                                margin: getMargin(
                                                    top: 108, bottom: 59),
                                                padding: getPadding(
                                                    left: 21,
                                                    top: 1,
                                                    right: 21,
                                                    bottom: 1),
                                                decoration:
                                                    AppDecoration.fillGray5004,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 7, top: 6),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_heading3"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtNunitoSansRegular16),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            left:
                                                                                1),
                                                                    child: Text(
                                                                        "lbl_type3"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoSansRegular14Gray70001))
                                                              ])),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMaximizefill0,
                                                          height:
                                                              getVerticalSize(
                                                                  31.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  30.00),
                                                          margin: getMargin(
                                                              top: 16))
                                                    ]))),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgMaximizefill0,
                                            height: getVerticalSize(31.00),
                                            width: getHorizontalSize(30.00),
                                            alignment: Alignment.bottomRight,
                                            margin: getMargin(
                                                right: 21, bottom: 54)),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                width: size.width,
                                                margin: getMargin(
                                                    top: 162, bottom: 5),
                                                padding: getPadding(
                                                    left: 21,
                                                    top: 1,
                                                    right: 21,
                                                    bottom: 1),
                                                decoration:
                                                    AppDecoration.fillGray5004,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 7, top: 6),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_heading4"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtNunitoSansRegular16),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            left:
                                                                                1),
                                                                    child: Text(
                                                                        "lbl_type4"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoSansRegular14Gray70001))
                                                              ])),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMaximizefill0,
                                                          height:
                                                              getVerticalSize(
                                                                  31.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  30.00),
                                                          margin: getMargin(
                                                              top: 16))
                                                    ]))),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgMaximizefill0,
                                            height: getVerticalSize(31.00),
                                            width: getHorizontalSize(30.00),
                                            alignment: Alignment.bottomRight,
                                            margin: getMargin(right: 21))
                                      ])),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: getHorizontalSize(250.00),
                                      margin: getMargin(top: 440),
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

  onTapComputer1() {
    Navigator.of(context).pushNamed(AppRoutes.bandsScreen);
  }
}
