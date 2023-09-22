import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/myProfile/get_my_profile_resp.dart';
import '../../data/models/myProfile/post_my_profile_resp.dart';
import '../../widgets/app_bar/appbar_title.dart';

class AddStorageCredits extends StatefulWidget {
  const AddStorageCredits({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddStorageCredits createState() => _AddStorageCredits();
}

class _AddStorageCredits extends State<AddStorageCredits> {
  ApiClient api = new ApiClient();
  int? mainId;
  ProfileResult result = new ProfileResult(
      countryList: [], languageIdList: [], countryCodeList: []);

  String? selectedContry;
  String? selectedContryCode;
  int? selectedLanguage;
  int creditsAvailable = 0;
  String creditStorage = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _noofcredits_Controller = new TextEditingController();
  TextEditingController _totalspace_Controller = new TextEditingController();

  @override
  void initState() {
    getAvailableCredits(context);
    super.initState();
  }

  validateAndCalculateSpace(BuildContext appcontext, String credits) async {
    if (int.tryParse(credits) != null && int.parse(credits) > 0) {
      if (int.parse(credits) > creditsAvailable) {
        return Get.snackbar(
            'Invalid', "Please enter credits less than available credits!",
            backgroundColor: Color.fromARGB(255, 238, 218, 204),
            colorText: Color.fromARGB(255, 94, 54, 27),
            icon: Icon(
              Icons.warning,
              color: Color.fromARGB(255, 94, 54, 27),
            ));
      } else {
        try {
          var query = {
            "NoCredits": credits,
          };
          APIResponse resp =
              await api.getCreditStorage(appcontext, queryParams: query);
          if (resp.isSuccess ?? false) {
            setState(() {
              _totalspace_Controller.text = resp.result.toString();
            });
          } else {
            Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
                backgroundColor: Color.fromARGB(255, 255, 230, 230),
                colorText: Colors.red[900],
                icon: Icon(
                  Icons.error,
                  color: Colors.red[900],
                ));
          }
        } catch (e) {}
      }
    }
  }

  getAvailableCredits(BuildContext appcontext,
      {bool showProgress = true}) async {
    try {
      var query = {
        "UserId": GlobalVariables.userID,
      };
      APIResponse resp = await api.getCreditsAvailable(appcontext,
          queryParams: query, showProgress: showProgress);
      if (resp.isSuccess ?? false) {
        setState(() {
          creditsAvailable = resp.result;
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {}
  }

  addStorageDetails(BuildContext appcontext) async {
    try {
      if (int.parse(_noofcredits_Controller.text) <= 0) {
        Get.snackbar("lbl_warning".tr, "Please enter valid credits!",
            backgroundColor: Color.fromARGB(255, 255, 224, 156),
            colorText: Color.fromARGB(255, 105, 73, 3),
            icon: Icon(
              Icons.warning,
              color: Color.fromARGB(255, 105, 73, 3),
            ));

        return;
      }

      var req = {
        "UserIdString": GlobalVariables.userID,
        "NoCredits": _noofcredits_Controller.text,
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      APIResponse resp = await api.addStorage(appcontext, requestData: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          Get.snackbar("lbl_success".tr, "Storage added successfully!",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));
        });
        getAvailableCredits(appcontext, showProgress: false);
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
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
                                text: ("lbl_increase_space".tr),
                                margin: getMargin(left: 25, top: 0))
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: getPadding(left: 24),
                      child: Text("lbl_add_credits".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold20))
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ("lbl_available_credits".tr),
                      style: AppStyle.txtNunitoSansBold14,
                    ),
                    Container(
                      padding: getPadding(left: 5, right: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: ColorConstant.pink900,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Text(
                        (creditsAvailable.toString()),
                        style: AppStyle.txtNunitoSansBold14,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_total_credits".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  textInputType: TextInputType.number,
                  controller: _noofcredits_Controller,
                  hintText: "lbl_credit_utilize_hint".tr,
                  margin: getMargin(
                    top: 15,
                  ),
                  onChanged: (value) {
                    validateAndCalculateSpace(context, value);
                  },
                  validator: (value) {
                    if (!isText(value, isRequired: true)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Text("lbl_total_space_in_mb".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  isEnabled: false,
                  controller: _totalspace_Controller,
                  hintText: "lbl_total_space_calculation_hint".tr,
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
                CustomButton(
                  height: 40,
                  width: 250,
                  text: "Add".tr,
                  margin: getMargin(
                    top: 20,
                    bottom: 5,
                  ),
                  onTap: () {
                    addStorageDetails(context);
                  },
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
