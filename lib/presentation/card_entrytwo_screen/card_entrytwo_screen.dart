import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/presentation/card_entrytwo_screen/widgets/card_entrytwo_item_widget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../core/utils/osm_map.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/createCard/post_create_card_resp.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../helper/constants.dart';
import 'models/card_entrytwo_item_model.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'models/card_entrytwo_model.dart';

class CardEntrytwoScreen extends StatefulWidget {
  const CardEntrytwoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardEntrytwoScreen createState() => _CardEntrytwoScreen();
}

class _CardEntrytwoScreen extends State<CardEntrytwoScreen> {
  Rx<CardEntrytwoModel> cardEntrytwoModelObj = CardEntrytwoModel().obs;
  TextEditingController _latitude_Controller = new TextEditingController();
  TextEditingController _longitude_Controller = new TextEditingController();
  TextEditingController _card_color_Controller = new TextEditingController();

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
  Color pickerColor = Color(0xff443a49);
  Color? currentColor;
  String? createDateString;
  String? lastEditDateString;
  String? cardURL;
  String? hexColor;
  MapController _mapController = MapController();
  ImagePicker _picker = new ImagePicker();
  ApiClient api = new ApiClient();
  LatLng? finalLocation;
  bool locationSelected = false;
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

  @override
  void initState() {
    if (mainResult != null) {
      updateExistingData();
    }
    getCurrentLocation();
    super.initState();
  }

