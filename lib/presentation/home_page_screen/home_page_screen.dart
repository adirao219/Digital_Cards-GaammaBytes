
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _HomePageScreen createState() => _HomePageScreen();
            }

class _HomePageScreen extends State<HomePageScreen> {
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
                              left: 38, top: 44, right: 121, bottom: 14),
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AppbarImage(
                                          height: getVerticalSize(36.00),
                                          width: getHorizontalSize(38.00),
                                          svgPath: ImageConstant.imgContrast),
                                      AppbarImage(
                                          height: getVerticalSize(25.00),
                                          width: getHorizontalSize(29.00),
                                          svgPath: ImageConstant.imgMenu,
                                          margin: getMargin(
                                              left: 5,
                                              top: 6,
                                              right: 4,
                                              bottom: 5))
                                    ])),
                            AppbarSubtitle(
                                text: "lbl_let_s_design".tr,
                                margin: getMargin(left: 44, top: 10))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_4),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 35, right: 24, bottom: 35),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_choose_the_card".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterLight18),
                      Container(
                          height: getVerticalSize(190.00),
                          width: getHorizontalSize(326.00),
                          margin: getMargin(top: 45),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    width: getHorizontalSize(95.00),
                                    child: Text("lbl_digital_cards".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtPonnala16))),
                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapColumnotherstwo();
                                    },
                                    child: Container(
                                        padding: getPadding(
                                            left: 9,
                                            top: 8,
                                            right: 9,
                                            bottom: 8),
                                        decoration: AppDecoration
                                            .outlineBlack9003f3
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder15),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgOthers2,
                                                  height:
                                                      getVerticalSize(154.00),
                                                  width:
                                                      getHorizontalSize(308.00),
                                                  radius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          getHorizontalSize(
                                                              15.00)),
                                                      topRight: Radius.circular(
                                                          getHorizontalSize(
                                                              15.00)),
                                                      bottomLeft:
                                                          Radius.circular(
                                                              getHorizontalSize(
                                                                  5.00)),
                                                      bottomRight: Radius.circular(
                                                          getHorizontalSize(5.00))),
                                                  margin: getMargin(bottom: 19))
                                            ]))))
                          ])),
                      Container(
                          height: getVerticalSize(190.00),
                          width: getHorizontalSize(326.00),
                          margin: getMargin(top: 49, bottom: 5),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          onTapColumnothersone();
                                        },
                                        child: Container(
                                            padding: getPadding(
                                                left: 4,
                                                top: 7,
                                                right: 4,
                                                bottom: 7),
                                            decoration: AppDecoration
                                                .outlineBlack9003f3
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder15),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgOthers1,
                                                      height: getVerticalSize(
                                                          154.00),
                                                      width: getHorizontalSize(
                                                          317.00),
                                                      radius: BorderRadius.only(
                                                          topLeft: Radius.circular(
                                                              getHorizontalSize(
                                                                  15.00)),
                                                          topRight: Radius.circular(
                                                              getHorizontalSize(
                                                                  15.00)),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  getHorizontalSize(
                                                                      5.00)),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  getHorizontalSize(5.00))),
                                                      margin: getMargin(bottom: 21))
                                                ])))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        width: getHorizontalSize(96.00),
                                        child: Text("lbl_e_greetings".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.txtPonnala16)))
                              ]))
                    ]))));
  }

  onTapColumnotherstwo() {
    Get.toNamed(AppRoutes.myDigitalCardsScreen);
  }

  onTapColumnothersone() {
    Get.toNamed(AppRoutes.myEGreetingCardsScreen);
  }
}
