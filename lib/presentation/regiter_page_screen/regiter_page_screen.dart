import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class RegiterPageScreen extends StatefulWidget {
  const RegiterPageScreen({super.key});

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

                          // controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "lbl_your_name".tr,
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
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      const SizedBox(height: 35),
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

                          // controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "Mobile Number".tr,
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
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      const SizedBox(height: 35),
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

                          // controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "Email ID".tr,
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
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      const SizedBox(height: 35),
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

                          // controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "lbl_password".tr,
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
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      const SizedBox(height: 35),
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

                          // controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "msg_confirm_password".tr,
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
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      const SizedBox(height: 35),
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

                          // controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "Coupon Code".tr,
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
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.verifiactionPageScreen);
                        },
                        child: CustomButton(
                            height: 40,
                            width: 300,
                            text: "Register".tr,
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

  onTapTxtAlreadyhavean() {
    Navigator.of(context).pushNamed(AppRoutes.signupPageScreen);
  }
}
