
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class RegiterPageScreen extends StatefulWidget {
  const RegiterPageScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _RegiterPageScreen createState() => _RegiterPageScreen();
            }

class _RegiterPageScreen extends State<RegiterPageScreen> {
  bool iAgree = false;
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
                    child: Stack(alignment: Alignment.center, children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100),
                      AppbarSubtitle(
                          text: "msg_sign_up_get_started".tr,
                          margin: getMargin(
                              left: 63, top: 54, right: 64, bottom: 14))
                    ])),
                styleType: Style.bgStyle_1),
            body: Container(
                width: size.width,
                padding: getPadding(left: 31, top: 16, right: 31, bottom: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(left: 19, right: 19),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(54.00),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700)),
                                          Padding(
                                              padding: getPadding(
                                                  top: 17, bottom: 19),
                                              child: Text(
                                                  "lbl_john_williams".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold14))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 27),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_your_name2".tr,
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "lbl2".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .deepOrangeA100,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      Container(
                          height: getVerticalSize(65.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 8),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(left: 20, right: 20),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(54.00),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700)),
                                          Padding(
                                              padding: getPadding(
                                                  top: 19,
                                                  right: 41,
                                                  bottom: 17),
                                              child: Row(children: [
                                                Container(
                                                    margin: getMargin(
                                                        top: 2, bottom: 2),
                                                    padding: getPadding(all: 4),
                                                    decoration: AppDecoration
                                                        .fillBluegray100
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              height:
                                                                  getSize(7.00),
                                                              width:
                                                                  getSize(7.00),
                                                              decoration: BoxDecoration(
                                                                  color: ColorConstant
                                                                      .black900,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              getHorizontalSize(3.00))))
                                                        ])),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 7),
                                                    child: Text(
                                                        "lbl_mobile_no".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtNunitoSansBold14)),
                                                Spacer(),
                                                Container(
                                                    height: getSize(15.00),
                                                    width: getSize(15.00),
                                                    margin: getMargin(
                                                        top: 2, bottom: 2),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .blueGray100,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    7.00)))),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text(
                                                        "lbl_email_id".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtNunitoSansBold14))
                                              ]))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_sign_up_using2".tr,
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "lbl2".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .deepOrangeA100,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 8),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 20,
                                        top: 18,
                                        right: 20,
                                        bottom: 18),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: Text("lbl_1_9876543210".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold14))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_mobile_no3".tr,
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "lbl2".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .deepOrangeA100,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 8),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(left: 19, right: 19),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(54.00),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700)),
                                          Padding(
                                              padding: getPadding(
                                                  top: 18, bottom: 18),
                                              child: Text(
                                                  "msg_johnwilliams123_gmail_com"
                                                      .tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold14))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_email_id3".tr,
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "lbl2".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .deepOrangeA100,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w700)),
                                          TextSpan(
                                              text: " ",
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 8),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 20,
                                        top: 16,
                                        right: 20,
                                        bottom: 16),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 3),
                                              child: Text("lbl".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold16))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_password2".tr,
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "lbl2".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .deepOrangeA100,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 8),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 20,
                                        top: 16,
                                        right: 20,
                                        bottom: 16),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 3),
                                              child: Text("lbl".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold16))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "msg_confirm_password2".tr,
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.black90066,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "lbl3".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .deepOrangeA100,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                        textAlign: TextAlign.left)))
                          ])),
                      Container(
                          height: getVerticalSize(65.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 9),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 20,
                                        top: 13,
                                        right: 20,
                                        bottom: 13),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 8),
                                              child: Text("lbl_6345898".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold16))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: Text("lbl_coupon_code".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtNunitoSansRegular12)))
                          ])),
                      Obx(() => CustomCheckbox(
                          text: "msg_i_agree_to_the_terms".tr,
                          iconSize: 22,
                          value: iAgree,
                          padding: getPadding(left: 12, top: 12),
                          onChange: (value) {
                            iAgree = value;
                          })),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_register".tr,
                          margin: getMargin(left: 20, top: 15),
                          fontStyle: ButtonFontStyle.InterSemiBold14,
                          onTap: onTapRegister),
                      GestureDetector(
                          onTap: () {
                            onTapTxtAlreadyhavean();
                          },
                          child: Padding(
                              padding: getPadding(left: 29, top: 18, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_already_have_an2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90002,
                                            fontSize: getFontSize(15),
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.gray90002,
                                            fontSize: getFontSize(15),
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline)),
                                    TextSpan(
                                        text: "lbl_sign_in".tr,
                                        style: TextStyle(
                                            color: ColorConstant.deepOrange300,
                                            fontSize: getFontSize(15),
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline))
                                  ]),
                                  textAlign: TextAlign.left)))
                    ]))));
  }

  onTapRegister() {
    Get.toNamed(AppRoutes.verifiactionPageScreen);
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.signupPageScreen);
  }
}
