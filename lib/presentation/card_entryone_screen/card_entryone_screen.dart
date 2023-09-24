import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/createCard/post_create_card_resp.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';

class CardEntryoneScreen extends StatefulWidget {
  const CardEntryoneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardEntryoneScreen createState() => _CardEntryoneScreen();
}

class _CardEntryoneScreen extends State<CardEntryoneScreen> {
  TextEditingController _eventDate_Controller = new TextEditingController();
  TextEditingController _website_Controller = new TextEditingController();
  TextEditingController _email_id4_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _whatsapp_Controller = new TextEditingController();
  TextEditingController _secondary_phone_number_Controller =
      new TextEditingController();
  TextEditingController _secondary_whatsapp_Controller =
      new TextEditingController();

  DateTime? selectedDate;
  var cardType = Get.arguments["cardType"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardSubtypeID = Get.arguments["cardSubtypeID"] as int?;
  var templateId = Get.arguments["templateId"] as String?;
  var cardTypeName = Get.arguments["cardTypeName"] as String?;
  var templateName = Get.arguments["templateName"] as String?;
  var cardSubTypeName = Get.arguments["cardSubTypeName"] as String?;
  var isPublishAvailable = Get.arguments["isPublishAvailable"] as bool?;
  var cardName = Get.arguments["cardName"] as String?;
  var mainResult = Get.arguments["cardDetails"] as GetCardResult?;
  bool isPublished = (Get.arguments["isPublished"] as bool?) ?? false;
  String publishedURL = (Get.arguments["publishedURL"] as String?) ?? "";
  ApiClient api = new ApiClient();
  @override
  void initState() {
    if (mainResult != null) {
      updateExistingData();
    }
    super.initState();
  }

  updateExistingData() {
    setState(() {
      _email_id4_Controller.text = mainResult?.emailId ?? '';
      _eventDate_Controller.text = (mainResult?.eventDateString ?? '') == ""? "":((mainResult?.eventDateString??'').replaceAll(" 00:00", ""));
      _website_Controller.text = mainResult?.website ?? '';
      _phone_number_Controller.text = mainResult?.phoneNum ?? '';
      _secondary_phone_number_Controller.text = mainResult?.phoneNum2 ?? '';
      _whatsapp_Controller.text = mainResult?.whatsappNum ?? '';
      _secondary_whatsapp_Controller.text = mainResult?.whatsappNum2 ?? '';
    });
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
      APIResponse resp = await api.fetchPublish(context,queryParams: req);
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

  getCardData({bool showProgress = true}) async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "CardType": "0",
        "CardSubType": "0",
        "LanguageId":GlobalVariables.currentLanguage
      };
      GetGetCreateCardResp resp = await api.fetchGetCreateCard(context,
          queryParams: req, showProgress: showProgress);
      if (resp.isSuccess ?? false) {
        setState(() {
          mainResult = resp.result;
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

  saveCardMain() async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "Name": cardName,
        "EventDate": _eventDate_Controller.text,
        "Website": _website_Controller.text,
        "EmailId": _email_id4_Controller.text,
        "PhoneNum": _phone_number_Controller.text,
        "PhoneNum2": _secondary_phone_number_Controller.text,
        "WhatsappNum": _whatsapp_Controller.text,
        "WhatsappNum2": _secondary_whatsapp_Controller.text,
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      PostSaveResp resp = await api.saveCardDetails(context,requestData: req);
      if (resp.isSuccess ?? false) {
        selectedCardID = resp.result;
        Get.snackbar("lbl_success".tr, "lbl_card_saved".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        Navigator.of(context)
            .pushNamed(AppRoutes.cardEntrytwoScreen, arguments: {
          "cardType": cardType,
          "cardSubtypeID": cardSubtypeID,
          "templateId": templateId,
          "cardTypeName": cardTypeName,
          "templateName": templateName,
          "cardSubTypeName": cardSubTypeName,
          "SelectedCardID": selectedCardID,
          "isPublishAvailable": isPublishAvailable,
          "cardName": cardName,
          "cardDetails": mainResult,
          "isPublished": isPublished,
          "publishedURL": publishedURL
        }).then((value) {
          getCardData(showProgress: false);
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
                                              onTap: onTapContrast2),
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
                                    text: "lbl_card_details".tr.toUpperCase(),
                                    margin: getMargin(left: 54, top: 14))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_15),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 31, right: 25),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      // width: getHorizontalSize(266.00),
                                      margin: getMargin(left: 0),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: ("msg_card_type_ex_new2"
                                                        .tr) +
                                                    (cardTypeName ?? ""),
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.pink900,
                                                    fontSize: getFontSize(18),
                                                    fontFamily: 'Nunito',
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ]),
                                          textAlign: TextAlign.left))),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      // width: getHorizontalSize(266.00),
                                      margin: getMargin(left: 0),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: ("msg_template_type".tr) +
                                                    (templateName ?? ""),
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.pink900,
                                                    fontSize: getFontSize(18),
                                                    fontFamily: 'Nunito',
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ]),
                                          textAlign: TextAlign.left))),
                              Visibility(
                                  child: GestureDetector(
                                    child: CustomTextFormField(
                                        width: 326,
                                        focusNode: FocusNode(),
                                        isEnabled: false,
                                        controller: _eventDate_Controller,
                                        hintText: "lbl_event_date".tr,
                                        margin: getMargin(top: 29)),
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                  ),
                                  visible: false),//((cardType ?? 0) == 2)),
                              Row(children: [
                                CustomTextFormField(
                                    width: 282,
                                    focusNode: FocusNode(),
                                    controller: _website_Controller,
                                    onTap: () {
                                      _website_Controller.text = "https://";
                                    },
                                    hintText: "lbl_website".tr,
                                    textInputType: TextInputType.text,
                                    textCapitalization: TextCapitalization.none,
                                    margin: getMargin(top: 23)),
                                IconButton(
                                    onPressed: () {
                                      launchURL();
                                    },
                                    icon: Icon(
                                      Icons.open_in_browser,
                                      color: Color.fromARGB(255, 97, 8, 8),
                                    )),
                              ]),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _email_id4_Controller,
                                  hintText: "lbl_email_id4".tr,
                                  textInputType: TextInputType.emailAddress,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _phone_number_Controller,
                                  hintText: "lbl_phone_number".tr,
                                  textInputType: TextInputType.phone,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller:
                                      _secondary_phone_number_Controller,
                                  textInputType: TextInputType.phone,
                                  hintText: "lbl_secondary_phone_number".tr,
                                  margin: getMargin(top: 16)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _whatsapp_Controller,
                                  textInputType: TextInputType.phone,
                                  hintText: "lbl_whatsapp".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _secondary_whatsapp_Controller,
                                  textInputType: TextInputType.phone,
                                  hintText: "lbl_secondary_whatsapp".tr,
                                  margin: getMargin(top: 23)),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                cardID: selectedCardID ?? 0,
                onNextClicked: onTapNext,
                onPublish: () {
                  showPublishAlertDialog(context);
                },
                isPublished: isPublished,
                publishURL: publishedURL,
                isPublishAvailable: isPublishAvailable ?? false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapNext() {
    saveCardMain();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate =
            DateFormat('dd/MMM/yyyy').format(selectedDate ?? DateTime.now());
        _eventDate_Controller.text = formattedDate;
      });
    }
  }

  launchURL() async {
    try {
      String url = _website_Controller.text;

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // throw 'Could not launch ' + greetingHelpURL;
      }
    } catch (e) {
      var s = 1;
    }
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast2() {
    Navigator.pop(context);
  }
}
