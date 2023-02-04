
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BandUpicardScreen extends StatefulWidget {
  const BandUpicardScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BandUpicardScreen createState() => _BandUpicardScreen();
            }

class _BandUpicardScreen extends State<BandUpicardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child:MoreOptionMenu()),
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
                                margin: getMargin(left: 76, top: 16))
                          ]))
                    ])),
                 // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_40),
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
                                    text: "msg_band_type_ex_upi".tr,
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
                              height: getVerticalSize(143.00),
                              width: getHorizontalSize(340.00),
                              margin: getMargin(top: 34),
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
                                                  Text("lbl_upi_id".tr,
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
                                                          left: 6, top: 11),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray300Cc,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1.00)))),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 23),
                                                      child: Text(
                                                          "lbl_upi_mobile".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansRegular14
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36)))),
                                                  Container(
                                                      height:
                                                          getVerticalSize(1.00),
                                                      width: getHorizontalSize(
                                                          326.00),
                                                      margin: getMargin(
                                                          left: 3, top: 10),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray300Cc,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1.00)))),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 7),
                                                      child: Row(children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 17,
                                                                bottom: 4),
                                                            child: Text(
                                                                "lbl_upi_qrcode"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtNunitoSansRegular14
                                                                    .copyWith(
                                                                        letterSpacing:
                                                                            getHorizontalSize(0.36)))),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapRowmap();
                                                            },
                                                            child: Container(
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            2),
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            17,
                                                                        top: 11,
                                                                        right:
                                                                            17,
                                                                        bottom:
                                                                            11),
                                                                decoration: AppDecoration
                                                                    .outlineBlack9003f2
                                                                    .copyWith(
                                                                        borderRadius:
                                                                            BorderRadiusStyle
                                                                                .roundedBorder5),
                                                                child: Row(
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgMap,
                                                                          height: getVerticalSize(
                                                                              18.00),
                                                                          width:
                                                                              getHorizontalSize(17.00)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  18,
                                                                              top:
                                                                                  3,
                                                                              right:
                                                                                  7,
                                                                              bottom:
                                                                                  1),
                                                                          child: Text(
                                                                              "lbl_select_image".tr,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtInterBlack12))
                                                                    ])))
                                                      ])),
                                                  Container(
                                                      height:
                                                          getVerticalSize(1.00),
                                                      width: getHorizontalSize(
                                                          326.00),
                                                      margin: getMargin(
                                                          left: 3, top: 6),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray300Cc,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      1.00))))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            margin: getMargin(
                                                left: 248, top: 102, bottom: 7),
                                            padding: getPadding(
                                                left: 11,
                                                top: 8,
                                                right: 11,
                                                bottom: 8),
                                            decoration: AppDecoration
                                                .outlineBlack9003f2
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgDelete,
                                                      height: getVerticalSize(
                                                          10.00),
                                                      width: getHorizontalSize(
                                                          9.00),
                                                      margin: getMargin(
                                                          top: 2, bottom: 4)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 11,
                                                          right: 9,
                                                          bottom: 3),
                                                      child: Text(
                                                          "lbl_remove".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtInterBlack10))
                                                ])))
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
