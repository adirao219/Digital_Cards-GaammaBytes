import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/driveImages/drive_file_images_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../data/models/getLinkDefinition/get_get_link_definition_resp.dart';
import '../../data/models/saveLinkDefinition/post_save_link_definition_resp.dart';
import '../../widgets/custom_button.dart';
import '../my_e_greeting_cards_screen/widgets/uploaded_images_widget.dart';

class LinkScreen extends StatefulWidget {
  const LinkScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LinkScreen createState() => _LinkScreen();
}

class _LinkScreen extends State<LinkScreen> {
  TextEditingController _searchController = new TextEditingController();
  ImagePicker _picker = new ImagePicker();
  TextEditingController _twitter_Controller = new TextEditingController();
  TextEditingController _instagram_Controller = new TextEditingController();
  TextEditingController _facebook_Controller = new TextEditingController();
  TextEditingController _linkedin_Controller = new TextEditingController();
  TextEditingController _pinterest_Controller = new TextEditingController();
  TextEditingController _snapchat_Controller = new TextEditingController();
  TextEditingController _googleplus_Controller = new TextEditingController();
  TextEditingController _foursquare_Controller = new TextEditingController();
  TextEditingController _blog_Controller = new TextEditingController();
  TextEditingController _youtube_Controller = new TextEditingController();
  TextEditingController _meetup_Controller = new TextEditingController();
  TextEditingController _other_Controller = new TextEditingController();
  TextEditingController _other2_Controller = new TextEditingController();
  ApiClient api = new ApiClient();
  var cardType = Get.arguments["cardType"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardSubtypeID = Get.arguments["cardSubtypeID"] as int?;
  var templateId = Get.arguments["templateId"] as String?;
  var cardTypeName = Get.arguments["cardTypeName"] as String?;
  var templateName = Get.arguments["templateName"] as String?;
  var cardSubTypeName = Get.arguments["cardSubTypeName"] as String?;
  var isPublishAvailable = Get.arguments["isPublishAvailable"] as bool?;
  var cardName = Get.arguments["cardName"] as String?;
  bool isFirstImageSelected = false;
  bool isServerStoredLogo = false;
  XFile? imageLogo;
  File mainImageFile = new File('');
  File? logoCroppedImage;
  String? logoImageBase64;
  String? logoImageFileName;
  int? logoExistingId;

  List<DriveFilesData> allUserImages = [];
  List<DriveFilesData> userImages = [];

  @override
  void initState() {
    getUserImages();
    getLinks();
    super.initState();
  }

  getLinks() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString()
      };
      GetGetLinkDefinitionResp resp =
          await api.fetchGetLinkDefinition(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          _blog_Controller.text = resp.result!.linkDefinitionData!.blog ?? '';
          _twitter_Controller.text =
              resp.result!.linkDefinitionData!.twitter ?? '';
          _facebook_Controller.text =
              resp.result!.linkDefinitionData!.facebook ?? '';
          _instagram_Controller.text =
              resp.result!.linkDefinitionData!.instagram ?? '';
          _linkedin_Controller.text =
              resp.result!.linkDefinitionData!.linkedIn ?? '';
          _snapchat_Controller.text =
              resp.result!.linkDefinitionData!.snapchatUser ?? '';
          _googleplus_Controller.text =
              resp.result!.linkDefinitionData!.googlePlus ?? '';
          _foursquare_Controller.text =
              resp.result!.linkDefinitionData!.foursquare ?? '';
          _pinterest_Controller.text =
              resp.result!.linkDefinitionData!.pinterest ?? '';
          _youtube_Controller.text =
              resp.result!.linkDefinitionData!.youtube ?? '';
          _meetup_Controller.text =
              resp.result!.linkDefinitionData!.meetup ?? '';
          _other_Controller.text =
              resp.result!.linkDefinitionData!.otherURL1 ?? '';
          _other2_Controller.text =
              resp.result!.linkDefinitionData!.otherURL2 ?? '';
          logoImageFileName =
              resp.result!.linkDefinitionData!.paymentQRCodeRef ?? '';
          logoImageBase64 =
              resp.result!.linkDefinitionData!.paymentQRCode ?? '';
          if (logoImageBase64!.isNotEmpty && logoImageFileName!.isNotEmpty) {
            isFirstImageSelected = true;
            if (logoImageBase64!.startsWith("http")) {
              isServerStoredLogo = true;
            }
          }
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
      var s = 1;
    }
  }

  saveLinks() async {
    try {
      var req = {
        "CardID": selectedCardID.toString(),
        "UserIdString": GlobalVariables.userID,
        "Twitter": _twitter_Controller.text,
        "Facebook": _facebook_Controller.text,
        "Instagram": _instagram_Controller.text,
        "SnapchatUser": _snapchat_Controller.text,
        "GooglePlus": _googleplus_Controller.text,
        "LinkedIn": _linkedin_Controller.text,
        "Foursquare": _foursquare_Controller.text,
        "Blog": _blog_Controller.text,
        "Youtube": _youtube_Controller.text,
        "Pinterest": _pinterest_Controller.text,
        "Meetup": _meetup_Controller.text,
        "OtherURL1": _other_Controller.text,
        "OtherURL2": _other2_Controller.text,
        "PaymentQRCode": logoImageBase64,
        "PaymentQRCodeRef": logoImageFileName,
        "PaymentQRCodeOldId": logoExistingId ?? ''
      };
      APIBooleanResponse resp =
          await api.createSaveLinkDefinition(requestData: req);
      if ((resp.isSuccess ?? false) && (resp.result ?? false)) {
        Get.snackbar('Success', "Links updated successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        Navigator.pop(context);
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
                              left: 38, top: 44, right: 165, bottom: 6),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(children: [
                                Container(
                                    height: getVerticalSize(36.00),
                                    width: getHorizontalSize(38.00),
                                    margin: getMargin(bottom: 7),
                                    child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          AppbarImage(
                                              height: getVerticalSize(36.00),
                                              width: getHorizontalSize(38.00),
                                              svgPath: ImageConstant
                                                  .imgContrastWhiteA700),
                                          AppbarImage(
                                              height: getVerticalSize(10.00),
                                              width: getHorizontalSize(5.00),
                                              svgPath: ImageConstant
                                                  .imgVectorstrokeGray90005,
                                              margin: getMargin(
                                                  left: 15,
                                                  top: 13,
                                                  right: 18,
                                                  bottom: 13))
                                        ])),
                                AppbarTitle(
                                    text: "lbl_link".tr.toUpperCase(),
                                    margin: getMargin(left: 88, top: 0))
                              ])))
                    ])),
                styleType: Style.bgStyle_27),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 24, top: 10, right: 19, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  ("msg_card_type_ex_new2".tr) +
                                      (cardTypeName ?? ""),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoBold18),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _twitter_Controller,
                                  hintText: "lbl_twitter".tr,
                                  margin: getMargin(left: 1, top: 20),
                                  prefix: Container(
                                      padding: getPadding(
                                          left: 5, top: 6, right: 5, bottom: 6),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue500,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgTwitter)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _facebook_Controller,
                                  hintText: "lbl_facebook".tr,
                                  margin: getMargin(left: 1, top: 20),
                                  prefix: Container(
                                      padding: getPadding(
                                          left: 5, top: 6, right: 5, bottom: 6),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blueA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath:
                                              ImageConstant.imgPlusWhiteA700)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _instagram_Controller,
                                  hintText: "lbl_instagram".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 12),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.pinkA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgInstagram)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(34.00))),
                              CustomTextFormField(
                                  width: 331,
                                  controller: _linkedin_Controller,
                                  hintText: "lbl_linkedin".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue800,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgLinkedin)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _snapchat_Controller,
                                  hintText: "lbl_snapchat".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      // padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 12),
                                      decoration: BoxDecoration(
                                          // color: ColorConstant.pinkA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgBg)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(34.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _googleplus_Controller,
                                  hintText: "lbl_google".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      // padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 12),
                                      decoration: BoxDecoration(
                                          // color: ColorConstant.pinkA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgGooglelogo1)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(34.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _foursquare_Controller,
                                  hintText: "lbl_foursquare".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      // padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 12),
                                      decoration: BoxDecoration(
                                          // color: ColorConstant.pinkA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                        imagePath: ImageConstant.imgBg22x22,
                                      )),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(34.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _blog_Controller,
                                  hintText: "lbl_blog".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      // padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 12),
                                      decoration: BoxDecoration(
                                          // color: ColorConstant.pinkA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgBg1)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(34.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _pinterest_Controller,
                                  hintText: "lbl_pinterest".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.redA700,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgSettings)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _youtube_Controller,
                                  hintText: "lbl_youtube".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.redA700,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgYoutube,
                                      )),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _meetup_Controller,
                                  hintText: "lbl_meetup".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.redA700,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                        imagePath: ImageConstant.imgBg2,
                                      )),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _other_Controller,
                                  hintText: "lbl_other".tr,
                                  margin: getMargin(left: 1, top: 23),
                                  textInputAction: TextInputAction.done),
                              CustomTextFormField(
                                  width: 326,
                                  controller: _other2_Controller,
                                  hintText: "lbl_other_2".tr,
                                  margin: getMargin(left: 1, top: 23),
                                  textInputAction: TextInputAction.done),
                              Padding(
                                  padding: getPadding(left: 1, top: 14),
                                  child: Text("lbl_payment_qr".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoBold14)),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Padding(
                                        padding: getPadding(left: 1, top: 11),
                                        child: DottedBorder(
                                            color: ColorConstant.pink900,
                                            padding: EdgeInsets.only(
                                                left: getHorizontalSize(1.00),
                                                top: getVerticalSize(1.00),
                                                right: getHorizontalSize(1.00),
                                                bottom: getVerticalSize(1.00)),
                                            strokeWidth:
                                                getHorizontalSize(1.00),
                                            radius: Radius.circular(12),
                                            borderType: BorderType.RRect,
                                            dashPattern: [2, 2],
                                            child: Container(
                                                width:
                                                    getHorizontalSize(125.00),
                                                padding: getPadding(
                                                    left: 0,
                                                    top: 15,
                                                    right: 0,
                                                    bottom: 15),
                                                decoration: AppDecoration
                                                    .outlinePink9001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgSharePink900,
                                                          height:
                                                              getSize(30.00),
                                                          width:
                                                              getSize(30.00)),
                                                      Align(
                                                          alignment: Alignment
                                                              .center,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 3,
                                                                      bottom:
                                                                          6),
                                                              child: Text(
                                                                  "lbl_upload_file"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtNunitoSansRegular14
                                                                      .copyWith(
                                                                          letterSpacing:
                                                                              getHorizontalSize(0.36)))))
                                                    ])))),
                                    onTap: () {
                                      onTapSelectimage();
                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  isServerStoredLogo
                                      ? CustomImageView(
                                          url: logoImageBase64,
                                          width: 125,
                                          height: 125,
                                        )
                                      : (mainImageFile.path.isEmpty
                                          ? CustomImageView(
                                              url: "/data",
                                              width: 125,
                                              height: 125,
                                            )
                                          : CustomImageView(
                                              file: mainImageFile,
                                              width: 125,
                                              height: 125,
                                            )),
                                  SizedBox(
                                    width: 15,
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
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                          height: 40,
                                          width: 148,
                                          text: "lbl_save".tr,
                                          padding: ButtonPadding.PaddingT9,
                                          onTap: onTapTxtBtnConfirm),
                                    ],
                                  ),
                                ],
                              )
                            ]))))));
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
                      "Select Image!",
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
                          children:
                              getAllUserImages(context, UserImageType.logo))
                    ])),
                actions: <Widget>[
                  CustomButton(
                    height: 40,
                    width: 110,
                    text: (' Camera'),
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
                    text: (' Gallery'),
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

  getUserImages() async {
    try {
      var req = {"UserId": GlobalVariables.userID, "Anywhere": ""};
      GetDriveFileImagesResp resp = await api.getUserImages(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          allUserImages = userImages = resp.result ?? [];
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
      isServerStoredLogo = true;
      logoExistingId = image.id;
      logoImageBase64 = image.driveUrl;
      logoImageFileName = null;
    });
    Navigator.pop(context);
  }

  cropSelectedImageForCard(DriveFilesData image, UserImageType pictureType) {
    setState(() {
      logoExistingId = null;
      isFirstImageSelected = true;

      ProgressDialogUtils.showProgressDialog();
      getImageFromUrl(image.driveUrl ?? '', pictureType);
    });
    Navigator.pop(context);
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

  getImageFromUrl(String imageUrl, UserImageType pictureType) async {
    try {
      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
              .buffer
              .asUint8List();

      writeToFile(bytes).then((file) {
        gotoImageModify(file, pictureType);
      });

      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
    }
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

        logoImageBase64 = base64val1;
        logoCroppedImage = imageFile;
        isFirstImageSelected = true;
        logoImageFileName = p.basename(imageFile.path);
        logoExistingId = null;
      } catch (e) {
        var s = 1;
      }
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

      File imageFile = new File('');

      if (imageLogo!.path.isNotEmpty) {
        mainImageFile = imageFile = File(imageLogo!.path);
      }

      var base64val1 =
          "data:image/png;base64," + base64Encode(imageFile.readAsBytesSync());
      // print('base64:'+base64val1);
      isServerStoredLogo = false;
      logoImageBase64 = base64val1;
      logoCroppedImage = imageFile;
      isFirstImageSelected = true;
      logoImageFileName = p.basename(imageFile.path);
      logoExistingId = null;
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
        removeSelectedImage();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
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
        "RefID": (selectedCardID).toString(),
        "RefTypeID": (4).toString(),
        "SlNo": (4).toString(),
        "FileRef": logoImageBase64
      };
      APIBooleanResponse resp = await api.removeImage(queryParams: req);
      if (resp.isSuccess ?? false) {
        Get.snackbar('Success', "Image removed successfully!",
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

  onTapTxtBtnConfirm() {
    saveLinks();
  }
}
