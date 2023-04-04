import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BandPictureScreen extends StatefulWidget {
  const BandPictureScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BandPictureScreen createState() => _BandPictureScreen();
}

class _BandPictureScreen extends State<BandPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: MoreOptionMenu()),
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
                              left: 38, top: 44, right: 151, bottom: 5),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(children: [
                                Container(
                                    height: getVerticalSize(36.00),
                                    width: getHorizontalSize(38.00),
                                    margin: getMargin(bottom: 8),
                                    child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          AppbarImage(
                                              height: getVerticalSize(36.00),
                                              width: getHorizontalSize(38.00),
                                              svgPath:
                                                  ImageConstant.imgContrast),
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
                                    text: "lbl_bands2".tr.toUpperCase(),
                                    margin: getMargin(left: 76, top: 16))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_36),
            body: Container(
                width: size.width,
                padding: getPadding(left: 10, top: 20, right: 10, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(286.00),
                          margin: getMargin(left: 26),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_card_name_ex3".tr,
                                    style: TextStyle(
                                        color: ColorConstant.pink900,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: "msg_band_type_ex_picture".tr,
                                    style: TextStyle(
                                        color: ColorConstant.pink900,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w600))
                              ]),
                              textAlign: TextAlign.left)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: getVerticalSize(87.00),
                              width: getHorizontalSize(340.00),
                              margin: getMargin(top: 35),
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(right: 8),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_heading".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNunitoSansRegular14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.36))),
                                                  Container(
                                                      height:
                                                          getVerticalSize(1.00),
                                                      width: getHorizontalSize(
                                                          326.00),
                                                      margin: getMargin(
                                                          left: 6, top: 10),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray300Cc,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1.00)))),
                                                  Container(
                                                      height: getVerticalSize(
                                                          47.00),
                                                      width: getHorizontalSize(
                                                          329.00),
                                                      margin: getMargin(top: 9),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .topRight,
                                                          children: [
                                                            Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "lbl_picture2"
                                                                              .tr,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style: AppStyle
                                                                              .txtNunitoSansRegular14
                                                                              .copyWith(letterSpacing: getHorizontalSize(0.36))),
                                                                      Container(
                                                                          height: getVerticalSize(
                                                                              1.00),
                                                                          width: getHorizontalSize(
                                                                              326.00),
                                                                          margin: getMargin(
                                                                              left:
                                                                                  3,
                                                                              top:
                                                                                  11),
                                                                          decoration: BoxDecoration(
                                                                              color: ColorConstant.gray300Cc,
                                                                              borderRadius: BorderRadius.circular(getHorizontalSize(1.00))))
                                                                    ])),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: GestureDetector(
                                                                    onTap: () {
                                                                      onTapRowmap();
                                                                    },
                                                                    child: Container(
                                                                        margin: getMargin(left: 88, right: 55, bottom: 5),
                                                                        padding: getPadding(left: 30, top: 11, right: 30, bottom: 11),
                                                                        decoration: AppDecoration.outlineBlack9003f2.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                                                                        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgMap,
                                                                              height: getVerticalSize(18.00),
                                                                              width: getHorizontalSize(17.00),
                                                                              margin: getMargin(bottom: 1)),
                                                                          Padding(
                                                                              padding: getPadding(left: 24, top: 3, bottom: 1),
                                                                              child: Text("lbl_select_image".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterBlack12))
                                                                        ]))))
                                                          ]))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: getMargin(bottom: 6),
                                            color: ColorConstant.pink900,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                            child: Container(
                                                height: getVerticalSize(41.00),
                                                width: getHorizontalSize(55.00),
                                                padding: getPadding(
                                                    left: 22,
                                                    top: 14,
                                                    right: 22,
                                                    bottom: 14),
                                                decoration: AppDecoration
                                                    .outlineBlack9003f2
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Stack(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgDelete,
                                                      height: getVerticalSize(
                                                          10.00),
                                                      width: getHorizontalSize(
                                                          9.00),
                                                      alignment:
                                                          Alignment.topLeft)
                                                ]))))
                                  ]))),
                      Spacer(),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_save".tr,
                          margin: getMargin(bottom: 56),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapSave,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapRowmap() {
    Navigator.of(context).pushNamed(AppRoutes.imageModifyScreen);
  }

  onTapSave() {
    Navigator.of(context).pushNamed(AppRoutes.bandsScreen);
  }
}
