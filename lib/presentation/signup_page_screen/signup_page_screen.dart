import 'controller/signup_page_controller.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:digitalcards_gaammabytes/domain/googleauth/google_auth_helper.dart';

class SignupPageScreen extends StatefulWidget {
  const SignupPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageScreen createState() => _SignupPageScreen();
}

class _SignupPageScreen extends State<SignupPageScreen> {
  
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
                    height: getVerticalSize(98.15),
                    width: size.width,
                    child: Stack(alignment: Alignment.centerRight, children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100,
                          margin: getMargin(bottom: 4)),
                      AppbarSubtitle(
                          text: "msg_sign_in_to_gaamma_cards".tr,
                          margin: getMargin(
                              left: 54, top: 50, right: 39, bottom: 22)),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 57, top: 83, right: 57),
                              child: Text("msg_use_your_credentials".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold12)))
                    ])),
                styleType: Style.bgStyle_3),
            body: Container(
                width: size.width,
                padding: getPadding(left: 38, top: 61, right: 38),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            onTapRowgooglelogoone();
                          },
                          child: Container(
                              margin: getMargin(left: 31, right: 18),
                              padding: getPadding(
                                  left: 19, top: 7, right: 19, bottom: 7),
                              decoration: AppDecoration.outlineBlack9003f2
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgGooglelogo1,
                                        height: getVerticalSize(25.00),
                                        width: getHorizontalSize(26.00)),
                                    Padding(
                                        padding: getPadding(
                                            left: 15,
                                            top: 2,
                                            right: 1,
                                            bottom: 1),
                                        child: Text(
                                            "msg_continue_with_google".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtNunitoSansBlack16))
                                  ]))),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 43),
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
                                                  "msg_jameswilliams123_gmail_com"
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
                                    child: Text("lbl_phone_email_id".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtNunitoSansRegular12)))
                          ])),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 12),
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
                                    child: Text("lbl_password3".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtNunitoSansRegular12)))
                          ])),
                      GestureDetector(
                          onTap: () {
                            onTapTxtForgotpassword2();
                          },
                          child: Padding(
                              padding: getPadding(top: 8, right: 3),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_forgot_password".tr,
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
                                                TextDecoration.underline))
                                  ]),
                                  textAlign: TextAlign.left))),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_sign_in2".tr,
                          margin: getMargin(top: 36),
                          fontStyle: ButtonFontStyle.InterSemiBold14,
                          onTap: onTapSignin,
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount();
                              },
                              child: Container(
                                  width: getHorizontalSize(155.00),
                                  margin:
                                      getMargin(left: 64, top: 25, bottom: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray90002,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(
                                            text: "lbl_create_account".tr,
                                            style: TextStyle(
                                                color:
                                                    ColorConstant.deepOrange300,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline))
                                      ]),
                                      textAlign: TextAlign.center))))
                    ]))));
  }

  onTapRowgooglelogoone() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtForgotpassword2() {
    Get.toNamed(AppRoutes.forgotPasswordoneScreen);
  }

  onTapSignin() {
    Get.toNamed(AppRoutes.homePageScreen);
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(AppRoutes.regiterPageScreen);
  }
}
