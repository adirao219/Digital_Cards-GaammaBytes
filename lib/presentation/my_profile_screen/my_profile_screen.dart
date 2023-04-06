import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/myProfile/get_my_profile_resp.dart';
import '../../data/models/myProfile/post_my_profile_resp.dart';
import '../../widgets/app_bar/appbar_title.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State<MyProfileScreen> {
  ApiClient api = new ApiClient();
  int? mainId;
  ProfileResult result = new ProfileResult(
      countryList: [], languageIdList: [], countryCodeList: []);

  String? selectedContry;
  String? selectedContryCode;
  int? selectedLanguage;

  TextEditingController _email_id4_Controller = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _language_Controller = new TextEditingController();
  TextEditingController _name_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _place_Controller = new TextEditingController();
  TextEditingController _registered_on_Controller = new TextEditingController();

  @override
  void initState() {
    getProfileDetails();
    super.initState();
  }

  getProfileDetails() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
      };
      GetMyProfileResp resp = await api.fetchMyProfile(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          result = resp.result ??
              new ProfileResult(
                  countryList: [], languageIdList: [], countryCodeList: []);
          mainId = resp.result!.id;
          _name_Controller.text = resp.result!.displayName ?? '';
          _email_id4_Controller.text = resp.result!.email ?? '';
          _phone_number_Controller.text = resp.result!.phoneNumber ?? '';
          _place_Controller.text = resp.result!.place ?? '';
          selectedContry = resp.result!.country;
          selectedContryCode = resp.result!.countryCode;

          selectedLanguage = resp.result!.languageId;
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
    } catch (e) {}
  }

  updateProfileDetails() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "Id": mainId,
        "DisplayName": _name_Controller.text,
        "Email": _email_id4_Controller.text,
        "PhoneNumber": _phone_number_Controller.text,
        "Place": _place_Controller.text,
        "Country": selectedContry,
        "CountryCode": selectedContryCode,
        "LanguageId": selectedLanguage
      };
      PostMyProfileResp resp = await api.createMyProfile(requestData: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          Get.snackbar('Success', "Profile updated successfullly!",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));

          Navigator.of(context).pop();
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
    } catch (e) {}
  }

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
                child: Stack(children: [
                  AppbarImage(
                      height: getVerticalSize(94.00),
                      width: getHorizontalSize(375.00),
                      imagePath: ImageConstant.imgVectorDeepOrangeA100),
                  Padding(
                      padding:
                          getPadding(left: 38, top: 44, right: 99, bottom: 7),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                margin: getMargin(bottom: 6),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      AppbarImage(
                                        height: getVerticalSize(36.00),
                                        width: getHorizontalSize(38.00),
                                        svgPath: ImageConstant.imgContrast,
                                      ),
                                      AppbarImage(
                                          height: getVerticalSize(10.00),
                                          width: getHorizontalSize(5.00),
                                          svgPath:
                                              ImageConstant.imgVectorstroke,
                                          margin: getMargin(
                                              left: 15,
                                              top: 13,
                                              right: 18,
                                              bottom: 13))
                                    ])),
                            AppbarTitle(
                                text: "lbl_my_profile".tr.toUpperCase(),
                                margin: getMargin(left: 54, top: 14))
                          ])))
                ])),
            styleType: Style.bgStyle_22),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            padding: getPadding(
              left: 30,
              top: 0,
              right: 30,
              bottom: 27,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_name".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _name_Controller,
                  hintText: "Enter your name here".tr,
                  margin: getMargin(
                    top: 15,
                  ),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("lbl_email_id4".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _email_id4_Controller,
                  hintText: "Enter your email ID here".tr,
                  margin: getMargin(
                    top: 15,
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
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("lbl_phone_number".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _phone_number_Controller,
                  hintText: "Enter your phone number here".tr,
                  margin: getMargin(
                    top: 15,
                  ),
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("lbl_place".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _place_Controller,
                  hintText: "Enter your place here".tr,
                  margin: getMargin(
                    top: 15,
                  ),
                  textInputType: TextInputType.name,
                ),
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("Country:".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  // Initial Value
                  value: selectedContry,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                    'Select Country',
                    style: AppStyle.txtNunitoSansRegular14Gray70001,
                  ),
                  // Array list of items
                  items: result.countryList!.map((items) {
                    return DropdownMenuItem(
                      value: items.value,
                      child: Text(
                        items.text ?? '',
                        style: AppStyle.txtNunitoSansRegular14Gray70001,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedContry = newValue;
                    });
                    //  getTemplate(newValue ?? "");
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("Country Code:".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  // Initial Value
                  value: selectedContryCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                    'Select Country Code',
                    style: AppStyle.txtNunitoSansRegular14Gray70001,
                  ),
                  // Array list of items
                  items: result.countryCodeList!.map((items) {
                    return DropdownMenuItem(
                      value: items.value,
                      child: Text(
                        items.text ?? '',
                        style: AppStyle.txtNunitoSansRegular14Gray70001,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedContryCode = newValue;
                    });
                    //  getTemplate(newValue ?? "");
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("Language:".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                DropdownButton<int>(
                  isExpanded: true,
                  // Initial Value
                  value: selectedLanguage,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                    'Select Language',
                    style: AppStyle.txtNunitoSansRegular14Gray70001,
                  ),
                  // Array list of items
                  items: result.languageIdList!.map((items) {
                    return DropdownMenuItem(
                      value: int.parse(items.value ?? '0'),
                      child: Text(
                        items.text ?? '',
                        style: AppStyle.txtNunitoSansRegular14Gray70001,
                      ),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedLanguage = newValue;
                    });
                    //  getTemplate(newValue ?? "");
                  },
                ),
                // CustomTextFormField(
                //   width: 326,
                //   focusNode: FocusNode(),
                //   controller: _registered_on_Controller,
                //   hintText: "lbl_registered_on".tr,
                //   margin: getMargin(
                //     top: 24,
                //   ),
                //   textInputAction: TextInputAction.done,
                // ),
                CustomButton(
                  height: 40,
                  width: 250,
                  text: "lbl_save".tr,
                  margin: getMargin(
                    top: 20,
                    bottom: 5,
                  ),
                  onTap: updateProfileDetails,
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
