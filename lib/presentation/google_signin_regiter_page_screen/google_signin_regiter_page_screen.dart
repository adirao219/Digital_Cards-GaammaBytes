import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_checkbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/registration/post_registration_resp.dart';
import '../../data/models/validateCouponCode/get_validate_coupon_code_resp.dart';

class GoogleSigninRegiterPageScreen extends StatefulWidget {
  const GoogleSigninRegiterPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoogleSigninRegiterPageScreen createState() =>
      _GoogleSigninRegiterPageScreen();
}

class _GoogleSigninRegiterPageScreen
    extends State<GoogleSigninRegiterPageScreen> {
  bool iAgree = false;

  User? googleUser = Get.arguments["userInfo"] as User?;
  ApiClient api = new ApiClient();
  int? currentindex;
  bool isPhoneNumber = false;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _couponCodeController = new TextEditingController();

  @override
  void initState() {
    setState(() {
      _nameController.text = googleUser!.displayName ?? '';
      _emailController.text = googleUser!.email ?? '';
      _phoneController.text = googleUser!.phoneNumber ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: (CustomAppBar(
                height: getVerticalSize(94.00),
                leadingWidth: 150,
                leading: Container(
                  height: getVerticalSize(36.00),
                  width: getHorizontalSize(38.00),
                  margin: getMargin(left: 38, top: 44, bottom: 14),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Stack(alignment: Alignment.centerLeft, children: [
                            AppbarImage(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                svgPath: ImageConstant.imgContrast),
                            AppbarImage(
                                height: getVerticalSize(10.00),
                                width: getHorizontalSize(5.00),
                                svgPath: ImageConstant.imgVectorstroke,
                                margin: getMargin(
                                    left: 15, top: 13, right: 18, bottom: 13)),
                          ]),
                          AppbarSubtitle(
                              text: "msg_sign_up_get_started".tr,
                              margin: getMargin(left: 10, top: 0)),
                        ],
                      )),
                ),
                actions: [],
                styleType: Style.bgStyle_7)),
            body: SingleChildScrollView(
                // width: size.width,
                padding: getPadding(left: 40, top: 13, right: 40, bottom: 13),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Padding(
                      //     padding: getPadding(left: 8, bottom: 30),
                      //     child: Text("lbl_sign_up2".tr,
                      //         overflow: TextOverflow.ellipsis,
                      //         textAlign: TextAlign.left,
                      //         style: AppStyle.txtNunitoSansBold28
                      //             .copyWith(height: getVerticalSize(1.00)))),
                      Text("Name".tr,
                          style: AppStyle.txtNunitoSansRegular14Pink900),
                      SizedBox(height: 10),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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

                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Enter your Name".tr,
                            labelStyle: AppStyle.txtNunitoSansRegular12
                                .copyWith(
                                    height: getVerticalSize(1.10),
                                    fontSize: 11),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 183, 183, 183),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(10.0),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Email ID".tr,
                                style: AppStyle.txtNunitoSansRegular14Pink900),
                            SizedBox(height: 10),
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
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  // labelText: "Enter your Email ID".tr,
                                  labelStyle: AppStyle.txtNunitoSansRegular12
                                      .copyWith(
                                          height: getVerticalSize(1.10),
                                          fontSize: 11),
                                  enabled: false,
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
                                  contentPadding: EdgeInsets.all(10.0),
                                )),
                            const SizedBox(height: 10),
                            Text("Mobile Number".tr,
                                style: AppStyle.txtNunitoSansRegular14Pink900),
                            SizedBox(height: 10),
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
                                  labelText: "Enter your Mobile Number".tr,
                                  labelStyle: AppStyle.txtNunitoSansRegular12
                                      .copyWith(
                                          height: getVerticalSize(1.10),
                                          fontSize: 11),

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
                                  contentPadding: EdgeInsets.all(10.0),
                                )),
                          ]),

                      const SizedBox(height: 10),

                      Text("Coupon Code".tr,
                          style: AppStyle.txtNunitoSansRegular14Pink900),
                      SizedBox(height: 10),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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

                          controller: _couponCodeController,
                          decoration: InputDecoration(
                            labelText: "Enter the Coupon Code".tr,
                            labelStyle: AppStyle.txtNunitoSansRegular12
                                .copyWith(
                                    height: getVerticalSize(1.10),
                                    fontSize: 11),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 183, 183, 183),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(10.0),
                          )),
                      Row(
                        children: [
                          Checkbox(
                              value: iAgree,
                              onChanged: (vale) {
                                setState(() {
                                  iAgree = vale ?? false;
                                });
                              }),
                          Text("I agree to the terms and conditions".tr,
                              style: AppStyle.txtNunitoSansRegular14Pink900),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (iAgree) {
                            validateCouponCode();
                          }
                        },
                        child: CustomButton(
                            height: 40,
                            width: 300,
                            text: "Register".tr,
                            customColor: iAgree ? null : Colors.grey,
                            margin: getMargin(top: 24)),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding:
                                  getPadding(top: 20, right: 32, bottom: 5),
                              child: InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        AppRoutes.verifiactionPageScreen);
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_already_have_an2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray90002,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w400,
                                                height: getVerticalSize(1.22))),
                                        TextSpan(
                                            text: "  ".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray90002,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w600,
                                                height: getVerticalSize(1.22))),
                                        TextSpan(
                                            text: "Sign-In".tr,
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .deepOrangeA100,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w600,
                                                height: getVerticalSize(1.22)))
                                      ]),
                                      textAlign: TextAlign.left))))
                    ]))));
  }

  validateCouponCode() async {
    if (_couponCodeController.text.trim().isNotEmpty) {
      try {
        var req = {
          "coupon": _couponCodeController.text,
        };
        GetValidateCouponCodeResp resp =
            await api.fetchValidateCouponCode(queryParams: req);
        if ((resp.isSuccess ?? false)) {
          if (resp.result ?? false) {
            registerUser();
          } else {
            Get.snackbar('Error', resp.errorMessage.toString(),
                backgroundColor: Color.fromARGB(255, 255, 230, 230),
                colorText: Colors.red[900],
                icon: Icon(
                  Icons.error,
                  color: Colors.red[900],
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
      registerUser();
    }
  }

  registerUser() async {
    try {
      var req = {
        "TypeOfLogin": "1",
        "Email": _emailController.text,
        "PhoneNumber": _phoneController.text,
        "DisplayName": _nameController.text,
        "Key": googleUser?.providerData[0].uid,
        "Password": "Abc@123",
        "ConfirmPassword": "Abc@123",
        "CouponCode": _couponCodeController.text
      };
      PostRegistrationResp resp = await api.createGoogleUser(requestData: req);
      if (resp.isSuccess ?? false) {
        var res = resp.result;
        var userID = res!.userId;
        var googleDisplayName = googleUser!.providerData[0].displayName ?? '';
        var googleUseremail = googleUser!.providerData[0].email ?? '';
        var googleUserToken = googleUser!.providerData[0].uid;
        var googleUserName = googleUser!.providerData[0].email ?? '';
        var googleUserPhoneNumber = googleUser!.providerData[0].phoneNumber ?? '';
        var googleUserPhotoURL = googleUser!.providerData[0].photoURL ?? '';

        GlobalVariables.setUserID(userID ?? '');
        GlobalVariables.setLogin(true);
        GlobalVariables.setGoogleLoggedIn(true);
        GlobalVariables.setDisplayname(googleDisplayName);
        GlobalVariables.setUserName(googleUseremail);

        GlobalVariables.setUserPhotoUrl(googleUserPhotoURL);

      Get.snackbar('Success', "Welcome to Gaamma Cards",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
      Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.homePageScreen, (Route<dynamic> route) => false);
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
  }

  onTapTxtAlreadyhavean() {
    Navigator.of(context).pushNamed(AppRoutes.signupPageScreen);
  }
}
