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
                        GestureDetector(onTap:(){showTermsAlertDialog(context);},child:Text("I agree to the terms and conditions".tr,
                              style: AppStyle.txtNunitoSansRegular14Pink900)),
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
                                    Navigator.pop(context);
  
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

  showTermsAlertDialog(BuildContext context) {
    // set up the buttons
    Widget okayButton = TextButton(
      child: Text("Okay",style:AppStyle.txtNunitoSansRegular14Pink900 ,),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Terms and Conditions"),
      content:SingleChildScrollView(
                    child:  Column(
        children: [
          Text(
              """Welcome to our app - Gaamma.Cards. If you continue to browse and use this website, you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern Gaammabytes Pvt Ltd ’s relationship with you in relation to this website.

The term 'Gaammabytes Pvt Ltd' or 'Gaammabytes' or 'us' or 'we' refers to the owner of the website whose registered office is 363, 19th Main Road, 1 st Block, Rajaji Nagar, Bengaluru, Karnataka - 560010. The term 'you' refers to the user or viewer of our website.

The use of this service is subject to the following terms of use:
""",
              style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          Text(
              """• The content provided here is for planning purposes only. You expressly understand and agree that your use of the service and the content is at your sole risk and that the service and the content are provided "as is" and "as available." In particular, Gaammabytes, its subsidiaries and affiliates, and its licensors and their suppliers, do not represent or warrant to you that:
(a) Your use of the service will meet your requirements;
(b) Your use of the service will be uninterrupted, timely, secure or free from error;
(c) The information obtained by you as a result of your use of the service will be accurate or reliable; and
(d) Defects in the operation or functionality of any software provided to you as part of the service will be corrected.

• Any content obtained through the use of this service is done at your own discretion and risk and you will be solely responsible for any damage to your computer system or other device, loss of data, or any other damage or injury that results from the download or use of any such content.

• You must not reverse engineer, decompile or otherwise attempt to extract the source code of the Service or any part thereof, unless this is expressly permitted or required by applicable law.

• The Service may include hyperlinks to other websites or content or resources. Gaammabyteshas no control over any web sites or resources that are provided by companies or persons other than us. You acknowledge and agree that Gaammabytes is not responsible for the availability of any such external sites or resources, and does not endorse any advertising, products, or other materials on or available from such websites or resources.

• If any court of law that has jurisdiction rules that any provision of these Terms is invalid, then that provision will be removed from the Terms without affecting the rest of the Terms. The remaining provisions of the Terms will continue to be valid and enforceable.

• Gaammabytes reserves the right to make changes to the Terms from time to time. You understand and agree that if you use the Service after the date on which the Terms have changed, Gaammabytes will treat your use as acceptance of the updated Terms. If a modification is unacceptable to you, you may terminate this agreement by ceasing use of the Service.

• Your use of this website and any dispute arising out of such use of the website is subject to Bengaluru, India Jurisdiction""",
              style: TextStyle(color: ColorConstant.pink900, fontSize: 12))
        ],
      )),
      actions: [
        // cancelButton,
        okayButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  validateCouponCode() async {
    if (_couponCodeController.text.trim().isNotEmpty) {
      try {
        var req = {
          "coupon": _couponCodeController.text,
        };
        GetValidateCouponCodeResp resp =
            await api.fetchValidateCouponCode(context,queryParams: req);
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
          await api.createRegistration(context,requestData: req);
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
          "userID": userID,
          "isResetPassword": false
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
