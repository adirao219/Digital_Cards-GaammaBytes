import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/createCard/post_create_card_resp.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/driveImages/drive_file_images_resp.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../my_e_greeting_cards_screen/widgets/uploaded_images_widget.dart';

class AdvancedScreen extends StatefulWidget {
  const AdvancedScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdvancedScreen createState() => _AdvancedScreen();
}

class _AdvancedScreen extends State<AdvancedScreen> {
  TextEditingController _searchController = new TextEditingController();
  ImagePicker _picker = new ImagePicker();
  var cardType = Get.arguments["cardType"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardSubtypeID = Get.arguments["cardSubtypeID"] as int?;
  var templateId = Get.arguments["templateId"] as String?;
  var cardTypeName = Get.arguments["cardTypeName"] as String?;
  var templateName = Get.arguments["templateName"] as String?;
  var cardSubTypeName = Get.arguments["cardSubTypeName"] as String?;
  var isPublishAvailable = Get.arguments["isPublishAvailable"] as bool?;
  var bandID = Get.arguments["BandId"] as int?;
  var cardName = Get.arguments["cardName"] as String?;
  var mainResult = Get.arguments["cardDetails"] as GetCardResult?;
  bool removeFromgoogleSearch = true;
  DateTime? selectedDate;
  TextEditingController _card_description_Controller =
      new TextEditingController();
  TextEditingController _html_title_Controller = new TextEditingController();
  TextEditingController _meta_description_Controller =
      new TextEditingController();
  TextEditingController _expirydate_Controller = new TextEditingController();
  TextEditingController _expiry_action_link_controller =
      new TextEditingController();
  ApiClient api = new ApiClient();
  List<Result> allItems = [];
  String? selectedItemID;
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
    getDropdownItems();
    super.initState();
  }

  updateExistingData() {
    setState(() {
      selectedItemID = mainResult?.afterExpiryAction == null
          ? null
          : mainResult?.afterExpiryAction?.toString();
      _expiry_action_link_controller.text =
          mainResult?.afterExpiryActionLink?.toString() ?? '';
      removeFromgoogleSearch = mainResult?.removeFromGoogleSearch ?? false;
      _expirydate_Controller.text = mainResult?.expiryDateString ?? '';
      _card_description_Controller.text = mainResult?.headerData1 ?? '';
      _html_title_Controller.text = mainResult?.headerData2 ?? '';
      _meta_description_Controller.text = mainResult?.headerData3 ?? '';
      logoImageFileName = mainResult?.thumbnailImageRef ?? '';
      logoImageBase64 = mainResult?.thumbnailImage ?? '';
      if (logoImageBase64!.isNotEmpty && logoImageFileName!.isNotEmpty) {
        isFirstImageSelected = true;
        if (logoImageBase64!.startsWith("http")) {
          isServerStoredLogo = true;
        }
      }
    });
  }

  getDropdownItems() async {
    try {
      var req = {"LanguageId": GlobalVariables.currentLanguage};
      CommonDropdownResp resp = await api.fetchAfterExpiryList(context,queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          allItems = resp.result ?? [];
        });
        if (mainResult != null) {
          updateExistingData();
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
    } catch (e) {}
  }

