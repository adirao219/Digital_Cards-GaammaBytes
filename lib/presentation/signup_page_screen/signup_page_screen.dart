import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcards_gaammabytes/data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:digitalcards_gaammabytes/domain/googleauth/google_auth_helper.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/login/post_login_resp.dart';

class SignupPageScreen extends StatefulWidget {
  const SignupPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageScreen createState() => _SignupPageScreen();
}

TextEditingController _phoneController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

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
                      Container(
                        alignment: Alignment.center,
                        child: AppbarSubtitle(
                            text: "msg_sign_in_to_gaamma_cards".tr,
                            margin: getMargin(left: 0, top: 50, bottom: 5)),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 0, top: 83, right: 0),
                              child: Text("msg_use_your_credentials".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold12)))
                    ])),
                styleType: Style.bgStyle_3),
            body: SingleChildScrollView(
                padding: getPadding(left: 38, top: 61, right: 38),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: onTapRowgooglelogoone,
                          child: Container(
                              alignment: Alignment.center,
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
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          child: Column(children: [
                            TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (text) {
                                //   if (_emailController.text == null ||
                                //       _emailController.text.trim().isEmpty) {
                                //     return 'Please enter your email address';
                                //   }
                                //   // Check if the entered email has the right format
                                //   if (!RegExp(r'\S+@\S+\.\S+')
                                //       .hasMatch(_emailController.text)) {
                                //     return 'Please enter a valid email address';
                                //   }
                                //   if (_emailController.text.trim().length >
                                //       35) {
                                //     return 'Email should not be more than 35 characters in length';
                                //   }
                                //   return null;
                                // },
                                // onChanged: (text) =>
                                //     setState(() => _name = text),

                                controller: _phoneController,
                                decoration: InputDecoration(
                                  labelText: "lbl_phone_email_id".tr,
                                  labelStyle: AppStyle.txtNunitoSansRegular12
                                      .copyWith(
                                          height: getVerticalSize(1.10),
                                          fontSize: 13),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 183, 183, 183),
                                      )),
                                  // filled: true,
                                  contentPadding: EdgeInsets.all(15.0),
                                )),
                            const SizedBox(height: 35),
                            TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (text) {
                                //   if (_emailController.text == null ||
                                //       _emailController.text.trim().isEmpty) {
                                //     return 'Please enter your email address';
                                //   }
                                //   // Check if the entered email has the right format
                                //   if (!RegExp(r'\S+@\S+\.\S+')
                                //       .hasMatch(_emailController.text)) {
                                //     return 'Please enter a valid email address';
                                //   }
                                //   if (_emailController.text.trim().length >
                                //       35) {
                                //     return 'Email should not be more than 35 characters in length';
                                //   }
                                //   return null;
                                // },
                                // onChanged: (text) =>
                                //     setState(() => _name = text),

                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: "lbl_password3".tr,
                                  labelStyle: AppStyle.txtNunitoSansRegular12
                                      .copyWith(
                                          height: getVerticalSize(1.10),
                                          fontSize: 13),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 183, 183, 183),
                                      )),
                                  // filled: true,
                                  contentPadding: EdgeInsets.all(15.0),
                                )),
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

  onTapRowgooglelogoone1() async {
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

  Future onTapRowgooglelogoone() async {
    final user = await GoogleSignInApi.login();
  }

  onTapTxtForgotpassword2() {
    Navigator.of(context).pushNamed(AppRoutes.forgotPasswordoneScreen);
  }

  onTapSignin() async {
    ApiClient api = new ApiClient();
    bool isEmail = false;
    try {
      isEmail = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_phoneController.text);
    } catch (e) {}

    var req = {
      "TypeOfLogin": isEmail ? 2 : 1,
      "Email": _phoneController.text,
      "Password": _passwordController.text,
      "RememberMe": false
    };
    PostLoginResp resp = await api.createLogin(requestData: req);
    if (resp.isSuccess ?? false) {
      var res = resp.result;
      var userID = res['UserId'];
      GlobalVariables.setUserID(userID);
      GlobalVariables.setLogin(true);
      Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
    } else {
      Get.snackbar('Error', resp.errorMessage.toString());
    }
  }

  onTapTxtDonthaveanaccount() {
    Navigator.of(context).pushNamed(AppRoutes.regiterPageScreen);
  }
}
