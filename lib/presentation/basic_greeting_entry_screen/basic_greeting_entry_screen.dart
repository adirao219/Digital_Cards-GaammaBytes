import 'dart:convert';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/createGreeting/post_create_greeting_resp.dart';
import '../../data/models/getCreateGreeting/get_get_create_greeting_resp.dart';

class BasicGreetingEntryScreen extends StatefulWidget {
  const BasicGreetingEntryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BasicGreetingEntryScreen createState() => _BasicGreetingEntryScreen();
}

class _BasicGreetingEntryScreen extends State<BasicGreetingEntryScreen> {
  TextEditingController _template_Controller = new TextEditingController();
  TextEditingController _caption_Controller = new TextEditingController();
  TextEditingController _message_Controller = new TextEditingController();
  TextEditingController _sender_Controller = new TextEditingController();
  TextEditingController _card_color_Controller = new TextEditingController();

  Color? currentColor;
  Color pickerColor = Color(0xff443a49);
  ImagePicker _picker = new ImagePicker();

  bool isFirstImageSelected = false;
  bool isSecondImageSelected = false;
  XFile? imageFirst;
  XFile? imageSecond;
  File? firstCroppedImage;
  File? secondCroppedImage;
  String? firstImageBase64;
  String? secondImageBase64;
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  ApiClient api = new ApiClient();
  var greetingType = Get.arguments["Type"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var greetingCardTypeName = Get.arguments["TypeName"] as String?;
  String templateName = "";

  bool? isUserDefinedBackground;
  String templateID = "";
  @override
  void initState() {
    if (selectedCardID != 0) {
      getCardDetails();
    }
    super.initState();
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
                                          onTap: onTapContrast9),
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
                                text: "lbl_card_details".tr.toUpperCase(),
                                margin: getMargin(left: 54, top: 14))
                          ]))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_22),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 28, right: 23),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 15),
                                      child: Text(
                                          ("msg_card_type_ex_new3".tr) +
                                              (greetingCardTypeName ?? ''),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNunitoBold18))),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: templateName.isEmpty
                                      ? "lbl_select_template".tr
                                      : "Template: " + templateName,
                                  margin: getMargin(top: 22),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapSelecttemplateOne),
                              // CustomTextFormField(
                              //     width: 326,
                              //     focusNode: FocusNode(),
                              //     controller: _template_Controller,
                              //     hintText: "lbl_template".tr,
                              //     margin: getMargin(top: 30)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _caption_Controller,
                                  hintText: "lbl_caption".tr,
                                  textInputType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  margin: getMargin(top: 19)),
                              Row(
                                children: [
                                  CustomTextFormField(
                                      width: 285,
                                      maxLines: 4,
                                      focusNode: FocusNode(),
                                      controller: _message_Controller,
                                      hintText: "lbl_message".tr,
                                      margin: getMargin(top: 19)),
                                  IconButton(
                                      onPressed: goToHTMLEditor,
                                      icon: Icon(
                                        Icons.edit,
                                        color: Color.fromARGB(255, 97, 8, 8),
                                      ))
                                ],
                              ),

                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _sender_Controller,
                                  hintText: "lbl_sender".tr,
                                  textCapitalization: TextCapitalization.words,
                                  margin: getMargin(top: 19, bottom: 10)),
                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(bottom: 0),
                                            child: Text("lbl_logo".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansRegular14
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36),
                                                        height: getVerticalSize(
                                                            1.26)))),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            onTapSelectimage(1);
                                          },
                                          child: CustomButton(
                                            width: 140,
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
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomButton(
                                            onTap: () {
                                              removeSelectedImage(1);
                                            },
                                            height: 23,
                                            width: 20,
                                            // text: "lbl_remove".tr,
                                            variant:
                                                ButtonVariant.OutlineBlack9003f,
                                            shape: ButtonShape.RoundedBorder5,
                                            padding: ButtonPadding.PaddingT9,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBlack12,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 0),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgDelete)))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Visibility(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 0),
                                              child: Text("lbl_background".tr,
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
                                            width: 30,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              onTapSelectimage(2);
                                            },
                                            child: CustomButton(
                                              width: 140,
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
                                            width: 20,
                                          ),
                                          CustomButton(
                                              onTap: () {
                                                removeSelectedImage(2);
                                              },
                                              height: 23,
                                              width: 20,
                                              // text: "lbl_remove".tr,
                                              variant: ButtonVariant
                                                  .OutlineBlack9003f,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding: ButtonPadding.PaddingT9,
                                              fontStyle: ButtonFontStyle
                                                  .NunitoSansBlack12,
                                              prefixWidget: Container(
                                                  margin: getMargin(right: 0),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgDelete)))
                                        ]),
                                    visible: isUserDefinedBackground ?? false,
                                  )),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 2, top: 0),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              // Container(
                              //     // height: getVerticalSize(52.00),
                              //     width: getHorizontalSize(326.00),
                              //     margin: getMargin(left: 2, top: 0),
                              //     child: Row(children: [
                              //       Text("lbl_card_color".tr,
                              //           overflow: TextOverflow.ellipsis,
                              //           textAlign: TextAlign.left,
                              //           style: AppStyle.txtNunitoSansRegular14
                              //               .copyWith(
                              //                   letterSpacing:
                              //                       getHorizontalSize(0.36),
                              //                   height: getVerticalSize(1.26))),
                              //       SizedBox(
                              //         width: 40,
                              //       ),
                              //       CustomButton(
                              //           customColor: currentColor,
                              //           onTap: () {
                              //             showDialog(
                              //                 context: context,
                              //                 builder: (ctx) => AlertDialog(
                              //                         title: const Text(
                              //                             'Pick a color!'),
                              //                         content:
                              //                             SingleChildScrollView(
                              //                           child: ColorPicker(
                              //                             pickerColor:
                              //                                 pickerColor,
                              //                             onColorChanged:
                              //                                 changeColor,
                              //                           ),
                              //                         ),
                              //                         actions: <Widget>[
                              //                           ElevatedButton(
                              //                             child: const Text(
                              //                                 'Select'),
                              //                             onPressed: () {
                              //                               setState(() =>
                              //                                   currentColor =
                              //                                       pickerColor);
                              //                               Navigator.of(
                              //                                       context)
                              //                                   .pop();
                              //                             },
                              //                           ),
                              //                         ]));
                              //           },
                              //           height: 20,
                              //           width: 80,
                              //           text: "",
                              //           suffixWidget: Icon(
                              //             Icons.color_lens_rounded,
                              //             color: Colors.white,
                              //           ),
                              //           margin: getMargin(top: 0),
                              //           // prefixWidget: Icon(Icons.color_lens_rounded,color: Colors.white,),
                              //           variant:
                              //               ButtonVariant.OutlineBlack9003f,
                              //           shape: ButtonShape.RoundedBorder5,
                              //           padding: ButtonPadding.PaddingBottom9,
                              //           fontStyle:
                              //               ButtonFontStyle.InterSemiBold14,
                              //           alignment: Alignment.topRight)
                              //     ])),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_next".tr,
                                  margin: getMargin(left: 40, top: 45),
                                  onTap: createGreeting),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                onNextClicked: createGreeting,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapSelecttemplateOne() {
    Get.toNamed(AppRoutes.selectTemplateScreen,
        arguments: {"isGreeting": true, "type": greetingType})?.then((value) {
      templateID = value['selectedTemplateID'];
      setState(() {
        templateName = value['selectedTemplateName'];

        isUserDefinedBackground = value['isUserBackground'] as bool?;
      });
    });
  }

  onTapSelectimage(int pictureType) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                title: const Text('Select Type!'),
                content: const SingleChildScrollView(
                    child: Text(
                        "You can select an image from gallery or click a picture using camera")),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Camera'),
                    onPressed: () {
                      clickOrSelectImage("Camera", pictureType);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Gallery'),
                    onPressed: () {
                      clickOrSelectImage("Gallery", pictureType);
                    },
                  ),
                ]));
  }

  clickOrSelectImage(String type, int pictureType) async {
    Navigator.of(context).pop();
    if (type == "Gallery") {
      if (pictureType == 1)
        imageFirst = await _picker.pickImage(source: ImageSource.gallery);
      else
        imageSecond = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      if (pictureType == 2)
        imageFirst = await _picker.pickImage(source: ImageSource.camera);
      else
        imageSecond = await _picker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (imageFirst != null && pictureType == 1) isFirstImageSelected = true;
      if (imageSecond != null && pictureType == 2) isSecondImageSelected = true;
    });
    File imageFile = new File('');

    if (pictureType == 1 && imageFirst!.path.isNotEmpty)
      imageFile = File(imageFirst!.path);
    if (pictureType == 2 && imageSecond!.path.isNotEmpty)
      imageFile = File(imageSecond!.path);
    Get.toNamed(AppRoutes.imageModifyScreen,
            arguments: {"imageFile": imageFile, "pictureType": pictureType})
        ?.then((value) {
      double? width = value['width'];
      double? height = value['height'];
      bool? isSquare = value['isSquare'];
      String? imageFilePath = value["refinedImagePath"] as String?;
      int? pictureType = value["pictureType"] as int?;

      imageFile = File(imageFilePath ?? '');
      var base64val1 =
          "data:image/png;base64," + base64Encode(imageFile.readAsBytesSync());
      // print('base64:'+base64val1);
      if (pictureType == 1) {
        firstImageBase64 = base64val1;
        firstCroppedImage = imageFile;
        isFirstImageSelected = true;
      }
      if (pictureType == 2) {
        secondImageBase64 = base64val1;
        secondCroppedImage = imageFile;
        isSecondImageSelected = true;
      }
    });
  }

  removeSelectedImage(int pictureType) {
    setState(() {
      if (pictureType == 1) {
        imageFirst = null;

        isFirstImageSelected = false;
      }
      if (pictureType == 2) {
        imageSecond = null;

        isSecondImageSelected = false;
      }
    });
  }

  onTapSelectimageOne() {
    Navigator.of(context).pushNamed(AppRoutes.imageModifyScreen);
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast9() {
    Navigator.of(context).pushNamed(AppRoutes.eGreetingCardOptionsScreen);
  }

  goToHTMLEditor() {
    Get.toNamed(AppRoutes.htmlEditor,
        arguments: {"currentContent": _message_Controller.text})?.then((value) {
      var htmlContent = value['htmlContent'];
      setState(() {
        _message_Controller.text = htmlContent;
      });
    });
    Navigator.of(context).pushNamed(AppRoutes.htmlEditor).then((value) => null);
  }

  createGreeting() async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "Id": selectedCardID,
        "TypeID": 9,
        "LanguageID": GlobalVariables.currentLanguage,
        "TemplateID": templateID,
        "GreetingStatus": selectedCardID == 0 ? 1 : 1,
        "Caption": _caption_Controller.text,
        "Message": _message_Controller.text,
        "Sender": _sender_Controller.text,
        "files": {"Logo": firstImageBase64, "Picture": secondImageBase64}
      };
      PostCreateGreetingResp resp =
          await api.createCreateGreeting(requestData: req);
      if (resp.isSuccess ?? false) {
        selectedCardID = resp.result;
        Get.snackbar('Success', "Greeting Created Successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));

        Navigator.of(context)
            .pushNamed(AppRoutes.customizationScreen, arguments: {
          "CardID": selectedCardID,
          "TypeName": greetingCardTypeName,
          "templateName": templateName
        });
      } else {
        Get.snackbar('Error', resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  getCardDetails() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "GreetingID": selectedCardID.toString(),
        "GreetingType": greetingType.toString(),
      };
      GetGetCreateGreetingResp resp =
          await api.fetchGetCreateGreeting(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          _caption_Controller.text = resp.result?.greetingDetailsData?.caption;

          _message_Controller.text = resp.result?.greetingDetailsData?.message;

          _sender_Controller.text = resp.result?.greetingDetailsData?.sender;
          templateName = resp.result?.greetingDetailsData?.templateName;
          templateID =
              resp.result?.greetingDetailsData?.templateID.toString() ?? '';
          greetingCardTypeName =
              resp.result?.greetingDetailsData?.typeIDName.toString() ?? '';
        });
      } else {
        Get.snackbar('Error', resp.errorMessage.toString());
      }
    } catch (e) {}
  }
}
