import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/registration/post_registration_resp.dart';
import '../../data/models/validateCouponCode/get_validate_coupon_code_resp.dart';

class RegiterPageScreen extends StatefulWidget {
  const RegiterPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegiterPageScreen createState() => _RegiterPageScreen();
}

class _RegiterPageScreen extends State<RegiterPageScreen> {
  bool iAgree = false;
  ApiClient api = new ApiClient();
  int? currentindex;
  bool isPhoneNumber = true;
  String passwordtext = '';
  String confirmpasswordtext = '';
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _couponCodeController = new TextEditingController();
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
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              margin: getMargin(
                                  left: 15, top: 13, right: 18, bottom: 13)),
                        ]),
                        AppbarSubtitle(
                            text: "msg_sign_up_get_started".tr,
                            margin: getMargin(left: 10, top: 0)),
                      ],
                    )),
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
                      ToggleSwitch(
                        minWidth: 100.0,
                        initialLabelIndex: currentindex ?? 0,
                        cornerRadius: 20.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Color.fromARGB(255, 255, 245, 232),
                        inactiveFgColor: ColorConstant.pink900,
                        totalSwitches: 2,
                        labels: ['Phone', 'Email'],
                        icons: [Icons.phone, Icons.email],
                        activeBgColors: [
                          [ColorConstant.pink900],
                          [ColorConstant.pink900]
                        ],
                        onToggle: (index) {
                          currentindex = index;
                          togglePhoneNumber();
                        },
                      ),
                      isPhoneNumber
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  const SizedBox(height: 10),
                                  Text("Mobile Number".tr,
                                      style: AppStyle
                                          .txtNunitoSansRegular14Pink900),
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
                                        labelText:
                                            "Enter your Mobile Number".tr,
                                        labelStyle: AppStyle
                                            .txtNunitoSansRegular12
                                            .copyWith(
                                                height: getVerticalSize(1.10),
                                                fontSize: 11),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 183, 183, 183),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 183, 183, 183),
                                            )),
                                        // filled: true,
                                        contentPadding: EdgeInsets.all(10.0),
                                      )),
                                  const SizedBox(height: 10),
                                  Text("Email ID".tr,
                                      style: AppStyle
                                          .txtNunitoSansRegular14Pink900),
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
                                      decoration: InputDecoration(
                                        labelText: "Enter your Email ID".tr,
                                        labelStyle: AppStyle
                                            .txtNunitoSansRegular12
                                            .copyWith(
                                                height: getVerticalSize(1.10),
                                                fontSize: 11),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 183, 183, 183),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 183, 183, 183),
                                            )),
                                        // filled: true,
                                        contentPadding: EdgeInsets.all(10.0),
                                      )),
                                ])
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  const SizedBox(height: 10),
                                  Text("Email ID".tr,
                                      style: AppStyle
                                          .txtNunitoSansRegular14Pink900),
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
                                      decoration: InputDecoration(
                                        labelText: "Enter your Email ID".tr,
                                        labelStyle: AppStyle
                                            .txtNunitoSansRegular12
                                            .copyWith(
                                                height: getVerticalSize(1.10),
                                                fontSize: 11),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 183, 183, 183),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 183, 183, 183),
                                            )),
                                        // filled: true,
                                        contentPadding: EdgeInsets.all(10.0),
                                      )),
                                  const SizedBox(height: 10),
                                  Text("Mobile Number".tr,
                                      style: AppStyle
                                          .txtNunitoSansRegular14Pink900),
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
                                        labelText:
                                            "Enter your Mobile Number".tr,
                                        labelStyle: AppStyle
                                            .txtNunitoSansRegular12
                                            .copyWith(
                                                height: getVerticalSize(1.10),
                                                fontSize: 11),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 183, 183, 183),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 183, 183, 183),
                                            )),
                                        // filled: true,
                                        contentPadding: EdgeInsets.all(10.0),
                                      )),
                                ]),

                      const SizedBox(height: 10),
                      Text("lbl_password".tr,
                          style: AppStyle.txtNunitoSansRegular14Pink900),
                      SizedBox(height: 10),
                      TextFormField(
                          obscureText: true,
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
                          onChanged: (text) {
                            setState(() {
                              passwordtext = text;
                            });
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Enter your Password".tr,
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
                      const SizedBox(height: 10),
                      Text("msg_confirm_password".tr,
                          style: AppStyle.txtNunitoSansRegular14Pink900),
                      SizedBox(height: 10),
                      TextFormField(
                          obscureText: true,
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
                          onChanged: (text) {
                            setState(() {
                              confirmpasswordtext = text;
                            });
                          },
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: "Confirm your Password".tr,
                            labelStyle: AppStyle.txtNunitoSansRegular12
                                .copyWith(
                                    height: getVerticalSize(1.10),
                                    fontSize: 11),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: (passwordtext.isNotEmpty &&
                                        confirmpasswordtext.isNotEmpty)
                                    ? ((passwordtext == confirmpasswordtext)
                                        ? Color.fromARGB(255, 0, 172, 77)
                                        : Color.fromARGB(255, 255, 3, 3))
                                    : Color.fromARGB(255, 183, 183, 183),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: (passwordtext.isNotEmpty &&
                                          confirmpasswordtext.isNotEmpty)
                                      ? ((passwordtext == confirmpasswordtext)
                                          ? Color.fromARGB(255, 0, 172, 77)
                                          : Color.fromARGB(255, 255, 3, 3))
                                      : Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,

                            contentPadding: EdgeInsets.all(10.0),
                          )),

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

  onTapRegister() {
    Navigator.of(context).pushNamed(AppRoutes.verifiactionPageScreen);
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
        "TypeOfLogin": isPhoneNumber ? "2" : "1",
        "Email": _emailController.text,
        "PhoneNumber": _phoneController.text,
        "DisplayName": _nameController.text,
        "Password": _passwordController.text,
        "ConfirmPassword": _confirmPasswordController.text,
        "CoupanCode": _couponCodeController.text
      };
      PostRegistrationResp resp =
          await api.createRegistration(requestData: req);
      if (resp.isSuccess ?? false) {
        var res = resp.result;
        var userID = res!.userId;
        // GlobalVariables.setUserID(userID ?? '');
        // GlobalVariables.setLogin(true);
        Navigator.of(context)
            .pushNamed(AppRoutes.verifiactionPageScreen, arguments: {
          "type": (isPhoneNumber ? "2" : "1"),
          "name": _nameController.text,
          "email": _emailController.text,
          "phonenumber": _phoneController.text,
          "userID": userID
        });
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

  togglePhoneNumber() {
    // setState(() {

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        if (currentindex != null) {
          if (currentindex == 0)
            isPhoneNumber = true;
          else
            isPhoneNumber = false;
        }
      });
    });

    // });
  }

  onTapTxtAlreadyhavean() {
    Navigator.of(context).pushNamed(AppRoutes.signupPageScreen);
  }
}
