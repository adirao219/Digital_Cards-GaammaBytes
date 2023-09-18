import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/confirmUser/post_confirm_user_resp.dart';

class ForgotPasswordoneScreen extends StatefulWidget {
  const ForgotPasswordoneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordoneScreen createState() => _ForgotPasswordoneScreen();
}

class _ForgotPasswordoneScreen extends State<ForgotPasswordoneScreen> {
  TextEditingController _usernameController = new TextEditingController();
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
                    height: getVerticalSize(108.00),
                    width: size.width,
                    child: Stack(alignment: Alignment.center, children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100,
                          margin: getMargin(bottom: 14)),
                      AppbarImage(
                          height: getVerticalSize(108.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100)
                    ]))),
            body: Container(
                width: size.width,
                padding: getPadding(left: 31, top: 29, right: 31, bottom: 29),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 23),
                          child: Text("msg_forgot_password".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold20)),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(335.00),
                          margin: getMargin(top: 26),
                          child: Stack(alignment: Alignment.topLeft, children: [
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

                                controller: _usernameController,
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
                          ])),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_next".tr,
                          margin: getMargin(top: 27, bottom: 5),
                          onTap: onTapNext,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapNext() async {
    ApiClient api = new ApiClient();
    bool isEmail = false;
    try {
      isEmail = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_usernameController.text);
    } catch (e) {}
    try {
      var req = {
        "TypeOfLogin": (isEmail ? "1" : "2"),
        "Email": (isEmail ? _usernameController.text : ""),
        "PhoneNumber": (isEmail ? "" : _usernameController.text)
      };
      CommonGenericResp resp = await api.forgotPassword(context,requestData: req);
      if (resp.isSuccess ?? false) {
        // selectedCardID = resp.result;
        Get.snackbar('Success', "Username validated successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));

GlobalVariables.setUserID( resp.result.toString());
        Navigator.of(context)
            .pushNamed(AppRoutes.verifiactionPageScreen, arguments: {
          "type": (isEmail ? "1" : "2"),
          "name": "",
          "email": isEmail ? _usernameController.text : "",
          "phonenumber": isEmail ? "" : _usernameController.text,
          "userID": resp.result.toString(),
          "isResetPassword": true
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
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }
}
