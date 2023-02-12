import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifiactionPageScreen extends StatefulWidget {
  const VerifiactionPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerifiactionPageScreen createState() => _VerifiactionPageScreen();
}

class _VerifiactionPageScreen extends State<VerifiactionPageScreen> {
  TextEditingController _otpController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                          text: "lbl_verification".tr,
                          margin: getMargin(
                              left: 118, top: 54, right: 118, bottom: 14))
                    ])),
                styleType: Style.bgStyle_2),
            body: Container(
                width: size.width,
                padding: getPadding(left: 50, top: 31, right: 50, bottom: 31),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "lbl_enter".tr,
                                style: TextStyle(
                                    color: ColorConstant.gray90001,
                                    fontSize: getFontSize(20),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300)),
                            TextSpan(
                                text: "msg_otp_verification".tr,
                                style: TextStyle(
                                    color: ColorConstant.gray90001,
                                    fontSize: getFontSize(20),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300))
                          ]),
                          textAlign: TextAlign.left),
                      Padding(
                          padding: getPadding(top: 50),
                          child: PinCodeTextField(
                              appContext: context,
                              controller: _otpController,
                              length: 4,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType.number,
                              autoDismissKeyboard: true,
                              enableActiveFill: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {},
                              textStyle: TextStyle(
                                  color: ColorConstant.gray90003,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400),
                              pinTheme: PinTheme(
                                fieldWidth: getHorizontalSize(40.00),
                                shape: PinCodeFieldShape.underline,
                                selectedFillColor: ColorConstant.gray200,
                                activeFillColor: ColorConstant.gray200,
                                inactiveFillColor: ColorConstant.gray200,
                                inactiveColor: ColorConstant.gray50,
                                selectedColor: ColorConstant.gray50,
                                activeColor: ColorConstant.gray50,
                              ))),
                      CustomButton(
                          alignment: Alignment.center,
                          height: 40,
                          width: 250,
                          text: "msg_verify_sign_in".tr,
                          margin: getMargin(top: 30),
                          fontStyle: ButtonFontStyle.InterSemiBold14,
                          onTap: onTapVerifysigninOne),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 13, bottom: 5),
                              child: Text("msg_resend_otp_verification".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold15
                                      .copyWith(
                                          decoration:
                                              TextDecoration.underline))))
                    ]))));
  }

  onTapVerifysigninOne() {
    Navigator.of(context).pushNamed(AppRoutes.signupPageScreen);
  }
}
