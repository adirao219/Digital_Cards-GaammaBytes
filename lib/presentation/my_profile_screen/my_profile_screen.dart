
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _MyProfileScreen createState() => _MyProfileScreen();
            }

class _MyProfileScreen extends State<MyProfileScreen> {
  TextEditingController _name_Controller = new TextEditingController();
  TextEditingController _email_id4_Controller = new TextEditingController();
  TextEditingController _country_Controller = new TextEditingController();
  TextEditingController _country_code_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _language_Controller = new TextEditingController();
  TextEditingController _registered_on_Controller = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
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
          styleType: Style.bgStyle_6,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            padding: getPadding(
              left: 22,
              top: 27,
              right: 22,
              bottom: 27,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 18,
                  ),
                  child: Text(
                    "lbl_my_profile".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold20,
                  ),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _name_Controller,
                  hintText: "lbl_name".tr,
                  margin: getMargin(
                    top: 49,
                  ),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _email_id4_Controller,
                  hintText: "lbl_email_id4".tr,
                  margin: getMargin(
                    top: 23,
                  ),
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _country_Controller,
                  hintText: "lbl_country".tr,
                  margin: getMargin(
                    top: 24,
                  ),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _country_code_Controller,
                  hintText: "lbl_country_code".tr,
                  margin: getMargin(
                    top: 24,
                  ),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _phone_number_Controller,
                  hintText: "lbl_phone_number".tr,
                  margin: getMargin(
                    top: 23,
                  ),
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _language_Controller,
                  hintText: "lbl_language".tr,
                  margin: getMargin(
                    top: 21,
                  ),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _registered_on_Controller,
                  hintText: "lbl_registered_on".tr,
                  margin: getMargin(
                    top: 24,
                  ),
                  textInputAction: TextInputAction.done,
                ),
                CustomButton(
                  height: 40,
                  width: 250,
                  text: "lbl_save".tr,
                  margin: getMargin(
                    top: 30,
                    bottom: 5,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
