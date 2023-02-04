import 'package:digitalcards_gaammabytes/presentation/card_entrytwo_screen/widgets/card_entrytwo_item_widget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../core/utils/osm_map.dart';
import 'models/card_entrytwo_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  Color pickerColor = Color(0xff443a49);
  Color? currentColor;

  MapController _mapController = MapController();
  ImagePicker _picker = new ImagePicker();

  LatLng? finalLocation;
  bool locationSelected = false;
  bool isFirstImageSelected = false;
  bool isSecondImageSelected = false;
  XFile? imageFirst;
  XFile? imageSecond;
  File? firstCroppedImage;
  File? secondCroppedImage;
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  getCurrentLocation() async {
    try {
      var checkpermission = await _handleLocationPermission();
      if (true) {
        //checkpermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          finalLocation = LatLng(position.latitude, position.longitude);
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
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 31, right: 9),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(266.00),
                                  margin: getMargin(left: 14),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_card_type_ex_buisness2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                            text: "msg_template_type".tr,
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600))
                                      ]),
                                      textAlign: TextAlign.left)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 15),
                                      child: Text("lbl_location".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNunitoSansRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.36)))),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  CustomButton(
                                    text: locationSelected
                                        ? "  "+"lbl_change_location".tr
                                        : "  "+"lbl_select_location".tr,
                                    onTap: goToLocationPage,
                                    margin: getMargin(left: 0),
                                    height: 35,
                                    width: 150,
                                    fontStyle:
                                        ButtonFontStyle.NunitoSansBlack12,
                                    alignment: Alignment.topCenter,
                                    prefixWidget: Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              
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
                                  margin: getMargin(left: 2, top: 0),
                                  child: Row(children: [
                                    Text("lbl_card_color".tr,
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
                                    CustomButton(
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
                                        variant:
                                            ButtonVariant.OutlineBlack9003f,
                                        shape: ButtonShape.RoundedBorder5,
                                        padding: ButtonPadding.PaddingBottom9,
                                        fontStyle:
                                            ButtonFontStyle.InterSemiBold14,
                                        alignment: Alignment.topRight)
                                  ])),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_next".tr,
                                  margin: getMargin(left: 40, top: 45),
                                  onTap: onTapNext),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                onNextClicked: onTapNext,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
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
      File? imageFile = value["imageFile"] as File?;
      int? pictureType = value["pictureType"] as int?;
      if (pictureType == 1) {
        firstCroppedImage = imageFile;
        isFirstImageSelected = true;
      }
      if (pictureType == 2) {
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

  onTapImageModify() {
    Navigator.of(context).pushNamed(AppRoutes.imageModifyScreen);
  }

  onTapNext() {
    Navigator.of(context).pushNamed(AppRoutes.customizationoneScreen);
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast3() {
    Navigator.of(context).pushNamed(AppRoutes.cardEntryoneScreen);
  }

  onTapBack() {
    Navigator.of(context).pop();
  }

  goToLocationPage() {
    Get.toNamed(AppRoutes.locationselection)?.then((value) {
      setState(() {
        if (value['latLong'] != null) {
          locationSelected = true;
          var ltlng = value['latLong'] as LatLong;
          finalLocation = LatLng(ltlng.latitude, ltlng.longitude);
          _latitude_Controller.text = ltlng.latitude.toString();
          _longitude_Controller.text = ltlng.longitude.toString();
        }
      });
    });
  }
}
