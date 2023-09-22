import 'dart:convert';
import 'dart:io';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/models/deleteGreeting/post_delete_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import '../../data/globals/globalvariables.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
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
  ImagePicker _picker = new ImagePicker();
  ApiClient api = new ApiClient();
  int? mainId;
  ProfileResult result = new ProfileResult(
      countryList: [], languageIdList: [], countryCodeList: []);
  String? regDate;
  String? selectedContry;
  String? selectedContryCode;
  int? selectedLanguage;
  int creditsAvailable = 0;
  String totalSpace = "";
  String utilizedSapce = "";
  String remainingSpace = "";
  TextEditingController _email_id4_Controller = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _language_Controller = new TextEditingController();
  TextEditingController _name_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _place_Controller = new TextEditingController();
  TextEditingController _registered_on_Controller = new TextEditingController();
  bool isFirstImageSelected = false;
  bool isServerStoredLogo = false;
  XFile? imageLogo;
  File mainImageFile = new File('');
  File? logoCroppedImage;
  String? logoImageBase64;
  String? logoImageFileName;
  int? logoExistingId;
  @override
  void initState() {
    getProfileDetails();
    getAvailableCredits();
    getAvailableStorage();
    super.initState();
  }

  getProfileDetails() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "LanguageId":GlobalVariables.currentLanguage
      };
      GetMyProfileResp resp = await api.fetchMyProfile(context,queryParams: req);
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
          regDate = resp.result!.regDate;
          selectedLanguage = resp.result!.languageId;
          logoImageFileName = resp.result!.logoref ?? '';
          logoImageBase64 = resp.result!.logo ?? '';
          if (logoImageBase64!.isNotEmpty && logoImageFileName!.isNotEmpty) {
            isFirstImageSelected = true;
            if (logoImageBase64!.startsWith("http")) {
              isServerStoredLogo = true;
            }
          }
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

  getAvailableCredits() async {
    try {
      var query = {
        "UserId": GlobalVariables.userID,
      };
      APIResponse resp = await api.getCreditsAvailable(context, requestData: query);
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

  getAvailableStorage() async {
    try {
      var query = {
        "UserId": GlobalVariables.userID,
      };
      StorageResponse resp = await api.getStorageAvailable(context, queryParams: query);
      if (resp.isSuccess ?? false) {
        setState(() {
          totalSpace = resp.result!.totalSpace ?? '-';
          utilizedSapce = resp.result!.utilizedSapce ?? '-';
          remainingSpace = resp.result!.remaningSapce ?? '-';
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
    } catch (e) {
      print(e.toString());
    }
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
        "LanguageId": selectedLanguage,
        "Logo": logoImageBase64,
        "LogoRef": logoImageFileName,
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      PostMyProfileResp resp = await api.createMyProfile(context,requestData: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          Get.snackbar("lbl_success".tr, "lbl_profile_saved".tr,
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));

          Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75.0, right: 30),
            child: IconButton(
                icon: Icon(CupertinoIcons.tray_2_fill,
                    color: ColorConstant.pink900),
                onPressed: () {
                  showIncreaseStorageDialog(context);
                })),
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
                                margin: getMargin(left: 54, top: 0))
                          ])))
                ])),
            styleType: Style.bgStyle_22),
        body: SingleChildScrollView(
            child: Form(
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
                  child: Text("lbl_name".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _name_Controller,
                  hintText: "lbl_enter_name".tr.tr,
                  margin: getMargin(
                    top: 10,
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
                    top: 10,
                  ),
                  child: Text("lbl_email_id4".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _email_id4_Controller,
                  hintText: "lbl_enter_email".tr.tr,
                  margin: getMargin(
                    top: 10,
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
                    top: 10,
                  ),
                  child: Text("lbl_phone_number".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _phone_number_Controller,
                  hintText: "lbl_enter_phone".tr,
                  margin: getMargin(
                    top: 10,
                  ),
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),
                // Container(
                //   margin: getMargin(
                //     top:10,
                //   ),
                //   child: Text("lbl_place".tr,
                //       style: AppStyle.txtNunitoSansBold14Pink900),
                // ),
                // CustomTextFormField(
                //   width: 326,
                //   focusNode: FocusNode(),
                //   controller: _place_Controller,
                //   hintText: "Enter your place".tr,
                //   margin: getMargin(
                //     top:10,
                //   ),
                //   textInputType: TextInputType.name,
                // ),
                Container(
                  margin: getMargin(
                    top: 10,
                  ),
                  child: Text("lbl_country".tr,
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
                    top: 10,
                  ),
                  child: Text("lbl_country_code".tr,
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
                // Container(
                //   margin: getMargin(
                //     top: 10,
                //   ),
                //   child: Text("lbl_language".tr,
                //       style: AppStyle.txtNunitoSansBold14Pink900),
                // ),
                // DropdownButton<int>(
                //   isExpanded: true,
                //   // Initial Value
                //   value: selectedLanguage,
                //   icon: const Icon(Icons.keyboard_arrow_down),
                //   hint: Text(
                //     "lbl_select_language".tr,
                //     style: AppStyle.txtNunitoSansRegular14Gray70001,
                //   ),
                //   // Array list of items
                //   items: result.languageIdList!.map((items) {
                //     return DropdownMenuItem(
                //       value: int.parse(items.value ?? '0'),
                //       child: Text(
                //         items.text ?? '',
                //         style: AppStyle.txtNunitoSansRegular14Gray70001,
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (int? newValue) {
                //     setState(() {
                //       selectedLanguage = newValue;
                //     });
                //     //  getTemplate(newValue ?? "");
                //   },
                // ),

                Container(
                  margin: getMargin(
                    top: 10,
                  ),
                  child: Text("lbl_logo".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                Row(
                  children: [
                    isServerStoredLogo
                        ? CustomImageView(
                            url: logoImageBase64,
                            width: 70,
                            height: 70,
                          )
                        : (mainImageFile.path.isEmpty
                            ? CustomImageView(
                                url: "/data",
                                width: 70,
                                height: 70,
                              )
                            : CustomImageView(
                                file: mainImageFile,
                                width: 70,
                                height: 70,
                              )),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapSelectimage();
                      },
                      child: CustomButton(
                        width: 130,
                        text: (isFirstImageSelected
                            ? "lbl_image_selected".tr
                            : "lbl_select_logo".tr),
                        variant: ButtonVariant.OutlineBlack9003f,
                        shape: ButtonShape.RoundedBorder5,
                        padding: ButtonPadding.PaddingT9,
                        fontStyle: ButtonFontStyle.NunitoSansBlack12,
                        alignment: Alignment.topCenter,
                        prefixWidget: Container(
                            margin: getMargin(right: 10),
                            child: Icon(
                              (isFirstImageSelected ? Icons.done : Icons.photo),
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      height: 40,
                      width: 40,
                      // text: "Select Logo Position",
                      prefixWidget: Icon(
                        Icons.delete,
                        color: ColorConstant.pink900,
                        size: 20,
                      ),
                      // margin: getMargin(top: 22),
                      variant: ButtonVariant.OutlineBlack9003f_1,
                      shape: ButtonShape.RoundedBorder15,
                      fontStyle: ButtonFontStyle.NunitoSansBold14,
                      onTap: () {
                        showAlertDialog(context);
                      },
                    ),
                  ],
                ),

                Row(children: [
                  Container(
                    margin: getMargin(
                      top: 10,
                    ),
                    child: Text("lbl_registered_on".tr,
                        style: AppStyle.txtNunitoSansBold14Pink900),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      margin: getMargin(top: 10),
                      child: Text(regDate ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.pink900,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w500,
                          )))
                ]),
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
        )),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_cancel".tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("lbl_continue".tr),
      onPressed: () {
        Navigator.pop(context);
        removeSelectedImage();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("lbl_confirmation".tr),
      content: Text("Are you sure you want to delete the image?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  removeSelectedImage() {
    setState(() {
      logoExistingId = null;
      imageLogo = null;
      mainImageFile = File('');
      isFirstImageSelected = false;
      if (isServerStoredLogo) {
        removeImage();
      } else {
        logoImageBase64 = "";
        logoImageFileName = "";
      }
    });
  }

  removeImage() async {
    try {
      var req = {
        "RefID": (mainId).toString(),
        "RefTypeID": (7).toString(),
        "SlNo": (7).toString(),
        "FileRef": logoImageBase64
      };
      APIBooleanResponse resp = await api.removeImage(context,queryParams: req);
      if (resp.isSuccess ?? false) {
        Get.snackbar("lbl_success".tr, "Logo removed successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        setState(() {
          logoImageBase64 = "";
          logoImageFileName = "";
          isServerStoredLogo = false;
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

  onTapSelectimage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setPopupState) {
            return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "lbl_select_image".tr,
                      style: AppStyle.txtNunitoBold18,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                content: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        "lbl_choose_image".tr,
                        style: AppStyle.txtNunitoSansRegular14,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ])),
                actions: <Widget>[
                  CustomButton(
                    height: 40,
                    width: 110,
                    text: ("lbl_camera".tr),
                    prefixWidget: Icon(
                      Icons.camera_alt_rounded,
                      color: ColorConstant.pink900,
                    ),
                    // margin: getMargin(top: 22),
                    variant: ButtonVariant.OutlineBlack9003f_1,
                    shape: ButtonShape.RoundedBorder15,
                    fontStyle: ButtonFontStyle.NunitoSansBold14,
                    onTap: () {
                      clickOrSelectImage("Camera");
                    },
                  ),
                  CustomButton(
                    height: 40,
                    width: 110,
                    text: ("lbl_gallery".tr),
                    prefixWidget: Icon(
                      Icons.image_search_rounded,
                      color: ColorConstant.pink900,
                    ),
                    // margin: getMargin(top: 22),
                    variant: ButtonVariant.OutlineBlack9003f_1,
                    shape: ButtonShape.RoundedBorder15,
                    fontStyle: ButtonFontStyle.NunitoSansBold14,
                    onTap: () {
                      clickOrSelectImage("Gallery");
                    },
                  ),
                ]);
          });
        });
  }

  clickOrSelectImage(String type) async {
    Navigator.of(context).pop();
    if (isServerStoredLogo) {
      removeImage();
    }
    if (type == "Gallery") {
      imageLogo = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      imageLogo = await _picker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (imageLogo != null) isFirstImageSelected = true;
    });
    File imageFile = new File('');

    if (imageLogo!.path.isNotEmpty) imageFile = File(imageLogo!.path);

    gotoImageModify(imageFile);
  }

  gotoImageModify(File imageFile) {
    Get.toNamed(AppRoutes.imageModifyScreen, arguments: {
      "imageFile": imageFile,
      "pictureType": UserImageType.logo
    })?.then((value) {
      double? width = value['width'];
      double? height = value['height'];
      bool? isSquare = value['isSquare'];
      String? imageFilePath = value["refinedImagePath"] as String?;

      try {
        setState(() {
          mainImageFile = imageFile = File(imageFilePath ?? '');
          var base64val1 = "data:image/png;base64," +
              base64Encode(imageFile.readAsBytesSync());
          // print('base64:'+base64val1);

          logoImageBase64 = base64val1;
          logoCroppedImage = imageFile;
          isFirstImageSelected = true;
          logoImageFileName = path.basename(imageFile.path);
          logoExistingId = null;
        });
      } catch (e) {
        var s = 1;
      }
    });
  }

  showIncreaseStorageDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_cancel".tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
        height: 40,
        width: 200,
        text: ('   '+("lbl_increase_space").tr),
        prefixWidget: Icon(
          CupertinoIcons.tray_arrow_up,
          color: ColorConstant.pink900,
        ),
        // margin: getMargin(top: 22),
        variant: ButtonVariant.OutlineBlack9003f_1,
        shape: ButtonShape.RoundedBorder15,
        fontStyle: ButtonFontStyle.NunitoSansBold14,
        onTap: () {
          Navigator.pop(context);

          Navigator.of(context)
              .pushNamed(AppRoutes.addstoragecredits)
              .then((value) {
            getAvailableCredits();
            getAvailableStorage();
          });
          // clickOrSelectImage("Gallery", pictureType);
        },
      )
    ]);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_storage".tr,
            style: AppStyle.txtNunitoBold18,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
        ],
      ),
      content: Container(
          height: 120,
          child: Column(
            children: [
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("lbl_total_space".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text(totalSpace,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.pink900,
                                  fontSize: getFontSize(
                                    15,
                                  ),
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w700,
                                ))),
                      ])),
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("lbl_utilized".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text(utilizedSapce,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.pink900,
                                  fontSize: getFontSize(
                                    15,
                                  ),
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w700,
                                ))),
                      ])),
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("lbl_available".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text(remainingSpace,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.pink900,
                                  fontSize: getFontSize(
                                    15,
                                  ),
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w700,
                                ))),
                      ])),
            ],
          )),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
