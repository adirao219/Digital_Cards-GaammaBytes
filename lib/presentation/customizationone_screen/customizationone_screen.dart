import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';

class CustomizationoneScreen extends StatefulWidget {
  const CustomizationoneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomizationoneScreen createState() => _CustomizationoneScreen();
}

class _CustomizationoneScreen extends State<CustomizationoneScreen> {
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
  String? createDateString;
  String? lastEditDateString;
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
                              left: 38, top: 44, right: 114, bottom: 7),
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
                                              onTap: onTapContrast4),
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
                                    margin: getMargin(left: 39, top: 5))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_17),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 27, top: 31, right: 23),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              CustomButton(
                                  height: 60,
                                  width: 325,
                                  text: "lbl_card_preview2".tr,
                                  margin: getMargin(top: 32),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  padding: ButtonPadding.PaddingAll18,
                                  fontStyle: ButtonFontStyle.NunitoSansBold16,
                                  onTap: onTapCardpreview),
                              Padding(
                                  padding: getPadding(left: 15, top: 31),
                                  child: Text("lbl_smart_links".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansBold16Pink900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.36)))),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                      height: 60,
                                      width: 150,
                                      text: "  " + "lbl_footer".tr,
                                      margin: getMargin(top: 10),
                                      variant:
                                          ButtonVariant.OutlineBlack9003f_1,
                                      shape: ButtonShape.RoundedBorder15,
                                      padding: ButtonPadding.PaddingAll18,
                                      fontStyle:
                                          ButtonFontStyle.NunitoSansBold16,
                                      prefixWidget: CustomImageView(
                                          svgPath: ImageConstant.imgVideocamera,
                                          height: getVerticalSize(25.00),
                                          width: getHorizontalSize(21.00),
                                          margin: getMargin(bottom: 1)),
                                      onTap: onTapFooter),
                                  CustomButton(
                                      height: 60,
                                      width: 150,
                                      text: "  " + "lbl_bands".tr,
                                      margin: getMargin(top: 10),
                                      variant:
                                          ButtonVariant.OutlineBlack9003f_1,
                                      shape: ButtonShape.RoundedBorder15,
                                      padding: ButtonPadding.PaddingAll18,
                                      fontStyle:
                                          ButtonFontStyle.NunitoSansBold16,
                                      prefixWidget: CustomImageView(
                                          svgPath: ImageConstant.imgGridPink900,
                                          height: getVerticalSize(25.00),
                                          width: getHorizontalSize(21.00),
                                          margin: getMargin(bottom: 1)),
                                      onTap: onTapBand),
                                ],
                              ),
                              Padding(
                                  padding: getPadding(left: 15, top: 31),
                                  child: Text("msg_advanced_feature".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansBold16Pink900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.36)))),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                      height: 60,
                                      width: 150,
                                      text: "  " + "lbl_advanced".tr,
                                      margin: getMargin(top: 10),
                                      variant:
                                          ButtonVariant.OutlineBlack9003f_1,
                                      shape: ButtonShape.RoundedBorder15,
                                      padding: ButtonPadding.PaddingAll18,
                                      fontStyle:
                                          ButtonFontStyle.NunitoSansBold16,
                                      prefixWidget: CustomImageView(
                                          svgPath:
                                              ImageConstant.imgSearchPink900,
                                          height: getVerticalSize(25.00),
                                          width: getHorizontalSize(21.00),
                                          margin: getMargin(bottom: 1)),
                                      onTap: onTapAdvanced),
                                ],
                              ),
                              Visibility(
                                child: Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(326.00),
                                    margin:
                                        getMargin(left: 2, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray300Cc,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(1.00)))),
                                visible: !(createDateString == null ||
                                    createDateString!.isEmpty),
                              ),
                              Visibility(
                                child: Padding(
                                    padding:
                                        getPadding(left: 0, top: 7, bottom: 7),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text("lbl_created_date".tr,
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
                                            width: 40,
                                          ),
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text(
                                                  createDateString ?? "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.pink900,
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.w700,
                                                  ))),
                                        ])),
                                visible: !(createDateString == null ||
                                    createDateString!.isEmpty),
                              ),
                              Visibility(
                                child: Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(326.00),
                                    margin:
                                        getMargin(left: 2, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray300Cc,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(1.00)))),
                                visible: !(lastEditDateString == null ||
                                    lastEditDateString!.isEmpty),
                              ),
                              Visibility(
                                child: Padding(
                                    padding: getPadding(left: 0, top: 7),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text(
                                                  "lbl_last_edited_date".tr,
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
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text(
                                                  lastEditDateString ?? '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.pink900,
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.w700,
                                                  ))),
                                        ])),
                                visible: !(lastEditDateString == null ||
                                    lastEditDateString!.isEmpty),
                              ),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                cardID: selectedCardID ?? 0,
                onNextClicked: onTapCardpreview,
                onPublish: (){
                  showPublishAlertDialog(context);
                },
                isPublished: isPublished,
                publishURL: publishedURL,
                isPublishAvailable: isPublishAvailable ?? false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapCardpreview() {
    Navigator.of(context).pushNamed(AppRoutes.cardPreviewScreen,
        arguments: {"CardID": this.selectedCardID, "isDigitalCard": true});
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
          publishedURL = resp.result;
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

  getCardData({bool showProgress=true}) async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "CardType": "0",
        "CardSubType": "0",
        "LanguageId":GlobalVariables.currentLanguage
      };
      GetGetCreateCardResp resp =
          await api.fetchGetCreateCard(context, queryParams: req,showProgress: showProgress);
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

  onTapFooter() {
    Navigator.of(context).pushNamed(AppRoutes.footerScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "cardName": cardName
    });
  }

  onTapBand() {
    Navigator.of(context).pushNamed(AppRoutes.bandsScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "cardName": cardName
    });
  }

  onTapRectangle4216() {
    Navigator.of(context).pushNamed(AppRoutes.iconGroupScreen);
  }

  onTapAdvanced() {
    Navigator.of(context).pushNamed(AppRoutes.advancedScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "cardName": cardName,
      "cardDetails": mainResult
    }).then((value) {
      getCardData(showProgress: false);
    });
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast4() {
    Navigator.of(context).pushNamed(AppRoutes.cardEntrytwoScreen);
  }
}
