import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/createCard/post_create_card_resp.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/driveImages/drive_file_images_resp.dart';
import '../../data/models/getCardSubType/get_get_card_sub_type_resp.dart';
import '../../helper/constants.dart';
import '../my_digital_cards_screen/widgets/card_subtype_widget.dart';
import '../my_e_greeting_cards_screen/widgets/uploaded_images_widget.dart';

// ignore_for_file: must_be_immutable
class BasicCardEntryOneScreen extends StatefulWidget {
  const BasicCardEntryOneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BasicCardEntryOneScreen createState() => _BasicCardEntryOneScreen();
}

class _BasicCardEntryOneScreen extends State<BasicCardEntryOneScreen> {
  TextEditingController _card_name_Controller = new TextEditingController();
  TextEditingController _slice_num_Controller = new TextEditingController();
  TextEditingController _margin_top_Controller = new TextEditingController();
  TextEditingController _margin_bottom_Controller = new TextEditingController();
  TextEditingController _margin_left_Controller = new TextEditingController();
  TextEditingController _margin_right_Controller = new TextEditingController();
  String cardnameForURL = "";
  TextEditingController _hex_Controller = new TextEditingController();
  TextEditingController _searchController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPublishAvailable = false;
  String logoPositionName = "lbl_position".tr;
  bool? isUserDefinedBackground;
  bool mirrorHeaderImage = false;
  String templateID = "";
  String templateName = "";
  String editorColorHex = "#ffffff";
  String? languageID = "";
  int? logoPosition=0;
  bool isBackgroundColor = false;
  ApiClient api = new ApiClient();
  List<Result> backgroundTypeList = [];
  String? selectedBackgroundType;
  var cardType = Get.arguments["Type"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardTypeName = Get.arguments["TypeName"] as String?;
  String cardSubTypeName = Get.arguments["SubTypeName"] as String;
  bool isPublished = (Get.arguments["isPublished"] as bool?) ?? false;
  String publishedURL = (Get.arguments["publishedURL"] as String?) ?? "";
  List<CardSubTypeResult> cardSubTypes = [];
  List<CardSubTypeResult> allcardSubTypes = [];
  String htmlContent = "";
  List<DriveFilesData> allUserImages = [];
  List<DriveFilesData> userImages = [];
  int? cardSubTypeID=0;
  bool isMultipleCardSubtype = false;
  String messageDefault = "";
  Color? currentColor;
  Color pickerColor = Color(0xff443a49);
  ImagePicker _picker = new ImagePicker();
  int? currentindex;
  bool isFirstImageSelected = false;
  bool isSecondImageSelected = false;
  bool isHeaderImageSelected = false;
  bool isFooterImageSelected = false;
  XFile? imageFirst;
  Random random = new Random();
  XFile? imageSecond;
  XFile? imageHeader;
  XFile? imageFooter;
  File? firstCroppedImage;
  File? secondCroppedImage;
  String? firstImageBase64;
  String? secondImageBase64;
  String? firstImageFileName;
  String? secondImageFileName;
  int? logoExistingId;
  int? pictureExistingId;
  File? headerCroppedImage;
  File? footerCroppedImage;
  String? headerImageBase64;
  String? footerImageBase64;
  String? headerImageFileName;
  String? footerImageFileName;
  int? headerExistingId;
  int? footerExistingId;
  GetCardResult? mainResult;
  bool isServerStoredLogo = false;
  bool isServerStoredBackground = false;
  bool isServerStoredHeader = false;
  bool isServerStoredFooter = false;
  var logoCaptionName = "";
  var logoPositionCaptionName = "";
  String? hexColor;
  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  @override
  void initState() {
    if (selectedCardID != 0) {
      isPublishAvailable = true;
    }
    getUserImages();
    getBackgroundTypes(context);
    super.initState();
  }

  getCardData(BuildContext appcontext, {bool showProgress = true}) async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "CardType": "0",
        "CardSubType": "0",
        "LanguageId": GlobalVariables.currentLanguage
      };
      GetGetCreateCardResp resp = await api.fetchGetCreateCard(appcontext,
          queryParams: req, showProgress: showProgress);
      if (resp.isSuccess ?? false) {
        setState(() {
          mainResult = resp.result;
          templateID = mainResult?.themeID == null
              ? ""
              : mainResult?.themeID.toString() ?? '';
              cardTypeName = mainResult?.cardTypeName??'';
              cardSubTypeName = mainResult?.cardSubTypeName??'';
          cardSubTypeID = mainResult?.cardSubType;
          templateName = mainResult!.themeName ?? '';
          _card_name_Controller.text = cardnameForURL = mainResult!.name ?? '';
          selectedBackgroundType = templateID == "-1"
              ? ((mainResult!.backgroundType == 0)
                  ? null
                  : mainResult!.backgroundType.toString())
              : null;
          if (selectedBackgroundType == "4") {
            isBackgroundColor = true;
          }
          firstImageFileName = mainResult!.picture2Ref ?? '';
          secondImageFileName = mainResult!.picture1Ref ?? '';
          if ((firstImageFileName ?? '').trim().isNotEmpty) {
            isFirstImageSelected = true;
            if ((mainResult!.picture2 ?? '').toString().contains("http")) {
              firstImageBase64 = (mainResult!.picture2 ?? '').toString();
              isServerStoredLogo = true;
            }
          }
          secondImageFileName = (mainResult!.picture1Ref ?? '').toString();
          if ((secondImageFileName ?? '').trim().isNotEmpty) {
            isSecondImageSelected = true;
            if ((mainResult!.picture1 ?? '').toString().contains("http")) {
              secondImageBase64 = (mainResult!.picture1 ?? '').toString();
              isServerStoredBackground = true;
            }
          }
          headerImageFileName =
              (mainResult!.backgroundHeaderRef ?? '').toString();
          if ((headerImageFileName ?? '').trim().isNotEmpty) {
            isHeaderImageSelected = true;
            if ((mainResult!.backgroundHeader ?? '')
                .toString()
                .contains("http")) {
              headerImageBase64 =
                  (mainResult!.backgroundHeader ?? '').toString();
              isServerStoredHeader = true;
            }
          }
          footerImageFileName =
              (mainResult!.backgroundFooterRef ?? '').toString();
          if ((footerImageFileName ?? '').trim().isNotEmpty) {
            isFooterImageSelected = true;
            if ((mainResult!.backgroundFooter ?? '')
                .toString()
                .contains("http")) {
              footerImageBase64 =
                  (mainResult!.backgroundFooter ?? '').toString();
              isServerStoredFooter = true;
            }
          }
          isUserDefinedBackground = (mainResult!.userPicture);
          // isBackgroundColor = !(mainResult!.isBackgroundImage ?? false);
          if ((isUserDefinedBackground ?? false) && isBackgroundColor) {
            currentindex = 1;
            hexColor = (mainResult?.backgroundColorHex);
            pickerColor = currentColor = fromHex(hexColor ?? '');
          }
          editorColorHex = (mainResult?.editorColorHex ?? '').toString();
          _slice_num_Controller.text = (mainResult?.sliceNum ?? 0).toString();
          _margin_top_Controller.text = (mainResult?.marginTop ?? 0).toString();
          _margin_bottom_Controller.text =
              (mainResult?.marginBottom ?? 0).toString();
          _margin_left_Controller.text =
              (mainResult?.marginLeft ?? 0).toString();
          _margin_right_Controller.text =
              (mainResult?.marginRight ?? 0).toString();
          logoExistingId = mainResult?.picture2OldId;
          pictureExistingId = mainResult?.picture1OldId;
          headerExistingId = mainResult?.backgroundHeaderOldId;
          footerExistingId = mainResult?.backgroundFooterOldId;
          var templogoPosition = (mainResult?.logoPosition ?? 0);
          setLogoPosition(templogoPosition, isClosePopup: false);
          messageDefault = htmlContent = mainResult?.hTMLContent ?? '';
          logoCaptionName = mainResult?.logoCaptionName ?? '';
          logoPositionCaptionName = mainResult?.logoPositionCaptionName ?? '';
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

  saveCardMain(BuildContext appcontext) async {
    if (_card_name_Controller.text.isEmpty) {
      Get.snackbar("lbl_warning".tr, "lbl_enter_card_name".tr,
          backgroundColor: Color.fromARGB(255, 255, 224, 156),
          colorText: Color.fromARGB(255, 105, 73, 3),
          icon: Icon(
            Icons.warning,
            color: Color.fromARGB(255, 105, 73, 3),
          ));

      return;
    }
    var messageUpdated = htmlContent.replaceAll('"', '\"');
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "ThemeID": templateID,
        "CardType": cardType.toString(),
        "CardSubType": cardSubTypeID.toString(),
        "Name": _card_name_Controller.text,
        "BackgroundColorHex": hexColor ?? "",
        "LogoPosition": logoPosition.toString(),
        "Picture1": secondImageBase64 ?? '',
        "Picture1Ref": secondImageFileName ?? '',
        "BackgroundType": selectedBackgroundType ?? '0',
        "SliceNum": _slice_num_Controller.text, //tocheck
        "Picture1OldId": pictureExistingId ?? '',
        "Picture2": firstImageBase64 ?? '',
        "Picture2Ref": firstImageFileName ?? '',
        "Picture2OldId": logoExistingId ?? '',
        "BackgroundHeader": headerImageBase64 ?? '',
        "BackgroundHeaderRef": headerImageFileName ?? '',
        "BackgroundHeaderOldId": headerExistingId ?? '',
        "BackgroundFooter": footerImageBase64 ?? '',
        "BackgroundFooterRef": footerImageFileName ?? '',
        "BackgroundFooterOldId": footerExistingId ?? '',
        "MirrorHeaderImage": mirrorHeaderImage.toString(),
        "MarginTop": _margin_top_Controller.text.isEmpty
            ? "0.0"
            : _margin_top_Controller.text,
        "MarginBottom": _margin_bottom_Controller.text.isEmpty
            ? "0.0"
            : _margin_bottom_Controller.text,
        "MarginLeft": _margin_left_Controller.text.isEmpty
            ? "0.0"
            : _margin_left_Controller.text,
        "MarginRight": _margin_right_Controller.text.isEmpty
            ? "0.0"
            : _margin_right_Controller.text,
        "HTMLContent": messageUpdated,
        "CaptionLanguageId": GlobalVariables.currentLanguage
        // "IsBackgroundImage": !(isBackgroundColor ?? false)
      };
      PostSaveResp resp = await api.saveCardMain(appcontext, requestData: req);
      if (resp.isSuccess ?? false) {
        selectedCardID = resp.result;
        Get.snackbar("lbl_success".tr, "lbl_card_saved".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        isPublishAvailable = true;
        Navigator.of(context)
            .pushNamed(AppRoutes.cardEntryoneScreen, arguments: {
          "cardType": cardType,
          "cardSubtypeID": cardSubTypeID,
          "templateId": templateID,
          "cardTypeName": cardTypeName,
          "templateName": templateName,
          "cardSubTypeName": cardSubTypeName,
          "SelectedCardID": selectedCardID,
          "isPublishAvailable": isPublishAvailable,
          "cardName": _card_name_Controller.text,
          "cardDetails": mainResult,
          "isPublished": isPublished,
          "publishedURL": publishedURL
        }).then((value) {
          getCardData(appcontext, showProgress: false);
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

  getDigitalCardSubTypesTypes(BuildContext appcontext) async {
    try {
      var req = {
        "CardType": cardType.toString(),
        "LanguageId": GlobalVariables.currentLanguage
      };
      GetCardSubTypeResp resp =
          await api.fetchGetCardSubType(appcontext, queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          allcardSubTypes.addAll(resp.result!.toList());
          cardSubTypes = allcardSubTypes;
          if (cardSubTypes.length == 1) {
            cardSubTypeID = cardSubTypes.first.id;
          }
          if (allcardSubTypes.length > 1) {
            isMultipleCardSubtype = true;
          }
          if (selectedCardID != 0) {
            getCardData(appcontext);
          } else {
            _slice_num_Controller.text = "50";
          }
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  getBackgroundTypes(BuildContext appcontext) async {
    try {
      var req = {"LanguageId": GlobalVariables.currentLanguage};
      CommonDropdownResp resp =
          await api.getBackgroundType(appcontext, queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          backgroundTypeList = resp.result ?? [];
          getDigitalCardSubTypesTypes(appcontext);
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  showPublishAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_no".tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("lbl_yes".tr),
      onPressed: () {
        Navigator.pop(context);
        publishCard();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("lbl_confirmation".tr),
      content: Text("lbl_publish_confirmation".tr),
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

  publishCard() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
      };
      APIResponse resp = await api.fetchPublish(context, queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          isPublished = true;
          publishedURL = resp.result.toString();
        });
        Get.snackbar("lbl_success".tr, "lbl_card_publish".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: MoreOptionMenu()),
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
                          padding: getPadding(
                              left: 38, top: 44, right: 99, bottom: 7),
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
                                              svgPath:
                                                  ImageConstant.imgContrast,
                                              onTap: onTapContrast1),
                                          AppbarImage(
                                              height: getVerticalSize(10.00),
                                              width: getHorizontalSize(5.00),
                                              svgPath:
                                                  ImageConstant.imgVectorstroke,
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              margin: getMargin(
                                                  left: 15,
                                                  top: 13,
                                                  right: 18,
                                                  bottom: 13))
                                        ])),
                                AppbarTitle(
                                    text: "lbl_card_details".tr,
                                    margin: getMargin(left: 54, top: 10))
                              ])))
                    ])),
                actions: [
                  // MoreOptionMenu()
                  // AppbarImage(
                  //     height: getVerticalSize(35.00),
                  //     width: getHorizontalSize(43.00),
                  //     svgPath: ImageConstant.imgOverflowmenu,
                  //     margin: getMargin(left: 3, top: 47, right: 3, bottom: 26),
                  //     onTap: onTapOverflowmenu)
                ],
                styleType: Style.bgStyle_14),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 28, right: 27),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 0),
                                      child: Text(
                                          ("msg_card_type_ex_buisness".tr) +
                                              (cardTypeName ?? ''),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNunitoBold18))),
                              CustomTextFormField(
                                width: 326,
                                // focusNode: FocusNode(),
                                controller: _card_name_Controller,
                                hintText: "lbl_card_name".tr,
                                margin: getMargin(top: 30),
                                validator: (value) {
                                  if (!isText(value)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    cardnameForURL = value;
                                  });
                                },
                              ),
                              //  Row(children: [
                              Visibility(
                                  child: CustomButton(
                                      height: 40,
                                      width: 250,
                                      text: cardSubTypeName.isEmpty
                                          ? ("lbl_select".tr +" "+
                                              (cardTypeName ?? '') +
                                              " "+"lbl_type".tr)
                                          : ("" +
                                              (cardTypeName ?? "") +
                                              " "+"lbl_type".tr+" : " +
                                              cardSubTypeName),
                                      margin: getMargin(top: 10),
                                      variant:
                                          ButtonVariant.OutlineBlack9003f_1,
                                      shape: ButtonShape.RoundedBorder15,
                                      fontStyle:
                                          ButtonFontStyle.NunitoSansBold14,
                                      onTap: onTapSelectCardSubType),
                                  visible: isMultipleCardSubtype),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: templateName.isEmpty
                                      ? "lbl_select_template".tr
                                      : "lbl_template".tr + templateName,
                                  margin: getMargin(top: 10),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapSelecttemplateOne), //]),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin:
                                      getMargin(left: 2, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Visibility(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: getMargin(
                                              top: 15,
                                            ),
                                            child: Text("lbl_backgroundType".tr,
                                                style: AppStyle
                                                    .txtNotoSerifTeluguRegular12)),
                                        DropdownButton<String>(
                                          isExpanded: true,
                                          // Initial Value
                                          value: selectedBackgroundType,
                                          icon: selectedBackgroundType == null
                                              ? Icon(Icons.keyboard_arrow_down)
                                              : GestureDetector(
                                                  child: Icon(Icons.remove),
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectedBackgroundType !=
                                                          null)
                                                        selectedBackgroundType =
                                                            null;

                                                      switchImageColor();
                                                    });
                                                  },
                                                ),
                                          hint: Text(
                                            ('lbl_backgroundType'.tr),
                                            style: AppStyle
                                                .txtNunitoSansRegular14Gray70001,
                                          ),
                                          // Array list of items
                                          items:
                                              backgroundTypeList.map((items) {
                                            return DropdownMenuItem(
                                              value: items.value,
                                              child: Text(
                                                items.text ?? '',
                                                style: AppStyle
                                                    .txtNunitoSansRegular14Gray70001,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedBackgroundType = newValue;
                                              if (selectedBackgroundType ==
                                                  "4") {
                                                isBackgroundColor = true;
                                              } else {
                                                isBackgroundColor = false;
                                              }
                                            });
                                            //  getTemplate(newValue ?? "");
                                          },
                                        )
                                      ]),
                                  visible: (isUserDefinedBackground ?? false)),
                              // Visibility(
                              //   child: Padding(
                              //     padding: getPadding(left: 0),
                              //     child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           Padding(
                              //               padding: getPadding(bottom: 0),
                              //               child: Text("lbl_background".tr,
                              //                   overflow: TextOverflow.ellipsis,
                              //                   textAlign: TextAlign.left,
                              //                   style: AppStyle
                              //                       .txtNunitoSansRegular14
                              //                       .copyWith(
                              //                           letterSpacing:
                              //                               getHorizontalSize(
                              //                                   0.36),
                              //                           height: getVerticalSize(
                              //                               1.26)))),
                              //           SizedBox(
                              //             width: 50,
                              //           ),
                              //           ToggleSwitch(
                              //             minWidth: 110.0,
                              //             initialLabelIndex: currentindex ?? 0,
                              //             cornerRadius: 10.0,
                              //             activeFgColor: Colors.white,
                              //             inactiveBgColor: Color.fromARGB(
                              //                 255, 255, 245, 232),
                              //             inactiveFgColor:
                              //                 ColorConstant.pink900,
                              //             totalSwitches: 2,
                              //             labels: [
                              //               (!(isUserDefinedBackground ?? false)
                              //                   ? 'Image'
                              //                   : 'Image'),
                              //               'Color'
                              //             ],
                              //             icons: [
                              //               Icons.image,
                              //               Icons.color_lens_rounded
                              //             ],
                              //             activeBgColors: [
                              //               [ColorConstant.pink900],
                              //               [ColorConstant.pink900]
                              //             ],
                              //             // customTextStyles: [TextStyle(fontSize: )],
                              //             onToggle: (index) {
                              //               currentindex = index;

                              //             },
                              //           ),
                              //         ]),
                              //   ),
                              //   visible: (true),
                              // ),
                              //switchImageColor();
                              SizedBox(
                                height: 10,
                              ),

                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Visibility(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text(
                                                  "lbl_background_header".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.36),
                                                          height:
                                                              getVerticalSize(
                                                                  1.26)))),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          GestureDetector(
                                            onLongPress: () {
                                              if (isServerStoredHeader) {
                                                var url = headerImageBase64;

                                                launchURL(url ?? '');
                                              }
                                            },
                                            child: CustomButton(
                                              onTap: () {
                                                onTapSelectimage(
                                                    UserImageType.header);
                                              },
                                              width: 120,
                                              text: (isHeaderImageSelected
                                                  ? "lbl_image_selected".tr
                                                  : "lbl_select_image".tr),
                                              variant: ButtonVariant
                                                  .OutlineBlack9003f,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding: ButtonPadding.PaddingT9,
                                              fontStyle: ButtonFontStyle
                                                  .NunitoSansBlack12,
                                              alignment: Alignment.topCenter,
                                              prefixWidget: Container(
                                                  margin: getMargin(right: 10),
                                                  child: Icon(
                                                    (isHeaderImageSelected
                                                        ? Icons.done
                                                        : Icons.photo),
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
                                            variant: ButtonVariant
                                                .OutlineBlack9003f_1,
                                            shape: ButtonShape.RoundedBorder15,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBold14,
                                            onTap: () {
                                              showAlertDialog(context,
                                                  UserImageType.header);
                                            },
                                          ),
                                        ]),
                                    visible: selectedBackgroundType == "3" ||
                                        selectedBackgroundType == "4",
                                  )),

                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Visibility(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text(
                                                  "lbl_background_image".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.36),
                                                          height:
                                                              getVerticalSize(
                                                                  1.26)))),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onLongPress: () {
                                              if (isServerStoredBackground) {
                                                var url = secondImageBase64;

                                                launchURL(url ?? '');
                                              }
                                            },
                                            child: CustomButton(
                                              onTap: () {
                                                onTapSelectimage(
                                                    UserImageType.background);
                                              },
                                              width: 120,
                                              text: (isSecondImageSelected
                                                  ? "lbl_image_selected".tr
                                                  : "lbl_select_image".tr),
                                              variant: ButtonVariant
                                                  .OutlineBlack9003f,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding: ButtonPadding.PaddingT9,
                                              fontStyle: ButtonFontStyle
                                                  .NunitoSansBlack12,
                                              alignment: Alignment.topCenter,
                                              prefixWidget: Container(
                                                  margin: getMargin(right: 10),
                                                  child: Icon(
                                                    (isSecondImageSelected
                                                        ? Icons.done
                                                        : Icons.photo),
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
                                            variant: ButtonVariant
                                                .OutlineBlack9003f_1,
                                            shape: ButtonShape.RoundedBorder15,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBold14,
                                            onTap: () {
                                              showAlertDialog(context,
                                                  UserImageType.background);
                                            },
                                          ),
                                        ]),
                                    visible:
                                        (isUserDefinedBackground ?? false) &&
                                            (selectedBackgroundType != null) &&
                                            !isBackgroundColor,
                                  )),

                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Visibility(
                                    child: Container(
                                        // height: getVerticalSize(52.00),
                                        width: getHorizontalSize(326.00),
                                        margin: getMargin(left: 0, top: 0),
                                        child: Row(children: [
                                          Text("lbl_background_color".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtNunitoSansRegular14
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.36),
                                                      height: getVerticalSize(
                                                          1.26))),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                              margin: getMargin(all: 0),
                                              padding:
                                                  getPadding(left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(
                                                          5.0) //                 <--- border radius here
                                                      ),
                                                  border: Border.all(
                                                      color: ColorConstant
                                                          .pink900)),
                                              child: CustomButton(
                                                  customColor: currentColor,
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (ctx) =>
                                                            AlertDialog(
                                                                title: Text(
                                                                    "lbl_pick_color".tr),
                                                                content:
                                                                    SingleChildScrollView(
                                                                  child:
                                                                      ColorPicker(
                                                                    hexInputBar:
                                                                        true,
                                                                    hexInputController:
                                                                        _hex_Controller,
                                                                    pickerColor:
                                                                        pickerColor,
                                                                    onColorChanged:
                                                                        changeColor,
                                                                  ),
                                                                ),
                                                                actions: <
                                                                    Widget>[
                                                                  ElevatedButton(
                                                                    child:  Text(
                                                                        "lbl_cancel".tr),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                  ElevatedButton(
                                                                    child: Text(
                                                              "lbl_select".tr),
                                                                    onPressed:
                                                                        () {
                                                                      setState(() =>
                                                                          currentColor =
                                                                              pickerColor);
                                                                      getHexColor();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ]));
                                                  },
                                                  height: 20,
                                                  width: 80,
                                                  text: "",
                                                  suffixWidget: Icon(
                                                    Icons.color_lens_rounded,
                                                    color: (hexColor ==
                                                            "#FFFFFF")
                                                        ? ColorConstant.pink900
                                                        : Colors.white,
                                                  ),
                                                  margin: getMargin(top: 0),
                                                  // prefixWidget: Icon(Icons.color_lens_rounded,color: Colors.white,),
                                                  variant: ButtonVariant
                                                      .OutlineBlack9003f,
                                                  shape: ButtonShape
                                                      .RoundedBorder5,
                                                  padding: ButtonPadding
                                                      .PaddingBottom9,
                                                  fontStyle: ButtonFontStyle
                                                      .InterSemiBold14,
                                                  alignment:
                                                      Alignment.topRight))
                                        ])),
                                    visible: isBackgroundColor,
                                  )),
                              Visibility(
                                child: Padding(
                                    padding: getPadding(top: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text("lbl_mirror_image".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.36),
                                                          height:
                                                              getVerticalSize(
                                                                  1.26)))),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          FlutterSwitch(
                                            value: mirrorHeaderImage,

                                            activeText: ("lbl_yes".tr),
                                            inactiveText: ("lbl_no".tr),
                                            showOnOff: true,
                                            valueFontSize: 12,
                                            activeColor: ColorConstant.pink900,
                                            activeTextColor: Colors.white,
                                            activeIcon: Icon(Icons.done),
                                            activeTextFontWeight:
                                                FontWeight.normal,
                                            // inactiveColor: ColorConstant.pink900,
                                            inactiveTextColor: Colors.white,
                                            inactiveIcon: Icon(Icons.remove),
                                            inactiveTextFontWeight:
                                                FontWeight.normal,

                                            onToggle: (val) {
                                              setState(() {
                                                mirrorHeaderImage = val;
                                              });
                                            },
                                          ),
                                        ])),
                                visible: selectedBackgroundType == "3" ||
                                    selectedBackgroundType == "4",
                              ),
                              Visibility(
                                child: Padding(
                                    padding: getPadding(top: 5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text(
                                                  "lbl_background_footer".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.36),
                                                          height:
                                                              getVerticalSize(
                                                                  1.26)))),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          GestureDetector(
                                            onLongPress: () {
                                              if (isServerStoredFooter) {
                                                var url = footerImageBase64;

                                                launchURL(url ?? '');
                                              }
                                            },
                                            child: CustomButton(
                                              onTap: () {
                                                onTapSelectimage(
                                                    UserImageType.footer);
                                              },
                                              width: 120,
                                              text: (isFooterImageSelected
                                                  ? "lbl_image_selected".tr
                                                  : "lbl_select_image".tr),
                                              variant: ButtonVariant
                                                  .OutlineBlack9003f,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding: ButtonPadding.PaddingT9,
                                              fontStyle: ButtonFontStyle
                                                  .NunitoSansBlack12,
                                              alignment: Alignment.topCenter,
                                              prefixWidget: Container(
                                                  margin: getMargin(right: 10),
                                                  child: Icon(
                                                    (isFooterImageSelected
                                                        ? Icons.done
                                                        : Icons.photo),
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
                                            variant: ButtonVariant
                                                .OutlineBlack9003f_1,
                                            shape: ButtonShape.RoundedBorder15,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBold14,
                                            onTap: () {
                                              showAlertDialog(context,
                                                  UserImageType.footer);
                                            },
                                          ),
                                        ])),
                                visible: (selectedBackgroundType == "3" ||
                                        selectedBackgroundType == "4") &&
                                    !mirrorHeaderImage,
                              ),

                              Visibility(
                                child: CustomTextFormField(
                                  width: 326,
                                  textInputType: TextInputType.number,
                                  controller: _slice_num_Controller,
                                  hintText: "lbl_slice_num".tr,
                                  margin: getMargin(top: 10),
                                ),
                                visible: (selectedBackgroundType == "1") &&
                                    (isUserDefinedBackground ?? false),
                              ),
                              Visibility(
                                child: Column(children: [
                                  CustomTextFormField(
                                    width: 326,
                                    textInputType: TextInputType.number,
                                    controller: _margin_top_Controller,
                                    hintText: "lbl_margin_top".tr,
                                    margin: getMargin(top: 20),
                                  ),
                                  CustomTextFormField(
                                    width: 326,
                                    textInputType: TextInputType.number,
                                    controller: _margin_bottom_Controller,
                                    hintText: "lbl_margin_bottom".tr,
                                    margin: getMargin(top: 20),
                                  ),
                                  CustomTextFormField(
                                    width: 326,
                                    textInputType: TextInputType.number,
                                    controller: _margin_left_Controller,
                                    hintText: "lbl_margin_left".tr,
                                    margin: getMargin(top: 20),
                                  ),
                                  CustomTextFormField(
                                    width: 326,
                                    textInputType: TextInputType.number,
                                    controller: _margin_right_Controller,
                                    hintText: "lbl_margin_right".tr,
                                    margin: getMargin(top: 20),
                                  ),
                                ]),
                                visible: (isUserDefinedBackground ?? false) &&
                                    selectedBackgroundType != null,
                              ),
                              // Visibility(
                              //   child: Container(
                              //       height: getVerticalSize(1.00),
                              //       width: getHorizontalSize(326.00),
                              //       margin:
                              //           getMargin(left: 2, top: 5, bottom: 5),
                              //       decoration: BoxDecoration(
                              //           color: ColorConstant.gray300Cc,
                              //           borderRadius: BorderRadius.circular(
                              //               getHorizontalSize(1.00)))),
                              //   visible: (isUserDefinedBackground ?? false) &&
                              //       (selectedBackgroundType != null),
                              // ),

                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Row(children: [
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                            child: Text(
                                                (logoCaptionName == ""
                                                    ? "lbl_logo".tr
                                                    : logoCaptionName),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansRegular14
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36),
                                                        height: getVerticalSize(
                                                            1.26))))),
                                    Expanded(
                                        flex: 4,
                                        child: GestureDetector(
                                          onLongPress: () {
                                            if (isServerStoredLogo) {
                                              var url = firstImageBase64;
                                              launchURL(url ?? '');
                                            }
                                          },
                                          child: CustomButton(
                                            onTap: () {
                                              onTapSelectimage(
                                                  UserImageType.logo);
                                            },
                                            width: 120,
                                            text: (isFirstImageSelected
                                                ? "lbl_image_selected".tr
                                                : "lbl_select_image".tr),
                                            variant:
                                                ButtonVariant.OutlineBlack9003f,
                                            shape: ButtonShape.RoundedBorder5,
                                            padding: ButtonPadding.PaddingT9,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBlack12,
                                            alignment: Alignment.topCenter,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 10),
                                                child: Icon(
                                                  (isFirstImageSelected
                                                      ? Icons.done
                                                      : Icons.photo),
                                                  color: Colors.white,
                                                  size: 15,
                                                )),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: CustomButton(
                                          height: 40,
                                          width: 20,
                                          // text: "Select Logo Position",
                                          prefixWidget: Icon(
                                            Icons.delete,
                                            color: ColorConstant.pink900,
                                            size: 20,
                                          ),
                                          // margin: getMargin(top: 22),
                                          variant:
                                              ButtonVariant.OutlineBlack9003f_1,
                                          shape: ButtonShape.RoundedBorder15,
                                          fontStyle:
                                              ButtonFontStyle.NunitoSansBold14,
                                          onTap: () {
                                            showAlertDialog(
                                                context, UserImageType.logo);
                                          },
                                        )),
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 2, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Row(children: [
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                            child: Text(
                                                (logoPositionCaptionName == ""
                                                    ? "lbl_picture_position".tr
                                                    : logoPositionCaptionName),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansRegular14
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36),
                                                        height: getVerticalSize(
                                                            1.26))))),
                                    // Expanded(
                                    //     flex: 1,
                                    //     child: SizedBox(
                                    //       width: 20,
                                    //     )),
                                    Expanded(
                                        flex: 5,
                                        child: CustomButton(
                                          height: 40,
                                          width: 200,
                                          text: logoPositionName,
                                          prefixWidget: Icon(
                                            Icons.fullscreen_rounded,
                                            color: ColorConstant.pink900,
                                          ),
                                          // margin: getMargin(top: 22),
                                          variant:
                                              ButtonVariant.OutlineBlack9003f_1,
                                          shape: ButtonShape.RoundedBorder15,
                                          fontStyle:
                                              ButtonFontStyle.NunitoSansBold14,
                                          onTap: () {
                                            // showAlertDialog(context);
                                            showPostionSelectiontDialog(
                                                context);
                                          },
                                        )),
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 2, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: getMargin(
                                          top: 15,
                                        ),
                                        child: Text("lbl_Edit_Card".tr,
                                            style: AppStyle
                                                .txtNotoSerifTeluguRegular12)),
                                    GestureDetector(
                                        child: Row(children: [
                                          CustomTextFormField(
                                              width: 282,
                                              isEnabled: false,
                                              focusNode: FocusNode(),
                                              // controller: _caption_Controller,
                                              hintText:
                                                  "lbl_click_update".tr,
                                              textInputType: TextInputType.text,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              margin: getMargin(top: 5)),
                                          IconButton(
                                              onPressed: () {
                                                goToHTMLEditor();
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 97, 8, 8),
                                              )),
                                        ]),
                                        onTap: () {
                                          goToHTMLEditor();
                                        }),
                                    Visibility(
                                      child: Container(
                                          margin: getMargin(
                                            top: 15,
                                          ),
                                          child: Text("lbl_url".tr,
                                              style: AppStyle
                                                  .txtNotoSerifTeluguRegular12)),
                                      visible: cardnameForURL.isNotEmpty,
                                    ),
                                    Visibility(
                                      child: Container(
                                          margin: getMargin(
                                            top: 5,
                                          ),
                                          child: Text(
                                              "https://gaamma.cards/" +
                                                  (cardTypeName ?? '') +
                                                  "/" +
                                                  _card_name_Controller.text +
                                                  ".html",
                                              style: AppStyle
                                                  .txtNunitoSansRegular14Pink)),
                                      visible: cardnameForURL.isNotEmpty,
                                    ),
                                  ]),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                cardID: selectedCardID ?? 0,
                onNextClicked: onTapNext,
                onPublish: () {
                  showPublishAlertDialog(context);
                },
                publishURL: publishedURL,
                isPublished: isPublished,
                isPublishAvailable: isPublishAvailable,
                onChanged: (BottomBarEnum type) {})));
  }

  mirrorHeaderImageToFooter() {
    setState(() {
      if (mirrorHeaderImage) {
        footerCroppedImage = headerCroppedImage;
        isFooterImageSelected = isHeaderImageSelected;
        footerExistingId = headerExistingId;
        footerImageBase64 = headerImageBase64;
        footerImageFileName = headerImageFileName;
      } else {
        footerCroppedImage = null;
        ;
        isFooterImageSelected = false;
        footerExistingId = null;
        footerImageBase64 = null;
        footerImageFileName = null;
        if (isServerStoredFooter) {
          removeImage(UserImageType.footer, false);
        }
      }
    });
  }

  goToHTMLEditor() {
    // GlobalVariables.tempCaptionContent = captionDefault??"";
    // GlobalVariables.tempMessageContent = messageDefault??"";
    // GlobalVariables.tempSenderContent = senderDefault??"";

    Get.toNamed(AppRoutes.cardHtmlEditor, arguments: {
      // "initialIndex": initialIndex,
      // "captionContent": captionDefault,
      "messageContent": messageDefault,
      // "senderContent": senderDefault,

      "backgroundColor": editorColorHex,
      "templateID": templateID,
      "cardType": cardType,
      "cardSubType": cardSubTypeID
    })?.then((value) {
      var newhtmlContent = value['htmlContent'];
      setState(() {
        messageDefault = htmlContent = newhtmlContent;
      });
    });
    // Navigator.of(context).pushNamed(AppRoutes.htmlEditor).then((value) => null);
  }

  onTapSelecttemplateOne() {
    if (cardSubTypeID == null) {
      Get.snackbar("lbl_warning".tr, "lbl_select_event_type".tr,
          backgroundColor: Color.fromARGB(255, 255, 224, 156),
          colorText: Color.fromARGB(255, 105, 73, 3),
          icon: Icon(
            Icons.warning,
            color: Color.fromARGB(255, 105, 73, 3),
          ));

      return;
    }
    // Navigator.of(context).pushNamed(AppRoutes.selectTemplateScreen);
    Get.toNamed(AppRoutes.selectTemplateScreen, arguments: {
      "isGreeting": false,
      "type": cardType,
      "existingTemplateID": templateID,
      "cardSubType": cardSubTypeID
    })?.then((value) {
      templateID = value['selectedTemplateID'];
      setState(() {
        templateName = value['selectedTemplateName'];
        logoCaptionName = value['logoCaptionName'];
        logoPositionCaptionName = value['logoPositionCaptionName'];
        editorColorHex = value['editorColorHex'].toString().length > 6
            ? value['editorColorHex']
            : "#ffffff";
        htmlContent = messageDefault = value['messageDefault'];

        languageID = value['languageID'];
        var templogoPosition = value['logoPosition'] as int?;
        setLogoPosition(templogoPosition ?? 0, isClosePopup: false);
        currentindex = 0;
        removeSelectedImage(UserImageType.background, true);

        removeSelectedImage(UserImageType.header, true);

        removeSelectedImage(UserImageType.footer, true);

        isUserDefinedBackground = value['isUserBackground'] as bool?;
        // isBackgroundColor = (isUserDefinedBackground ?? false) ? false : true;
      });
    });
  }

  setLogoPosition(int position, {bool isClosePopup = true}) {
    setState(() {
      logoPosition = position;
      switch (logoPosition) {
        case 0:
          logoPositionName = "lbl_position".tr;
          break;

        case 1:
          logoPositionName = "lbl_top_left".tr;
          break;

        case 2:
          logoPositionName = "lbl_top_center".tr;
          break;

        case 3:
          logoPositionName = "lbl_top_right".tr;
          break;

        case 7:
          logoPositionName = "lbl_bottom_left".tr;
          break;

        case 8:
          logoPositionName = "lbl_bottom_center".tr;
          break;
        case 9:
          logoPositionName = "lbl_bottom_right".tr;
          break;
      }
      if (isClosePopup) Navigator.pop(context);
    });
  }

  onTapSelectCardSubType() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setPopupState) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ("lbl_select".tr +" " + (cardTypeName ?? '') +" "+"lbl_type".tr),
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
                    // Text(
                    //   "Please choose image from previously uploaded images, gallery or click a picture using camera",
                    //   style: AppStyle.txtNunitoSansRegular14,
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _searchController,
                        onChanged: ((value) {
                          setPopupState(() {
                            var newcardSubTypes = allcardSubTypes!
                                .where((element) => element.cardSubTypeName!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                            cardSubTypes = newcardSubTypes;
                          });
                        }),
                        decoration: InputDecoration(
                          labelText: "lbl_search_details".tr,
                          labelStyle: AppStyle.txtNunitoSansRegular12.copyWith(
                              height: getVerticalSize(1.10), fontSize: 13),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 183, 183, 183),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setPopupState(() {
                                  cardSubTypes = allcardSubTypes;
                                  _searchController.text = "";
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                                color: ColorConstant.pink900,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 183, 183, 183),
                              )),
                          // filled: true,
                          contentPadding: EdgeInsets.all(15.0),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: getAllCardSubtypes(context))
                    // Padding(
                    //     padding: getPadding(top: 0),
                    //     child: GridView.builder(
                    //         shrinkWrap: true,
                    //         gridDelegate:
                    //             SliverGridDelegateWithFixedCrossAxisCount(
                    //                 mainAxisExtent: getVerticalSize(160.00),
                    //                 crossAxisCount: 2,
                    //                 mainAxisSpacing: getHorizontalSize(20.00),
                    //                 crossAxisSpacing: getHorizontalSize(20.00)),
                    //         physics: NeverScrollableScrollPhysics(),
                    //         itemCount: cardSubTypes!.length,
                    //         itemBuilder: (context, index) {
                    //           DriveFilesData model = cardSubTypes![index];
                    //           return UploadedImageWidget(model, false);
                    //         })),
                  ])),
            );
          });
        });
  }

  switchImageColor() {
    setState(() {
      // isBackgroundColor =
      if (!isBackgroundColor) {
        // removeSelectedImage(2, true);
      } else {
        currentColor = null;
      }
    });
  }

  List<Widget> getAllCardSubtypes(BuildContext context) {
    List<Widget> allWidgets = [];

    for (int i = 0; i < cardSubTypes.length; i++) {
      if (i % 2 == 0) {
        allWidgets.add(Row(
          children: [
            CardSubTypeWidget(cardSubTypes[i], selectedCardSubType),
            if ((i + 1) < cardSubTypes.length)
              CardSubTypeWidget(cardSubTypes[i + 1], selectedCardSubType),
          ],
        ));
      }
    }
    return allWidgets;
  }

  selectedCardSubType(CardSubTypeResult selected) {
    Navigator.pop(context);
    setState(() {
      cardSubTypeID = selected.id;
      cardSubTypeName = selected.cardSubTypeName ?? '';
    });
  }

  getHexColor() {
    setState(() {
      if (currentColor == null) {
        hexColor = "";
      } else {
        hexColor =
            '#${(currentColor!.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
      }
      var s = 1;
    });
  }

  onTapNext() {
    saveCardMain(context);
  }

  onTapEllipseFour() {
    Navigator.of(context).pop();
  }

  onTapContrast1() {
    Navigator.of(context).pushNamed(AppRoutes.digitalCardOptionsScreen);
  }

  onTapOverflowmenu() {
    Navigator.of(context).pushNamed(AppRoutes.basicCardEntryScreen);
  }

  showPostionSelectiontDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "lbl_cancel".tr,
        style: AppStyle.txtNunitoSansBold14Pink900,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget clearPosition = TextButton(
      child: Text(
        "lbl_clear".tr,
        style: AppStyle.txtNunitoSansBold14Pink900,
      ),
      onPressed: () {
        setLogoPosition(0);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "lbl_select_logo_position".tr,
        style: AppStyle.txtNunitoSansBold14Pink900,
      ),
      content: Container(
        height: 150,
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                height: 50,
                width: 50,
                // text: "Select Logo Position",
                prefixWidget: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      ImageConstant.imgLeftTop,
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                      color: ColorConstant.pink900,
                    )),
                // margin: getMargin(top: 22),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  setLogoPosition(1);
                },
              ),
              CustomButton(
                height: 50,
                width: 50,
                // text: "Select Logo Position",
                prefixWidget: Icon(
                  Icons.arrow_circle_up,
                  color: ColorConstant.pink900,
                  size: 32,
                ),
                // margin: getMargin(top: 22),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  setLogoPosition(2);
                },
              ),
              CustomButton(
                height: 50,
                width: 50,
                // text: "Select Logo Position",
                prefixWidget: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      ImageConstant.imgRightTop,
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                      color: ColorConstant.pink900,
                    )),
                // margin: getMargin(top: 22),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  setLogoPosition(3);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                height: 50,
                width: 50,
                // text: "Select Logo Position",
                prefixWidget: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      ImageConstant.imgLeftBottom,
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                      color: ColorConstant.pink900,
                    )),
                // margin: getMargin(top: 22),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  setLogoPosition(7);
                },
              ),
              CustomButton(
                height: 50,
                width: 50,
                // text: "Select Logo Position",
                prefixWidget: Icon(
                  Icons.arrow_circle_down,
                  color: ColorConstant.pink900,
                  size: 32,
                ),
                // margin: getMargin(top: 22),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  setLogoPosition(8);
                },
              ),
              CustomButton(
                height: 50,
                width: 50,
                // text: "Select Logo Position",
                prefixWidget: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      ImageConstant.imgRightBottom,
                      height: 10,
                      width: 80,
                      fit: BoxFit.contain,
                      color: ColorConstant.pink900,
                    )),
                // margin: getMargin(top: 22),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  setLogoPosition(9);
                },
              ),
            ],
          )
        ]),
      ),
      actions: [
        cancelButton,
        clearPosition
        // continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ' + url;
    }
  }

  getUserImages() async {
    try {
      var req = {"UserId": GlobalVariables.userID, "Anywhere": ""};
      GetDriveFileImagesResp resp =
          await api.getUserImages(context, queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          allUserImages = userImages = resp.result ?? [];
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

  String? getPictureTypeBase64ForDelete(UserImageType pictureType) {
    switch (pictureType) {
      case UserImageType.logo:
        return firstImageBase64;
      case UserImageType.background:
        return secondImageBase64;
      case UserImageType.header:
        return headerImageBase64;
      case UserImageType.footer:
        return footerImageBase64;
      default:
        return "";
    }
  }

  removeImage(UserImageType pictureType, bool isToggledToCardColor) async {
    try {
      var req = {
        "RefID": (selectedCardID).toString(),
        "RefTypeID": (pictureType == UserImageType.logo
                ? 8
                : (pictureType == UserImageType.background
                    ? 1
                    : (pictureType == UserImageType.header ? 10 : 11)))
            .toString(), //tocheck
        "SlNo": (pictureType == UserImageType.logo
                ? 8
                : (pictureType == UserImageType.background
                    ? 1
                    : (pictureType == UserImageType.header ? 10 : 11)))
            .toString(), //tocheck
        "FileRef": getPictureTypeBase64ForDelete(pictureType),
      };
      APIBooleanResponse resp =
          await api.removeImage(context, queryParams: req);
      if (resp.isSuccess ?? false) {
        if (!isToggledToCardColor) {
          Get.snackbar("lbl_success".tr,
              getImageTypeName(pictureType) + " image removed successfully!",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));
        }
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
      var s = 2;
    }
  }

  String getImageTypeName(UserImageType type) {
    switch (type) {
      case UserImageType.logo:
        return "lbl_logo_nw".tr;
      case UserImageType.background:
        return "lbl_background_nw".tr;
      case UserImageType.header:
        return "lbl_header_nw".tr;
      case UserImageType.footer:
        return "lbl_footer_nw".tr;
      default:
        return "";
    }
  }

  removeSelectedImage(UserImageType pictureType, bool isToggledToCardColor) {
    setState(() {
      switch (pictureType) {
        case UserImageType.header:
          imageHeader = null;
          headerExistingId = null;
          isHeaderImageSelected = false;
          if (isServerStoredHeader) {
            removeImage(pictureType, isToggledToCardColor);
          }
          break;

        case UserImageType.background:
          imageSecond = null;
          pictureExistingId = null;
          isSecondImageSelected = false;
          if (isServerStoredBackground) {
            removeImage(pictureType, isToggledToCardColor);
          }
          break;

        case UserImageType.footer:
          imageFooter = null;
          footerExistingId = null;
          isFooterImageSelected = false;
          if (isServerStoredFooter) {
            removeImage(pictureType, isToggledToCardColor);
          }
          break;

        case UserImageType.logo:
          logoExistingId = null;
          imageFirst = null;
          isFirstImageSelected = false;
          if (isServerStoredLogo) {
            removeImage(pictureType, isToggledToCardColor);
          }
          break;
      }
    });
  }

  showAlertDialog(BuildContext context, UserImageType pictureType) {
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
        removeSelectedImage(pictureType, false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("lbl_confirmation".tr),
      content: Text("lbl_delete_image".tr),
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

  onTapSelectimage(UserImageType pictureType) {
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
                      // Text(
                      //   "Please choose image from previously uploaded images, gallery or click a picture using camera",
                      //   style: AppStyle.txtNunitoSansRegular14,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _searchController,
                          onChanged: ((value) {
                            setPopupState(() {
                              var newUserImages = allUserImages!
                                  .where((element) => element.fileName!
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                              userImages = newUserImages;
                            });
                          }),
                          decoration: InputDecoration(
                            labelText: "lbl_search_details".tr,
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
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setPopupState(() {
                                    userImages = allUserImages;
                                    _searchController.text = "";
                                  });
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: ColorConstant.pink900,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 183, 183, 183),
                                )),
                            // filled: true,
                            contentPadding: EdgeInsets.all(15.0),
                          )),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getAllUserImages(context, pictureType))
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
                      clickOrSelectImage("Camera", pictureType);
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
                      clickOrSelectImage("Gallery", pictureType);
                    },
                  ),
                ]);
          });
        });
  }

  List<Widget> getAllUserImages(
      BuildContext context, UserImageType pictureType) {
    List<Widget> allWidgets = [];

    for (int i = 0; i < userImages.length; i++) {
      if (i % 2 == 0) {
        allWidgets.add(Row(
          children: [
            UploadedImageWidget(userImages[i], pictureType,
                selectedImageforCard, cropSelectedImageForCard),
            if ((i + 1) < userImages.length)
              UploadedImageWidget(userImages[i + 1], pictureType,
                  selectedImageforCard, cropSelectedImageForCard),
          ],
        ));
      }
    }
    return allWidgets;
  }

  selectedImageforCard(DriveFilesData image, UserImageType pictureType) {
    setState(() {
      switch (pictureType) {
        case UserImageType.header:
          headerExistingId = image.id;
          headerImageBase64 = null;
          headerImageFileName = null;
          isHeaderImageSelected = true;
          break;

        case UserImageType.background:
          pictureExistingId = image.id;
          secondImageBase64 = null;
          secondImageFileName = null;
          isSecondImageSelected = true;
          break;

        case UserImageType.footer:
          footerExistingId = image.id;
          footerImageBase64 = null;
          footerImageFileName = null;
          isFooterImageSelected = true;
          break;

        case UserImageType.logo:
          logoExistingId = image.id;
          firstImageBase64 = null;
          firstImageFileName = null;
          isFirstImageSelected = true;
          break;
      }
    });
    Navigator.pop(context);
  }

  cropSelectedImageForCard(DriveFilesData image, UserImageType pictureType) {
    setState(() {
      switch (pictureType) {
        case UserImageType.header:
          headerExistingId = null;
          isHeaderImageSelected = true;
          break;

        case UserImageType.background:
          pictureExistingId = null;
          isSecondImageSelected = true;
          break;

        case UserImageType.footer:
          footerExistingId = null;
          isFooterImageSelected = true;
          break;

        case UserImageType.logo:
          logoExistingId = null;
          isFirstImageSelected = true;
          break;
      }
      ProgressDialogUtils.showProgressDialog(context);
      getImageFromUrl(image.driveUrl ?? '', pictureType);
    });
    Navigator.pop(context);
  }

  getImageFromUrl(String imageUrl, UserImageType pictureType) async {
    try {
      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
              .buffer
              .asUint8List();

      writeToFile(bytes).then((file) {
        gotoImageModify(file, pictureType);
      });

      ProgressDialogUtils.hideProgressDialog(context);
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog(context);
    }
  }

  Future<File> writeToFile(Uint8List data) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMdd-hhmmss').format(now);
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath +
        '/existingFile' +
        formattedDate +
        '.png'; // file_01.tmp is dump file, can be anything
    File(filePath).writeAsBytesSync(data);
    return File(filePath);
  }

  clickOrSelectImage(String type, UserImageType pictureType) async {
    Navigator.of(context).pop();
    if (type == "Gallery") {
      switch (pictureType) {
        case UserImageType.header:
          if (isServerStoredHeader) removeImage(pictureType, true);
          imageHeader = await _picker.pickImage(source: ImageSource.gallery);
          break;
        case UserImageType.background:
          if (isServerStoredBackground) removeImage(pictureType, true);
          imageSecond = await _picker.pickImage(source: ImageSource.gallery);
          break;
        case UserImageType.footer:
          if (isServerStoredFooter) removeImage(pictureType, true);
          imageFooter = await _picker.pickImage(source: ImageSource.gallery);
          break;
        case UserImageType.logo:
          if (isServerStoredLogo) removeImage(pictureType, true);
          imageFirst = await _picker.pickImage(source: ImageSource.gallery);
          break;
      }
    } else {
      switch (pictureType) {
        case UserImageType.header:
          if (isServerStoredHeader) removeImage(pictureType, true);
          imageHeader = await _picker.pickImage(source: ImageSource.camera);
          break;
        case UserImageType.background:
          if (isServerStoredBackground) removeImage(pictureType, true);
          imageSecond = await _picker.pickImage(source: ImageSource.camera);
          break;
        case UserImageType.footer:
          if (isServerStoredFooter) removeImage(pictureType, true);
          imageFooter = await _picker.pickImage(source: ImageSource.camera);
          break;
        case UserImageType.logo:
          if (isServerStoredLogo) removeImage(pictureType, true);
          imageFirst = await _picker.pickImage(source: ImageSource.camera);
      }
    }

    setState(() {
      if (imageFirst != null && pictureType == UserImageType.logo)
        isFirstImageSelected = true;
      if (imageSecond != null && pictureType == UserImageType.background)
        isSecondImageSelected = true;
      if (imageHeader != null && pictureType == UserImageType.header)
        isHeaderImageSelected = true;
      if (imageFooter != null && pictureType == UserImageType.footer)
        isFooterImageSelected = true;
    });
    File imageFile = new File('');

    if (pictureType == UserImageType.logo && imageFirst!.path.isNotEmpty)
      imageFile = File(imageFirst!.path);
    if (pictureType == UserImageType.background && imageSecond!.path.isNotEmpty)
      imageFile = File(imageSecond!.path);
    if (pictureType == UserImageType.header && imageHeader!.path.isNotEmpty)
      imageFile = File(imageHeader!.path);
    if (pictureType == UserImageType.footer && imageFooter!.path.isNotEmpty)
      imageFile = File(imageFooter!.path);

    gotoImageModify(imageFile, pictureType);
  }

  gotoImageModify(File imageFile, UserImageType pictureType) {
    Get.toNamed(AppRoutes.imageModifyScreen,
            arguments: {"imageFile": imageFile, "pictureType": pictureType})
        ?.then((value) {
      double? width = value['width'];
      double? height = value['height'];
      bool? isSquare = value['isSquare'];
      String? imageFilePath = value["refinedImagePath"] as String?;
      UserImageType pictureType = value["pictureType"] as UserImageType;

      try {
        imageFile = File(imageFilePath ?? '');
        var base64val1 = "data:image/png;base64," +
            base64Encode(imageFile.readAsBytesSync());
        // print('base64:'+base64val1);

        switch (pictureType) {
          case UserImageType.header:
            headerImageBase64 = base64val1;
            headerCroppedImage = imageFile;
            isHeaderImageSelected = true;
            headerImageFileName = p.basename(imageFile.path);
            headerExistingId = null;
            break;

          case UserImageType.background:
            secondImageBase64 = base64val1;
            secondCroppedImage = imageFile;
            isSecondImageSelected = true;
            secondImageFileName = p.basename(imageFile.path);
            pictureExistingId = null;
            break;

          case UserImageType.footer:
            footerImageBase64 = base64val1;
            footerCroppedImage = imageFile;
            isFooterImageSelected = true;
            footerImageFileName = p.basename(imageFile.path);
            footerExistingId = null;
            break;

          case UserImageType.logo:
            firstImageBase64 = base64val1;
            firstCroppedImage = imageFile;
            isFirstImageSelected = true;
            firstImageFileName = p.basename(imageFile.path);
            logoExistingId = null;
            break;
        }
      } catch (e) {
        var s = 1;
      }
    });
  }
}
