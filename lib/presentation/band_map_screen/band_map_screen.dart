
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class BandMapScreen extends StatefulWidget {
  const BandMapScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BandMapScreen createState() => _BandMapScreen();
            }

class _BandMapScreen extends State<BandMapScreen> {
  TextEditingController _heading_Controller = new TextEditingController();
  TextEditingController _latitude_Controller = new TextEditingController();
  TextEditingController _longitude_Controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
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
                              left: 38, top: 44, right: 151, bottom: 5),
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                margin: getMargin(bottom: 8),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      AppbarImage(
                                          height: getVerticalSize(36.00),
                                          width: getHorizontalSize(38.00),
                                          svgPath: ImageConstant.imgContrast),
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
                                text: "lbl_bands2".tr.toUpperCase(),
                                margin: getMargin(left: 76, top: 16))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_34),
            body: Container(
                width: size.width,
                padding: getPadding(left: 9, top: 20, right: 9, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: getHorizontalSize(286.00),
                              margin: getMargin(left: 27),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_card_name_ex3".tr,
                                        style: TextStyle(
                                            color: ColorConstant.pink900,
                                            fontSize: getFontSize(18),
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w700)),
                                    TextSpan(
                                        text: "msg_band_type_ex_map".tr,
                                        style: TextStyle(
                                            color: ColorConstant.pink900,
                                            fontSize: getFontSize(18),
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w600))
                                  ]),
                                  textAlign: TextAlign.left))),
                      CustomTextFormField(
                          width: 326,
                          focusNode: FocusNode(),
                          controller: _heading_Controller,
                          hintText: "lbl_heading".tr,
                          margin: getMargin(top: 35)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 13, top: 22),
                              child: Text("lbl_location".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansRegular14
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.36))))),
                      CustomImageView(
                          imagePath: ImageConstant.imgScreenshot55,
                          height: getVerticalSize(171.00),
                          width: getHorizontalSize(344.00),
                          margin: getMargin(top: 22)),
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
                          margin: getMargin(top: 24),
                          textInputAction: TextInputAction.done),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_save".tr,
                          margin: getMargin(top: 75, bottom: 5),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapSave)
                    ]))));
  }

  onTapSave() {
    Get.toNamed(AppRoutes.bandsScreen);
  }
}