  getCardData({bool showProgress = true}) async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "CardType": "0",
        "CardSubType": "0",
      };
      GetGetCreateCardResp resp = await api.fetchGetCreateCard(
          queryParams: req, showProgress: showProgress);
      if (resp.isSuccess ?? false) {
        setState(() {
          mainResult = resp.result;
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

  updateExistingData() {
    setState(() {
      if ((mainResult?.latitude ?? 0.00) != 0.00 &&
          (mainResult?.longitude ?? 0.00) != 0.0) {
        finalLocation =
            LatLng(mainResult?.latitude ?? 0.0, mainResult?.longitude ?? 0.0);
        _latitude_Controller.text = mainResult?.latitude!.toString() ?? '';
        _longitude_Controller.text = mainResult?.longitude!.toString() ?? '';
        locationSelected = true;
      }
      if (mainResult?.cardColorInHex != null &&
          mainResult?.cardColorInHex != "") {
        hexColor = (mainResult?.cardColorInHex);
        pickerColor = currentColor = fromHex(hexColor ?? '');
      }
      createDateString = mainResult?.createdDateString ?? '';
      lastEditDateString = mainResult?.lastEditDateString ?? '';
    });
  }

  getCurrentLocation() async {
    try {
      var checkpermission = await _handleLocationPermission();
      if (true) {
        //checkpermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          //  finalLocation = LatLng(position.latitude, position.longitude);
        });
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      // return false;
    }
    return true;
  }

  showPublishAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.pop(context);
        publishCard();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure you want to publish the card?"),
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
      APIResponse resp = await api.fetchPublish(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          isPublished = true;
          publishedURL = resp.result.toString();
        });
        Get.snackbar('Success', "Card Published successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
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

  saveCardMain() async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "Name": cardName,
        "Latitude": double.tryParse(_latitude_Controller.text),
        "Longitude": double.tryParse(_longitude_Controller.text),
        "CardColorInHex": hexColor ?? ''
      };
      PostSaveResp resp = await api.saveCardOtherData(requestData: req);
      if (resp.isSuccess ?? false) {
        selectedCardID = resp.result;
        Get.snackbar('Success', "Card Saved Successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        Navigator.of(context)
            .pushNamed(AppRoutes.customizationoneScreen, arguments: {
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
                            GestureDetector(
                              onTap: onTapBack,
                              child: Container(
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
                                            onTap: onTapContrast3),
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
                            ),
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
                styleType: Style.bgStyle_16),
            body: //SingleChildScrollView(child:
                Padding(
                    padding: getPadding(left: 22, top: 10, right: 20),
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
                                            text: ("msg_card_type_ex_new2".tr) +
                                                (cardTypeName ?? ""),
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w700)),
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
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600))
                                      ]),
                                      textAlign: TextAlign.left))),
                          SizedBox(
                            height: 20,
                          ),
                          Text("lbl_location".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoSansRegular14.copyWith(
                                  letterSpacing: getHorizontalSize(0.36))),
                          CustomButton(
                              height: 50,
                              width: 375,
                              text: locationSelected
                                  ? "  " + "lbl_change_location".tr
                                  : "  " + "lbl_select_location".tr,
                              margin: getMargin(top: 10),
                              variant: ButtonVariant.OutlineBlack9003f_1,
                              shape: ButtonShape.RoundedBorder15,
                              fontStyle: ButtonFontStyle.NunitoSansBold14,
                              alignment: Alignment.center,
                              prefixWidget: Icon(
                                Icons.location_pin,
                                color: ColorConstant.pink900,
                              ),
                              onTap: () {
                                goToLocationPage();
                              }),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _latitude_Controller,
                              hintText: "lbl_latitude".tr,
                              margin: getMargin(top: 23)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _longitude_Controller,
                              hintText: "lbl_longitude".tr,
                              margin: getMargin(top: 24)),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(left: 2, top: 0),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray300Cc,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00)))),
                          Container(
                              // height: getVerticalSize(52.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(left: 2, top: 5),
                              child: Row(children: [
                                Text("lbl_icon_color".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNunitoSansRegular14
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.36),
                                            height: getVerticalSize(1.26))),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                    margin: getMargin(all: 0),
                                    padding: getPadding(left:5,right: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                5.0) //                 <--- border radius here
                                            ),
                                            
                                        border: Border.all(
                                            color: ColorConstant.pink900)),
                                    child: CustomButton(
                                        customColor: currentColor,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                      title: const Text(
                                                          'Pick a color!'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ColorPicker(
                                                          pickerColor:
                                                              pickerColor,
                                                          onColorChanged:
                                                              changeColor,
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        ElevatedButton(
                                                          child: const Text(
                                                              'Select'),
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
                                          color:(hexColor=="#FFFFFF")?ColorConstant.pink900: Colors.white,
                                        ),
                                        margin: getMargin(top: 0),
                                        // prefixWidget: Icon(Icons.color_lens_rounded,color: Colors.white,),
                                        variant:
                                            ButtonVariant.OutlineBlack9003f,
                                        shape: ButtonShape.RoundedBorder5,
                                        padding: ButtonPadding.PaddingBottom9,
                                        fontStyle:
                                            ButtonFontStyle.InterSemiBold14,
                                        alignment: Alignment.topRight))
                              ])),
                          Visibility(
                            child: Container(
                                height: getVerticalSize(1.00),
                                width: getHorizontalSize(326.00),
                                margin: getMargin(left: 2, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray300Cc,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(1.00)))),
                            visible: !(cardURL == null || cardURL!.isEmpty),
                          ),
                          Visibility(
                            child: Padding(
                                padding: getPadding(left: 0, top: 7),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 0),
                                          child: Text("lbl_last_edited_date".tr,
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
                                        width: 15,
                                      ),
                                      Padding(
                                          padding: getPadding(bottom: 0),
                                          child: Text(cardURL ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(
                                                  14,
                                                ),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w700,
                                              ))),
                                    ])),
                            visible: !(cardURL == null || cardURL!.isEmpty),
                          ),
                          Visibility(
                            child: Container(
                                height: getVerticalSize(1.00),
                                width: getHorizontalSize(326.00),
                                margin: getMargin(left: 2, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray300Cc,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(1.00)))),
                            visible: !(createDateString == null ||
                                createDateString!.isEmpty),
                          ),
                          Visibility(
                            child: Padding(
                                padding: getPadding(left: 0, top: 7, bottom: 7),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 0),
                                          child: Text("lbl_created_date".tr,
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
                                        width: 40,
                                      ),
                                      Padding(
                                          padding: getPadding(bottom: 0),
                                          child: Text(createDateString ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: ColorConstant.pink900,
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
                                margin: getMargin(left: 2, top: 5, bottom: 5),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(bottom: 0),
                                          child: Text("lbl_last_edited_date".tr,
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
                                        width: 15,
                                      ),
                                      Padding(
                                          padding: getPadding(bottom: 0),
                                          child: Text(lastEditDateString ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: ColorConstant.pink900,
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
                          SizedBox(height: 10),
                           finalLocation == null
                              ? Container()
                              : Expanded(
                                  child: Stack(children: [
                                  FlutterMap(
                                    options: MapOptions(
                                        center: LatLng(finalLocation!.latitude,
                                            finalLocation!.longitude),
                                        interactiveFlags:
                                            InteractiveFlag.pinchZoom,
                                        zoom: 15.0,
                                        maxZoom: 18,
                                        minZoom: 6),
                                    mapController: _mapController,
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                        subdomains: ['a', 'b', 'c'],
                                        // attributionBuilder: (_) {
                                        //   return Text("© OpenStreetMap contributors");
                                        // },
                                      ),
                                    ],
                                  ),
                                  // Positioned.fill(
                                  //     child: IgnorePointer(
                                  //   child: Center(
                                  //     child: Icon(Icons.location_pin,
                                  //         size: 50, color: ColorConstant.pink900),
                                  //   ),
                                  // )),
                                ])),
                        ]))
            //)
            ,
            bottomNavigationBar: CustomBottomBar(
                cardID: selectedCardID ?? 0,
                onPublish: () {
                  showPublishAlertDialog(context);
                },
                onNextClicked: onTapNext,
                isPublished: isPublished,
                publishURL: publishedURL,
                isPublishAvailable: isPublishAvailable ?? false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapImageModify() {
    Navigator.of(context).pushNamed(AppRoutes.imageModifyScreen);
  }

  onTapNext() {
    saveCardMain();
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast3() {
    Navigator.pop(context);
  }

  onTapBack() {
    Navigator.of(context).pop();
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

  goToLocationPage() {
    Get.toNamed(AppRoutes.locationselection)?.then((value) {
      setState(() {
        finalLocation = null;
      });
      setState(() {
        if (value['latLong'] != null) {
          locationSelected = true;
          var ltlng = value['latLong'] as LatLong;
          finalLocation = LatLng(ltlng.latitude, ltlng.longitude);
          var newLatLong = LatLng(ltlng.latitude, ltlng.longitude);
          _latitude_Controller.text = ltlng.latitude.toString();
          _longitude_Controller.text = ltlng.longitude.toString();

          _mapController.move(newLatLong, 15);
        }
      });
    });
  }
}
