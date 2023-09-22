import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../data/models/confirmUser/post_confirm_user_resp.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangePasswordScreen createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  TextEditingController _oldpasswordController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();
  ApiClient api = new ApiClient();
  String passwordtext = '';
  String confirmpasswordtext = '';

  bool _oldpasswordVisible = false;
  bool _newpasswordVisible = false;
  bool _confirmpasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            108.00,
          ),
          centerTitle: true,
          title: Container(
            height: getVerticalSize(
              94.00,
            ),
            width: size.width,
            child: Stack(
              children: [
                AppbarImage(
                  height: getVerticalSize(
                    94.00,
                  ),
                  width: getHorizontalSize(
                    375.00,
                  ),
                  imagePath: ImageConstant.imgVectorDeepOrangeA100,
                ),
                Container(
                  height: getVerticalSize(
                    36.00,
                  ),
                  width: getHorizontalSize(
                    38.00,
                  ),
                  margin: getMargin(
                    left: 38,
                    top: 44,
                    right: 299,
                    bottom: 14,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        AppbarImage(
                          height: getVerticalSize(
                            36.00,
                          ),
                          width: getHorizontalSize(
                            38.00,
                          ),
                          svgPath: ImageConstant.imgContrast,
                        ),
                        AppbarImage(
                          height: getVerticalSize(
                            10.00,
                          ),
                          width: getHorizontalSize(
                            5.00,
                          ),
                          svgPath: ImageConstant.imgVectorstroke,
                          margin: getMargin(
                            left: 15,
                            top: 13,
                            right: 18,
                            bottom: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            AppbarImage(
              height: getVerticalSize(
                35.00,
              ),
              width: getHorizontalSize(
                43.00,
              ),
              svgPath: ImageConstant.imgOverflowmenu,
              margin: getMargin(
                left: 3,
                top: 47,
                right: 3,
                bottom: 26,
              ),
            ),
          ],
          styleType: Style.bgStyle_10,
        ),
        body: Container(
            width: size.width,
            padding: getPadding(
              left: 31,
              top: 24,
              right: 31,
              bottom: 24,
            ),
            child: Column(
              children: [
                Padding(
                  padding: getPadding(
                    left: 0,
                  ),
                  child: Text(
                    "lbl_change_password".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold20,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 18,
                    ),
                    child: Column(children: [
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
                          onChanged: (text) {
                            setState(() {
                              passwordtext = text;
                            });
                          },
                          obscureText: !_oldpasswordVisible,
                          controller: _oldpasswordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _oldpasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: ColorConstant.pink900,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _oldpasswordVisible = !_oldpasswordVisible;
                                      });
                                    },
                                  ),
                            labelText: "lbl_passwordold".tr,
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
                          onChanged: (text) {
                            setState(() {
                              passwordtext = text;
                            });
                          },
                          obscureText: !_newpasswordVisible,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _newpasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: ColorConstant.pink900,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _newpasswordVisible = !_newpasswordVisible;
                                      });
                                    },
                                  ),
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
                          onChanged: (text) {
                            setState(() {
                              confirmpasswordtext = text;
                            });
                          },
                          obscureText: _confirmpasswordVisible,
                          controller: _confirmpasswordController,
                          decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _confirmpasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: ColorConstant.pink900,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _confirmpasswordVisible = !_confirmpasswordVisible;
                                      });
                                    },
                                  ),
                            labelText: "msg_confirm_password".tr,
                            labelStyle: AppStyle.txtNunitoSansRegular12
                                .copyWith(
                                    height: getVerticalSize(1.10),
                                    fontSize: 13),

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
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      CustomButton(
                        onTap: onTapSave,
                        height: 40,
                        width: 250,
                        text: "lbl_save".tr,
                        margin: getMargin(
                          top: 40,
                          bottom: 5,
                        ),
                        alignment: Alignment.center,
                      ),
                    ])),
              ],
            )),
      ),
    );
  }

  onTapSave() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "OldPassword": _oldpasswordController.text,
        "NewPassword": _passwordController.text,
        "ConfirmPassword": _confirmpasswordController.text
      };
      CommonGenericResp resp = await api.changePassword(context,requestData: req);
      if (resp.isSuccess ?? false) {
        // selectedCardID = resp.result;
        Get.snackbar("lbl_success".tr, "Password Changed Successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));

        Navigator.of(context).pop();
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {
      Get.snackbar("lbl_error".tr, e.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }
}
