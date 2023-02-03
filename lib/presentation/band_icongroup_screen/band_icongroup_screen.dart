
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class BandIcongroupScreen extends StatefulWidget {
  const BandIcongroupScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BandIcongroupScreen createState() => _BandIcongroupScreen();
            }

class _BandIcongroupScreen extends State<BandIcongroupScreen> {
  TextEditingController _icon_group2_Controller = new TextEditingController();
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
                                child: Stack(children: [
                                  AppbarImage(
                                      height: getVerticalSize(36.00),
                                      width: getHorizontalSize(38.00),
                                      svgPath: ImageConstant.imgContrast),
                                  Container(
                                      height: getVerticalSize(25.00),
                                      width: getHorizontalSize(29.00),
                                      margin: getMargin(
                                          left: 5, top: 6, right: 4, bottom: 5),
                                      child: Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            AppbarImage(
                                                height: getVerticalSize(25.00),
                                                width: getHorizontalSize(29.00),
                                                svgPath: ImageConstant.imgMenu),
                                            AppbarImage(
                                                height: getVerticalSize(10.00),
                                                width: getHorizontalSize(5.00),
                                                svgPath: ImageConstant
                                                    .imgVectorstroke,
                                                margin: getMargin(
                                                    left: 10,
                                                    top: 7,
                                                    right: 14,
                                                    bottom: 8))
                                          ]))
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
                styleType: Style.bgStyle_38),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 20, right: 24, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(286.00),
                          margin: getMargin(left: 12),
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
                                    text: "msg_band_type_ex_icongroup".tr,
                                    style: TextStyle(
                                        color: ColorConstant.pink900,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w600))
                              ]),
                              textAlign: TextAlign.left)),
                      CustomTextFormField(
                          width: 326,
                          focusNode: FocusNode(),
                          controller: _icon_group2_Controller,
                          hintText: "lbl_icon_group2".tr,
                          margin: getMargin(left: 1, top: 35),
                          textInputAction: TextInputAction.done),
                      Spacer(),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_save".tr,
                          margin: getMargin(bottom: 56),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapSave,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapSave() {
    Get.toNamed(AppRoutes.bandsScreen);
  }
}
