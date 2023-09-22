import 'dart:convert';
import 'dart:math';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/models/deleteGreeting/post_delete_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
    as htmlwidget;
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:digitalcardsgaammabytes/core/utils/progress_dialog_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/createGreeting/post_create_greeting_resp.dart';
import '../../data/models/driveImages/drive_file_images_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../data/models/getCreateGreeting/get_get_create_greeting_resp.dart';
import '../../helper/constants.dart';
import '../my_e_greeting_cards_screen/widgets/uploaded_images_widget.dart';

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
  TextEditingController _hex_Controller = new TextEditingController();
  int contentPosition = 0;
  TextEditingController _searchController = new TextEditingController();
  Color? currentColor;
  Color pickerColor = Color(0xff443a49);
  ImagePicker _picker = new ImagePicker();
  int? currentindex;
  bool isFirstImageSelected = false;
  bool isSecondImageSelected = false;
  XFile? imageFirst;
  Random random = new Random();
  XFile? imageSecond;
  File? firstCroppedImage;
  File? secondCroppedImage;
  String? firstImageBase64;
  String? secondImageBase64;
  String? firstImageFileName;
  String? secondImageFileName;
  int? logoExistingId;
  int? pictureExistingId;
  String editorColorHex = "#ffffff";
  bool isServerStoredLogo = false;
  bool isServerStoredBackground = false;
  String? createDateString;
  String? lastEditDateString;
  String? hexColor;
  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  ApiClient api = new ApiClient();
  var greetingType = Get.arguments["Type"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var greetingCardTypeName = Get.arguments["TypeName"] as String?;
  String templateName = "";
  String? captionDefault = "";
  String? messageDefault = "";

  List<DriveFilesData> allUserImages = [];
  List<DriveFilesData> userImages = [];
  String logoPositionName = "lbl_select_logo_position".tr;
  String? senderDefault = "";
  bool? isUserDefinedBackground = false;
  String templateID = "";
  String? languageID = "";
  int? logoPosition=0;
  bool isBackgroundColor = false;
  @override
  void initState() {
    if (selectedCardID != 0) {
      getCardDetails();
    }
    getUserImages();
    _message_Controller.text = "lbl_click_update".tr;
    _caption_Controller.text = "lbl_click_update".tr;
    _sender_Controller.text = "lbl_click_update".tr;
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
                child: MoreOptionMenu(
                  isGreeting: true,
                )),
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
                                              onTap: onTapContrast9),
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
                                    text:
                                        "lbl_greeting_details".tr.toUpperCase(),
                                    margin: getMargin(left: 30, top: 0))
                              ])))
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
                                      : "lbl_template".tr + templateName,
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

                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: getMargin(
                                          top: 15,
                                        ),
                                        child: Text("lbl_Edit_Greeting".tr,
                                            style: AppStyle
                                                .txtNotoSerifTeluguRegular12)),
                                    GestureDetector(
                                        child: Row(children: [
                                          CustomTextFormField(
                                              width: 285,
                                              isEnabled: false,
                                              focusNode: FocusNode(),
                                              controller: _caption_Controller,
                                              hintText: "lbl_caption".tr,
                                              textInputType: TextInputType.text,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              margin: getMargin(top: 5)),
                                          IconButton(
                                              onPressed: () {
                                                goToHTMLEditor(0);
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 97, 8, 8),
                                              )),
                                        ]),
                                        onTap: () {
                                          goToHTMLEditor(0);
                                        }),
                                  ]),

                              Visibility(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: getMargin(
                                          top: 15,
                                        ),
                                        child: Text("lbl_message".tr,
                                            style: AppStyle
                                                .txtNotoSerifTeluguRegular12)),
                                    GestureDetector(
                                        child: Row(children: [
                                          CustomTextFormField(
                                              width: 285,
                                              fontStyle: TextFormFieldFontStyle
                                                  .NunitoSansRegular14,
                                              focusNode: FocusNode(),
                                              isEnabled: false,
                                              controller: _message_Controller,
                                              hintText: "lbl_message".tr,
                                              margin: getMargin(top: 10)),
                                          IconButton(
                                              onPressed: () {
                                                goToHTMLEditor(1);
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 97, 8, 8),
                                              )),
                                        ]),
                                        onTap: () {
                                          goToHTMLEditor(1);
                                        }),
                                  ],
                                ),
                                visible: false,
                              ),
                              Visibility(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: getMargin(
                                          top: 15,
                                        ),
                                        child: Text("lbl_sender".tr,
                                            style: AppStyle
                                                .txtNotoSerifTeluguRegular12)),
                                    GestureDetector(
                                        child: Row(children: [
                                          CustomTextFormField(
                                              width: 285,
                                              isEnabled: false,
                                              focusNode: FocusNode(),
                                              controller: _sender_Controller,
                                              hintText: "lbl_sender".tr,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              margin: getMargin(
                                                  top: 10, bottom: 10)),
                                          IconButton(
                                              onPressed: () {
                                                goToHTMLEditor(2);
                                              },
                                              padding: getPadding(all: 0),
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 97, 8, 8),
                                              ))
                                        ]),
                                        onTap: () {
                                          goToHTMLEditor(2);
                                        }),
                                  ],
                                ),
                                visible: false,
                              ),

                              Visibility(
                                child: Padding(
                                  padding: getPadding(left: 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(bottom: 0),
                                            child: Text("lbl_background".tr,
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
                                          width: 50,
                                        ),
                                        ToggleSwitch(
                                          minWidth: 110.0,
                                          initialLabelIndex: currentindex ?? 0,
                                          cornerRadius: 10.0,
                                          activeFgColor: Colors.white,
                                          inactiveBgColor: Color.fromARGB(
                                              255, 255, 245, 232),
                                          inactiveFgColor:
                                              ColorConstant.pink900,
                                          totalSwitches: 2,
                                          labels: [
                                            (!(isUserDefinedBackground ?? false)
                                                ? "lbl_image".tr
                                                : "lbl_image".tr),
                                            "lbl_color".tr
                                          ],
                                          icons: [
                                            Icons.image,
                                            Icons.color_lens_rounded
                                          ],
                                          activeBgColors: [
                                            [ColorConstant.pink900],
                                            [ColorConstant.pink900]
                                          ],
                                          // customTextStyles: [TextStyle(fontSize: )],
                                          onToggle: (index) {
                                            currentindex = index;
                                            switchImageColor();
                                          },
                                        ),
                                      ]),
                                ),
                                visible: (true),
                              ),

                              SizedBox(
                                height: 5,
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
                                            width: 5,
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
                                              width: 130,
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
                                            width: 10,
                                          ),
                                          CustomButton(
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
                                                            actions: <Widget>[
                                                              ElevatedButton(
                                                                child: const Text(
                                                                    'Cancel'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              ElevatedButton(
                                                                child:Text(
                                                              "lbl_select".tr),
                                                                onPressed: () {
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
                                                color: Colors.white,
                                              ),
                                              margin: getMargin(top: 0),
                                              // prefixWidget: Icon(Icons.color_lens_rounded,color: Colors.white,),
                                              variant: ButtonVariant
                                                  .OutlineBlack9003f,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding:
                                                  ButtonPadding.PaddingBottom9,
                                              fontStyle: ButtonFontStyle
                                                  .InterSemiBold14,
                                              alignment: Alignment.topRight)
                                        ])),
                                    visible: isBackgroundColor,
                                  )),
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
                                visible: templateID == "-1",
                              ),
                              Visibility(
                                  child: Padding(
                                      padding: getPadding(left: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 0),
                                                child: Text(
                                                    "lbl_content_position".tr,
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
                                              width: 20,
                                            ),
                                            CustomButton(
                                              onTap: () {
                                                setState(() {
                                                  contentPosition = 1;
                                                });
                                              },
                                              width: 75,
                                              text: ("Top"),
                                              variant: contentPosition == 1
                                                  ? ButtonVariant
                                                      .OutlineBlack9003f
                                                  : ButtonVariant
                                                      .OutlineBlack9003f_1,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding: ButtonPadding.PaddingT9,
                                              fontStyle: contentPosition == 1
                                                  ? ButtonFontStyle
                                                      .NunitoSansBlack12Reg
                                                  : ButtonFontStyle
                                                      .NunitoSansBold12,
                                              alignment: Alignment.topCenter,
                                              prefixWidget: Container(
                                                margin: getMargin(right: 10),
                                                child: Icon(
                                                  (Icons.arrow_circle_up),
                                                  color: contentPosition == 1
                                                      ? Colors.white
                                                      : ColorConstant.pink900,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CustomButton(
                                              onTap: () {
                                                setState(() {
                                                  contentPosition = 2;
                                                });
                                              },
                                              width: 90,
                                              text: ("Bottom"),
                                              variant: contentPosition == 2
                                                  ? ButtonVariant
                                                      .OutlineBlack9003f
                                                  : ButtonVariant
                                                      .OutlineBlack9003f_1,
                                              shape: ButtonShape.RoundedBorder5,
                                              padding: ButtonPadding.PaddingT9,
                                              fontStyle: contentPosition == 2
                                                  ? ButtonFontStyle
                                                      .NunitoSansBlack12Reg
                                                  : ButtonFontStyle
                                                      .NunitoSansBold12,
                                              alignment: Alignment.topCenter,
                                              prefixWidget: Container(
                                                margin: getMargin(right: 10),
                                                child: Icon(
                                                  (Icons
                                                      .arrow_circle_down_outlined),
                                                  color: contentPosition == 2
                                                      ? Colors.white
                                                      : ColorConstant.pink900,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ])),
                                  visible: templateID == "-1" && currentindex==0),
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
                                          width: 105,
                                        ),
                                        GestureDetector(
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
                                            width: 130,
                                            text: (isFirstImageSelected
                                                ? "lbl_logo_selected".tr
                                                : "lbl_select_logo".tr),
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
                                          variant:
                                              ButtonVariant.OutlineBlack9003f_1,
                                          shape: ButtonShape.RoundedBorder15,
                                          fontStyle:
                                              ButtonFontStyle.NunitoSansBold14,
                                          onTap: () {
                                            showAlertDialog(
                                                context, UserImageType.logo);
                                          },
                                        ),
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
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(bottom: 0),
                                            child: Text("lbl_logo_position".tr,
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
                                          width: 35,
                                        ),
                                        CustomButton(
                                          height: 40,
                                          width: 180,
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
                                        ),
                                      ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 2, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
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
                                visible: !(createDateString == null ||
                                    createDateString!.isEmpty),
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
                onNextClicked: createGreeting,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapSelecttemplateOne() {
    Get.toNamed(AppRoutes.selectTemplateScreen, arguments: {
      "isGreeting": true,
      "type": greetingType,
      "existingTemplateID": templateID,
      "cardSubType": 0
    })?.then((value) {
      templateID = value['selectedTemplateID'];
      setState(() {
        if (templateID == "-1") contentPosition = 1;
        templateName = value['selectedTemplateName'];

        editorColorHex = value['editorColorHex'];
        captionDefault = value['captionDefault'];

        messageDefault = value['messageDefault'];

        senderDefault = value['senderDefault'];
        languageID = value['languageID'];
        var templogoPosition = value['logoPosition'] as int?;
        setLogoPosition(templogoPosition ?? 0, isClosePopup: false);
        currentindex = 0;
        removeSelectedImage(UserImageType.background, true);

        isUserDefinedBackground = value['isUserBackground'] as bool?;
        // isBackgroundColor = (isUserDefinedBackground ?? false) ? false : true;
      });
    });
  }

  getUserImages() async {
    try {
      var req = {"UserId": GlobalVariables.userID, "Anywhere": ""};
      GetDriveFileImagesResp resp = await api.getUserImages(context, queryParams: req);
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
                      //         itemCount: userImages!.length,
                      //         itemBuilder: (context, index) {
                      //           DriveFilesData model = userImages![index];
                      //           return UploadedImageWidget(model, false);
                      //         })),
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
      if (pictureType.value == 1) {
        logoExistingId = image.id;
        firstImageBase64 = null;
        firstImageFileName = null;
        isFirstImageSelected = true;
      } else {
        pictureExistingId = image.id;
        secondImageBase64 = null;
        secondImageFileName = null;
        isSecondImageSelected = true;
      }
    });
    Navigator.pop(context);
  }

  cropSelectedImageForCard(DriveFilesData image, UserImageType pictureType) {
    setState(() {
      if (pictureType.value == 1) {
        logoExistingId = null;
        isFirstImageSelected = true;
      } else {
        pictureExistingId = null;
        isSecondImageSelected = true;
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

  switchImageColor() {
    setState(() {
      isBackgroundColor = currentindex != 0;
      if (currentindex != 0) {
        removeSelectedImage(UserImageType.background, true);
      } else {
        currentColor = null;
      }
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

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ' + url;
    }
  }

  clickOrSelectImage(String type, UserImageType pictureType) async {
    Navigator.of(context).pop();
    if (pictureType == UserImageType.logo) {
      if (isServerStoredLogo) removeImage(pictureType, true);
    } else {
      if (isServerStoredBackground) removeImage(pictureType, true);
    }
    if (type == "Gallery") {
      if (pictureType == UserImageType.logo)
        imageFirst = await _picker.pickImage(source: ImageSource.gallery);
      else
        imageSecond = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      if (pictureType == UserImageType.logo)
        imageFirst = await _picker.pickImage(source: ImageSource.camera);
      else
        imageSecond = await _picker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (imageFirst != null && pictureType.value == 1)
        isFirstImageSelected = true;
      if (imageSecond != null && pictureType.value == 2)
        isSecondImageSelected = true;
    });
    File imageFile = new File('');

    if (pictureType.value == 1 && imageFirst!.path.isNotEmpty)
      imageFile = File(imageFirst!.path);
    if (pictureType.value == 2 && imageSecond!.path.isNotEmpty)
      imageFile = File(imageSecond!.path);

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
        if (pictureType.value == 1) {
          firstImageBase64 = base64val1;
          firstCroppedImage = imageFile;
          isFirstImageSelected = true;
          firstImageFileName = p.basename(imageFile.path);
          logoExistingId = null;
        }
        if (pictureType.value == 2) {
          secondImageBase64 = base64val1;
          secondCroppedImage = imageFile;
          isSecondImageSelected = true;
          secondImageFileName = p.basename(imageFile.path);
          pictureExistingId = null;
        }
      } catch (e) {
        var s = 1;
      }
    });
  }

  removeImage(UserImageType pictureType, bool isToggledToCardColor) async {
    try {
      var req = {
        "RefID": (selectedCardID).toString(),
        "RefTypeID": (pictureType == UserImageType.logo ? 6 : 5).toString(),
        "SlNo": (pictureType == UserImageType.logo ? 6 : 5).toString(),
        "FileRef": pictureType.value == 1 ? firstImageBase64 : secondImageBase64
      };
      APIBooleanResponse resp = await api.removeImage(context,queryParams: req);
      if (resp.isSuccess ?? false) {
        if (!isToggledToCardColor) {
          Get.snackbar(
              "lbl_success".tr,
              (pictureType.value == 1 ? "Logo" : "Background") +
                  " image removed successfully!",
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

  removeSelectedImage(UserImageType pictureType, bool isToggledToCardColor) {
    setState(() {
      if (pictureType.value == 1) {
        logoExistingId = null;
        imageFirst = null;

        isFirstImageSelected = false;
        if (isServerStoredLogo) {
          removeImage(pictureType, isToggledToCardColor);
        }
      }
      if (pictureType.value == 2) {
        imageSecond = null;
        pictureExistingId = null;
        isSecondImageSelected = false;
        if (isServerStoredBackground) {
          removeImage(pictureType, isToggledToCardColor);
        }
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

  onTapSelectimageOne() {
    Navigator.of(context).pushNamed(AppRoutes.imageModifyScreen);
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast9() {
    Navigator.of(context).pushNamed(AppRoutes.eGreetingCardOptionsScreen);
  }

  goToHTMLEditor(int initialIndex) {
    // GlobalVariables.tempCaptionContent = captionDefault??"";
    // GlobalVariables.tempMessageContent = messageDefault??"";
    // GlobalVariables.tempSenderContent = senderDefault??"";

    Get.toNamed(AppRoutes.htmlEditor, arguments: {
      "initialIndex": initialIndex,
      "captionContent": captionDefault,
      "messageContent": messageDefault,
      "senderContent": senderDefault,
      "templateID": templateID,
      "greetingType": greetingType,
      "backgroundColor": editorColorHex,
    })?.then((value) {
      var messageContent = value['messageContent'];
      var captionContent = value['captionContent'];
      var senderContent = value['senderContent'];
      setState(() {
        messageDefault = messageContent;
        captionDefault = captionContent;
        senderDefault = senderContent;
      });
    });
    // Navigator.of(context).pushNamed(AppRoutes.htmlEditor).then((value) => null);
  }

  createGreeting() async {
    try {
      var captionUpdated = captionDefault!.replaceAll('"', '\"');
      var messageUpdated = messageDefault!.replaceAll('"', '\"');
      var senderUpdated = senderDefault!.replaceAll('"', '\"');
      var req = {
        "UserIdString": GlobalVariables.userID,
        "Id": selectedCardID,
        "TypeID": greetingType.toString(),
        "LanguageID": languageID,
        "TemplateID": templateID,
        "GreetingStatus": selectedCardID == 0 ? 1 : 1,
        "Caption": captionUpdated,
        "Message": messageUpdated,
        "Sender": senderUpdated,
        "LogoPosition": logoPosition.toString(),
        "ContentPosition": contentPosition.toString(),
        "BackgroundColorHex": hexColor ?? "",
        "BackgroundColor": "0",
        "IsBackgroundImage": (!isBackgroundColor).toString(),
        "UserPicture": isUserDefinedBackground.toString(),
        "LogoRef": firstImageFileName ?? '',
        "PictureRef": secondImageFileName ?? '',
        "Logo": firstImageBase64 ?? '',
        "Picture": secondImageBase64 ?? '',
        "LogoOldId": logoExistingId ?? '',
        "PictureOldId": pictureExistingId ?? '',
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };

      PostCreateGreetingResp resp =
          await api.createCreateGreeting(context,requestData: req);
      if (resp.isSuccess ?? false) {
        selectedCardID = resp.result;
        Get.snackbar("lbl_success".tr,"lbl_greeting_saved".tr,
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
        }).then((value) {
          if (selectedCardID != 0) {
            getCardDetails();
          }
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString());
      }
    } catch (e) {
      Get.snackbar("lbl_error".tr, e.toString());
    }
  }

  getCardDetails() async {
    ProgressDialogUtils.showProgressDialog(context);
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "GreetingID": selectedCardID.toString(),
        "GreetingType": greetingType.toString(),
        "LanguageId":GlobalVariables.currentLanguage
      };
      GetGetCreateGreetingResp resp =
          await api.fetchGetCreateGreeting(context,queryParams: req);
      ProgressDialogUtils.hideProgressDialog(context);
      if (resp.isSuccess ?? false) {
        setState(() {
          captionDefault = resp.result?.greetingDetailsData?.caption;

          messageDefault = resp.result?.greetingDetailsData?.message;

          senderDefault = resp.result?.greetingDetailsData?.sender;
          templateName = resp.result?.greetingDetailsData?.templateName;
          templateID =
              resp.result?.greetingDetailsData?.templateID.toString() ?? '';

          greetingCardTypeName =
              resp.result?.greetingDetailsData?.typeIDName.toString() ?? '';
          firstImageFileName =
              (resp.result?.greetingDetailsData?.logoRef ?? '').toString();
          if ((firstImageFileName ?? '').trim().isNotEmpty) {
            isFirstImageSelected = true;
            if ((resp.result?.greetingDetailsData?.logo ?? '')
                .toString()
                .contains("http")) {
              firstImageBase64 =
                  (resp.result?.greetingDetailsData?.logo ?? '').toString();
              isServerStoredLogo = true;
            }
          }
          secondImageFileName =
              (resp.result?.greetingDetailsData?.pictureRef ?? '').toString();
          if ((secondImageFileName ?? '').trim().isNotEmpty) {
            isSecondImageSelected = true;
            if ((resp.result?.greetingDetailsData?.picture ?? '')
                .toString()
                .contains("http")) {
              secondImageBase64 =
                  (resp.result?.greetingDetailsData?.picture ?? '').toString();
              isServerStoredBackground = true;
            }
          }
          isUserDefinedBackground =
              (resp.result?.greetingDetailsData?.userPicture);
          isBackgroundColor =
              !(resp.result?.greetingDetailsData?.isBackgroundImage ?? false);
          editorColorHex =
              (resp.result?.greetingDetailsData?.editorColorHex ?? '')
                  .toString();
          if (isBackgroundColor) {
            currentindex = 1;
            pickerColor = currentColor = fromHex(hexColor ?? '');
          }
          logoExistingId = resp.result?.greetingDetailsData?.logoOldId;
          pictureExistingId = resp.result?.greetingDetailsData?.pictureOldId;
          languageID =
              (resp.result?.greetingDetailsData?.languageID).toString();
          contentPosition =
              (resp.result?.greetingDetailsData?.contentPosition ?? 0);
          var templogoPosition =
              (resp.result?.greetingDetailsData?.logoPosition ?? 0);
          setLogoPosition(templogoPosition, isClosePopup: false);
          createDateString = (resp
                  .result?.greetingDetailsData?.creditExpiryDateString
                  .toString() ??
              '');
          lastEditDateString = (resp
                  .result?.greetingDetailsData?.lastEditedDateString
                  .toString() ??
              '');
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString());
      }
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog(context);
    }
  }

  setLogoPosition(int position, {bool isClosePopup = true}) {
    setState(() {
      logoPosition = position;
      switch (logoPosition) {
        case 0:
          logoPositionName = "lbl_select_logo_position".tr;
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
}
