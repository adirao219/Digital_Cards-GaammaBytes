
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'dart:io';

import '../../widgets/custom_text_form_field.dart';

class ImageModifyScreen extends StatefulWidget {
  const ImageModifyScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _ImageModifyoneScreen createState() => _ImageModifyoneScreen();
            }

class _ImageModifyoneScreen extends State<ImageModifyScreen> {
    File imageFile = Get.arguments["imageFile"] as File;
    
    int pictureType= Get.arguments["pictureType"] as int;
  bool isSquareSelected = true;
  TextEditingController _size_x_controller = new TextEditingController();
  TextEditingController _size_y_controller = new TextEditingController();
CroppedFile? croppedFile;



@override
  void initState()
{
cropImageFromPath();
super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          
            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child:MoreOptionMenu()),
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
                              left: 38, top: 44, right: 116, bottom: 9),
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                margin: getMargin(bottom: 4),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      AppbarImage(
                                          height: getVerticalSize(36.00),
                                          width: getHorizontalSize(38.00),
                                          svgPath: ImageConstant.imgContrast,
                                          onTap: onTapArrowleft20),
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
                                text: "lbl_select_image".tr.toUpperCase(),
                                margin: getMargin(left: 30, top: 5))
                          ]))
                    ])),
                 // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_11),
            body:  SingleChildScrollView(
                child: Container(
                    width: size.width,
                    padding: getPadding(left: 24, top: 8, right: 24, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                              file: imageFile,
                              height: getSize(_size_x_controller.text.isNotEmpty
                                  ? double.parse(_size_x_controller.text)
                                  : 326.00),
                              width: getSize(_size_y_controller.text.isNotEmpty
                                  ? double.parse(_size_y_controller.text)
                                  : 326.00),
                              radius: BorderRadius.circular(getHorizontalSize(
                                  isSquareSelected ? 10.00 : 1000.00)),
                              margin: getMargin(left: 1)),
                          Padding(
                              padding: getPadding(left: 1, top: 21),
                              child: Text("lbl_type".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16
                                      .copyWith(
                                          height: getVerticalSize(1.00)))),
                          Padding(
                              padding: getPadding(left: 1, top: 9),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: (() {
                                          //cropImageFromPath();
                                          setState(() {
                                            isSquareSelected = true;
                                          });
                                        }),
                                        child: Container(
                                            padding: getPadding(
                                                left: 53,
                                                top: 11,
                                                right: 53,
                                                bottom: 11),
                                            decoration: isSquareSelected
                                                ? AppDecoration.outlinePink900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10)
                                                : AppDecoration.fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: getSize(23.00),
                                                      width: getSize(23.00),
                                                      margin: getMargin(
                                                          top: 3, right: 11),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  ColorConstant
                                                                      .pink900,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00)))),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 5),
                                                      child: Text(
                                                          "lbl_square".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansRegular14Pink900
                                                              .copyWith(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1.00))))
                                                ]))),
                                    InkWell(
                                        onTap: (() {
                                          setState(() {
                                            isSquareSelected = false;
                                          });
                                        }),
                                        child: Container(
                                            padding: getPadding(
                                                left: 59,
                                                top: 12,
                                                right: 59,
                                                bottom: 12),
                                            decoration: (!isSquareSelected)
                                                ? AppDecoration.outlinePink900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10)
                                                : AppDecoration.fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: getSize(23.00),
                                                      width: getSize(23.00),
                                                      margin: getMargin(top: 2),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      11.00)),
                                                          border: Border.all(
                                                              color:
                                                                  ColorConstant
                                                                      .black900,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00)))),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 4),
                                                      child: Text(
                                                          "lbl_circle".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansRegular14Black900
                                                              .copyWith(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1.00))))
                                                ])))
                                  ])),
                          Padding(
                              padding: getPadding(left: 1, top: 23),
                              child: Text("lbl_size".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16
                                      .copyWith(
                                          height: getVerticalSize(1.00)))),
                          Padding(
                              padding: getPadding(left: 1, top: 1, bottom: 5),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTextFormField(
                                        width: 100,
                                        controller: _size_x_controller,
                                        textInputType: TextInputType.number,
                                        hintText: "lbl_width".tr,
                                        onChanged: ((p0) {
                                          setState(() {});
                                        }),
                                        margin: getMargin(top: 23)),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(top: 17),
                                            child: Text("lbl_x".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansRegular14Black900
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.00))))),
                                    CustomTextFormField(
                                        onChanged: ((p0) {
                                          setState(() {});
                                        }),
                                        width: 100,
                                        controller: _size_y_controller,
                                        textInputType: TextInputType.number,
                                        hintText: "lbl_height".tr,
                                        margin: getMargin(top: 23)),
                                  ]))
                        ]))),
            bottomNavigationBar: InkWell(
                onTap: imageEditingDone,
                child: Padding(
                    padding: getPadding(left: 25, right: 24, bottom: 58),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              height: 62, width: 326, text: "lbl_ok".tr)
                        ])))));
  }

  imageEditingDone() {
    Get.back(result: {
      "width": double.tryParse(_size_x_controller.text),
      "height": double.tryParse(_size_y_controller.text),
      "isSquare": isSquareSelected,
      "pictureType":pictureType,
      "refinedImagePath":imageFile,
    });
  }

  onTapArrowleft20() {
    Get.back(result: {"width": null, "height": null, "isSquare": null,"pictureType":null,"refinedImagePath":null});
  }

  cropImageFromPath() async {
   croppedFile = await 
   ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Image Cropper',
            toolbarColor: Colors.deepOrange[900],
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    setState(() {
      if(croppedFile!=null)
      {
      
    imageFile =File(croppedFile!.path);
   } });
  }
}
