
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ImageModifythreeOneScreen
 extends StatefulWidget {
  const ImageModifythreeOneScreen
({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _ImageModifythreeOneScreen
 createState() => _ImageModifythreeOneScreen
();
            }

class _ImageModifythreeOneScreen
 extends State<ImageModifythreeOneScreen
> {
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
                              left: 38, top: 44, right: 115, bottom: 7),
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
                                          svgPath:
                                              ImageConstant.imgVectorstroke,
                                          margin: getMargin(
                                              left: 15,
                                              top: 13,
                                              right: 18,
                                              bottom: 13))
                                    ])),
                            AppbarTitle(
                                text: "lbl_select_image".tr.toUpperCase(),
                                margin: getMargin(left: 40, top: 14))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_42),
            body: Container(
                width: size.width,
                padding: getPadding(left: 20, top: 8, right: 20, bottom: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle4193,
                                height: getVerticalSize(292.00),
                                width: getHorizontalSize(312.00),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(10.00))),
                            Container(
                                height: getVerticalSize(292.00),
                                width: getHorizontalSize(16.00),
                                margin: getMargin(left: 2),
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                              height: getVerticalSize(292.00),
                                              width: getHorizontalSize(5.00),
                                              margin: getMargin(right: 5),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.gray400))),
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              height: getSize(16.00),
                                              width: getSize(16.00),
                                              margin: getMargin(top: 14),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.blueGray100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              8.00)))))
                                    ]))
                          ]),
                      Container(
                          height: getVerticalSize(16.00),
                          width: getHorizontalSize(312.00),
                          margin: getMargin(top: 2),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: getVerticalSize(5.00),
                                    width: getHorizontalSize(312.00),
                                    margin: getMargin(bottom: 5),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray400))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(left: 20),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.blueGray100,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(8.00)))))
                          ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 5, top: 35),
                              child: Text("lbl_type".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16))),
                      Padding(
                          padding: getPadding(left: 5, top: 3, right: 4),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: getPadding(
                                        left: 53, top: 5, right: 53, bottom: 5),
                                    decoration: AppDecoration.outlinePink900
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: getVerticalSize(17.00),
                                              width: getHorizontalSize(23.00),
                                              margin:
                                                  getMargin(top: 6, right: 11),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorConstant.pink900,
                                                      width: getHorizontalSize(
                                                          1.00)))),
                                          Padding(
                                              padding: getPadding(top: 2),
                                              child: Text("lbl_square".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14Pink900))
                                        ])),
                                Container(
                                    padding: getPadding(
                                        left: 59, top: 6, right: 59, bottom: 6),
                                    decoration: AppDecoration.outlineGray300
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: getVerticalSize(17.00),
                                              width: getHorizontalSize(23.00),
                                              margin: getMargin(top: 5),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              8.00)),
                                                  border: Border.all(
                                                      color: ColorConstant
                                                          .black900,
                                                      width: getHorizontalSize(
                                                          1.00)))),
                                          Padding(
                                              padding: getPadding(top: 1),
                                              child: Text("lbl_circle".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14Black900))
                                        ]))
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 5, top: 24),
                              child: Text("lbl_size".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16))),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Text("lbl_x".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoSansRegular14Black900)),
                      Padding(
                          padding: getPadding(left: 5, top: 1, right: 4),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(145.00),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray300)),
                                Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(145.00),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray300))
                              ])),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_ok".tr,
                          margin: getMargin(top: 61, bottom: 5),
                          onTap: onTapOk)
                    ]))));
  }

  onTapOk() {
    Get.toNamed(AppRoutes.bandUpicardScreen);
  }
}
