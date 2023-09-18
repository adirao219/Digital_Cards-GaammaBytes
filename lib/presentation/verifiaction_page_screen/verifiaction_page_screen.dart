import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/data/models/registration/post_registration_resp.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../data/models/confirmUser/post_confirm_user_resp.dart';

class VerifiactionPageScreen extends StatefulWidget {
  const VerifiactionPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerifiactionPageScreen createState() => _VerifiactionPageScreen();
}

class _VerifiactionPageScreen extends State<VerifiactionPageScreen> {
  TextEditingController _otpController = new TextEditingController();
  String otpValue = "";
  var type = Get.arguments["type"] as String?;
  var name = Get.arguments["name"] as String?;
  var email = Get.arguments["email"] as String?;
  var phonenumber = Get.arguments["phonenumber"] as String?;
  var userID = Get.arguments["userID"] as String?;

  var isResetPassword = Get.arguments["isResetPassword"] as bool?;

  ApiClient api = new ApiClient();
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
                              left: 100, top: 54, right: 118, bottom: 14))
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
                          padding: getPadding(top: 25),
                          child: PinCodeTextField(
                              appContext: context,
                              controller: _otpController,
                              length: 4,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: type == "1"
                                  ? TextInputType.text
                                  : TextInputType.number,
                              autoDismissKeyboard: true,
                              enableActiveFill: true,
                              inputFormatters: [
                                type == "1"
                                    ? FilteringTextInputFormatter
                                        .singleLineFormatter
                                    : FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {
                                setState(() {
                                  otpValue = value;
                                });
                              },
                              textStyle: TextStyle(
                                  color: ColorConstant.gray90003,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400),
                              pinTheme: PinTheme(
                                  fieldWidth: getHorizontalSize(40.00),
                                  shape: PinCodeFieldShape.box,
                                  selectedFillColor:
                                      Color.fromARGB(255, 253, 233, 213),
                                  activeFillColor:
                                      Color.fromARGB(255, 255, 246, 237),
                                  inactiveFillColor:
                                      Color.fromARGB(255, 255, 246, 237),
                                  inactiveColor:
                                      Color.fromARGB(255, 172, 71, 13),
                                  selectedColor:
                                      Color.fromARGB(255, 172, 71, 13),
                                  activeColor: Color.fromARGB(255, 172, 71, 13),
                                  errorBorderColor: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                  borderWidth: 1))),
                      CustomButton(
                          alignment: Alignment.center,
                          height: 40,
                          width: 250,
                          text: "msg_verify_sign_in".tr,
                          margin: getMargin(top: 25),
                          fontStyle: ButtonFontStyle.InterSemiBold14,
                          onTap: verifyUser),
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

  verifyUser() async {
    if (otpValue.length == 4) {
      try {
        var req = {
          "TypeOfLogin": type,
          "DisplayName": name,
          "Email": email,
          "PhoneNumber": phonenumber,
          "VerificationCode": otpValue
        };
        CommonGenericResp resp = await api.createConfirmUser(context,requestData: req);
        if ((resp.isSuccess ?? false)) {
          if (isResetPassword ?? false) {
            // GlobalVariables.setUserID("");
            Navigator.of(context).pushNamed(AppRoutes.resetPasswordScreen);

            Get.snackbar('Success', "OTP verified successfully",
                backgroundColor: Color.fromARGB(255, 208, 245, 216),
                colorText: Colors.green[900],
                icon: Icon(
                  Icons.done,
                  color: Colors.green[900],
                ));
          } else {
            // GlobalVariables.setLogin(true);
            // GlobalVariables.setUserID(userID ?? '');

            Navigator.of(context).pushNamed(AppRoutes.signupPageScreen);

            Get.snackbar('Account created successfully', "Please signin to continue.",
                backgroundColor: Color.fromARGB(255, 208, 245, 216),
                colorText: Colors.green[900],
                icon: Icon(
                  Icons.done,
                  color: Colors.green[900],
                ));
          }
        } else {
          Get.snackbar('Error', resp.errorMessage.toString(),
              backgroundColor: Color.fromARGB(255, 255, 230, 230),
              colorText: Colors.red[900],
              icon: Icon(
                Icons.error,
                color: Colors.red[900],
              ));
        }
      } catch (ex) {}
    } else {
      Get.snackbar('Error', "Please enter valid OTP",
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }
}