  saveCardMain() async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "Name": cardName,
        "ExpiryDate": _expirydate_Controller.text,
        "AfterExpiryAction": selectedItemID,
        "AfterExpiryActionLink": _expiry_action_link_controller.text,
        "RemoveFromGoogleSearch": removeFromgoogleSearch,
        "ThumbnailImage": logoImageBase64,
        "ThumbnailImageRef": logoImageFileName,
        "ThumbnailImageOldId": logoExistingId,
        "HeaderData1": _card_description_Controller.text,
        "HeaderData2": _html_title_Controller.text,
        "HeaderData3": _meta_description_Controller.text,
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      PostSaveResp resp = await api.saveCardAdvance(context, requestData: req);
      if (resp.isSuccess ?? false) {
        selectedCardID = resp.result;
        Get.snackbar("lbl_success".tr, "lbl_card_saved".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        Navigator.pop(context);
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
                              left: 38, top: 44, right: 129, bottom: 6),
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
                                              svgPath:
                                                  ImageConstant.imgContrast),
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
                                    text: "lbl_advanced".tr,
                                    margin: getMargin(left: 56, top: 15))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_28),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 10, right: 24, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_card_name_ex".tr + (cardName ?? ''),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold18),
                      Container(
                          margin: getMargin(top: 20, right: 8),

                          // decoration: AppDecoration.outlineBlack9003f4.copyWith(
                          //     borderRadius: BorderRadiusStyle.roundedBorder15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: getMargin(bottom: 1),
                                    // decoration:
                                    //     AppDecoration.txtOutlineBlack9003f1,
                                    child: Text("msg_remove_from_google".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtNunitoSansRegular16Pink900
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.36)))),
                                Switch(
                                  // thumb color (round icon)
                                  activeColor: ColorConstant.pink900,
                                  activeTrackColor: ColorConstant.deepOrange100,
                                  inactiveThumbColor: Colors.blueGrey.shade600,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  splashRadius: 50.0,
                                  // boolean variable value
                                  value: removeFromgoogleSearch,
                                  // changes the state of the switch
                                  onChanged: (value) => setState(
                                      () => removeFromgoogleSearch = value),
                                ),
                              ])),
                      Visibility(
                          child: GestureDetector(
                            child: CustomTextFormField(
                                width: 326,
                                focusNode: FocusNode(),
                                isEnabled: false,
                                controller: _expirydate_Controller,
                                hintText: "lbl_expiry_date".tr,
                                margin: getMargin(top: 10)),
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                          visible: ((cardType ?? 0) == 2)),
                      Visibility(
                          child: Container(
                              margin: getMargin(top: 15),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                // Initial Value
                                value: selectedItemID,
                                icon: selectedItemID == null
                                    ? Icon(Icons.keyboard_arrow_down)
                                    : GestureDetector(
                                        child: Icon(Icons.remove),
                                        onTap: () {
                                          setState(() {
                                            if (selectedItemID != null)
                                              selectedItemID = null;
                                          });
                                        },
                                      ),
                                hint: Text(
                                  ('lbl_expiry_action'.tr),
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
                                ),
                                // Array list of items
                                items: allItems!.map((items) {
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
                                    selectedItemID = newValue;
                                  });
                                  //  getTemplate(newValue ?? "");
                                },
                              )),
                          visible: ((cardType ?? 0) == 2)),
                      Visibility(
                        child: CustomTextFormField(
                            width: 326,
                            controller: _expiry_action_link_controller,
                            hintText: "lbl_redirect_link".tr,
                            textInputType: TextInputType.emailAddress,
                            margin: getMargin(top: 15)),
                        visible: ((selectedItemID ?? '') == "2" &&
                            ((cardType ?? 0) == 2)),
                      ),
                      CustomTextFormField(
                          width: 326,
                          controller: _card_description_Controller,
                          hintText: "lbl_card_description".tr,
                          textInputType: TextInputType.visiblePassword,
                          margin: getMargin(top: 20)),
                      CustomTextFormField(
                          width: 326,
                          controller: _html_title_Controller,
                          hintText: "lbl_html_title".tr,
                          textInputType: TextInputType.visiblePassword,
                          margin: getMargin(top: 23)),
                      CustomTextFormField(
                          width: 326,
                          controller: _meta_description_Controller,
                          textInputType: TextInputType.visiblePassword,
                          hintText: "lbl_meta_description".tr,
                          margin: getMargin(top: 23)),
                      Container(
                        margin: getMargin(
                          top: 23,
                        ),
                        child: Text("lbl_thumbnail_image".tr,
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
                                  : "lbl_select_image".tr),
                              variant: ButtonVariant.OutlineBlack9003f,
                              shape: ButtonShape.RoundedBorder5,
                              padding: ButtonPadding.PaddingT9,
                              fontStyle: ButtonFontStyle.NunitoSansBlack12,
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
                            variant: ButtonVariant.OutlineBlack9003f_1,
                            shape: ButtonShape.RoundedBorder15,
                            fontStyle: ButtonFontStyle.NunitoSansBold14,
                            onTap: () {
                              showAlertDialog(context);
                            },
                          ),
                        ],
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
                                  margin: getMargin(top: 40),
                                  padding: ButtonPadding.PaddingT9,
                                  onTap: onTapTxtBtnConfirm),
                            ],
                          ),
                        ],
                      )
                    ]))));
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
      isFirstImageSelected = true;
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

    gotoImageModify(imageFile, UserImageType.logo);
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
        "RefTypeID": (9).toString(),
        "SlNo": (9).toString(),
        "FileRef": logoImageBase64
      };
      APIBooleanResponse resp =
          await api.removeImage(context, queryParams: req);
      if (resp.isSuccess ?? false) {
        Get.snackbar("lbl_success".tr, "lbl_image_removed".tr,
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
        _expirydate_Controller.text = formattedDate;
      });
    }
  }

  onTapTxtBtnConfirm() {
    saveCardMain();
  }
}
