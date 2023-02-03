
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class BasicGreetingEntryScreen extends StatefulWidget {
  const BasicGreetingEntryScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BasicGreetingEntryScreen createState() => _BasicGreetingEntryScreen();
            }

class _BasicGreetingEntryScreen extends State<BasicGreetingEntryScreen> {
  TextEditingController _template_Controller = new TextEditingController();
  TextEditingController _caption_Controller = new TextEditingController();
  TextEditingController _sender_Controller = new TextEditingController();
  TextEditingController _card_color_Controller = new TextEditingController();
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
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
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
                                      child: Text("msg_card_type_ex_new3".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNunitoBold18))),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_select_template".tr,
                                  margin: getMargin(top: 22),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapSelecttemplateOne),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _template_Controller,
                                  hintText: "lbl_template".tr,
                                  margin: getMargin(top: 30)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _caption_Controller,
                                  hintText: "lbl_caption".tr,
                                  margin: getMargin(top: 19)),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 17, top: 18),
                                      child: Text("lbl_message".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNunitoSansRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.36))))),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(top: 38),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller:
                                      _sender_Controller,
                                  hintText: "lbl_sender".tr,
                                  margin: getMargin(top: 19)),
                              Container(
                                  height: getVerticalSize(44.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(top: 13),
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 16),
                                                      child: Text("lbl_logo".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansRegular14
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36)))),
                                                  Container(
                                                      height:
                                                          getVerticalSize(1.00),
                                                      width: getHorizontalSize(
                                                          326.00),
                                                      margin:
                                                          getMargin(top: 11),
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            1.00),
                                                                    width: getHorizontalSize(
                                                                        326.00),
                                                                    decoration: BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray300Cc,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(1.00))))),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            1.00),
                                                                        width: getHorizontalSize(
                                                                            326.00),
                                                                        child: Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: [
                                                                              Align(alignment: Alignment.center, child: Container(height: getVerticalSize(1.00), width: getHorizontalSize(326.00), decoration: BoxDecoration(color: ColorConstant.gray300Cc, borderRadius: BorderRadius.circular(getHorizontalSize(1.00))))),
                                                                              Align(alignment: Alignment.center, child: Container(height: getVerticalSize(1.00), width: getHorizontalSize(326.00), decoration: BoxDecoration(color: ColorConstant.gray300Cc, borderRadius: BorderRadius.circular(getHorizontalSize(1.00)))))
                                                                            ])))
                                                          ]))
                                                ])),
                                        CustomButton(
                                            height: 35,
                                            width: 116,
                                            text: "lbl_select_image".tr,
                                            margin: getMargin(right: 54),
                                            variant:
                                                ButtonVariant.OutlineBlack9003f,
                                            shape: ButtonShape.RoundedBorder5,
                                            padding: ButtonPadding.PaddingT9,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBlack12,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 8),
                                                child: CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgMap)),
                                            onTap: onTapSelectimage,
                                            alignment: Alignment.topRight),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: EdgeInsets.all(0),
                                                color: ColorConstant.pink900,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                                child: Container(
                                                    height:
                                                        getVerticalSize(35.00),
                                                    width: getHorizontalSize(
                                                        45.00),
                                                    padding: getPadding(
                                                        left: 18,
                                                        top: 12,
                                                        right: 18,
                                                        bottom: 12),
                                                    decoration: AppDecoration
                                                        .outlineBlack9003f2
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Stack(children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgDelete,
                                                          height:
                                                              getVerticalSize(
                                                                  10.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  8.00),
                                                          alignment: Alignment
                                                              .bottomRight)
                                                    ]))))
                                      ])),
                              Container(
                                  height: getVerticalSize(129.00),
                                  width: getHorizontalSize(330.00),
                                  margin: getMargin(top: 13),
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                                padding: getPadding(
                                                    top: 11, right: 4),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 13),
                                                          child: Text(
                                                              "lbl_background"
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
                                                                          getHorizontalSize(
                                                                              0.36)))),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  1.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  326.00),
                                                          margin: getMargin(
                                                              top: 11),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Container(
                                                                        height: getVerticalSize(
                                                                            1.00),
                                                                        width: getHorizontalSize(
                                                                            326.00),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                ColorConstant.gray300Cc,
                                                                            borderRadius: BorderRadius.circular(getHorizontalSize(1.00))))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Container(
                                                                        height: getVerticalSize(1.00),
                                                                        width: getHorizontalSize(326.00),
                                                                        child: Stack(alignment: Alignment.center, children: [
                                                                          Align(
                                                                              alignment: Alignment.center,
                                                                              child: Container(height: getVerticalSize(1.00), width: getHorizontalSize(326.00), decoration: BoxDecoration(color: ColorConstant.gray300Cc, borderRadius: BorderRadius.circular(getHorizontalSize(1.00))))),
                                                                          Align(
                                                                              alignment: Alignment.center,
                                                                              child: Container(height: getVerticalSize(1.00), width: getHorizontalSize(326.00), decoration: BoxDecoration(color: ColorConstant.gray300Cc, borderRadius: BorderRadius.circular(getHorizontalSize(1.00)))))
                                                                        ])))
                                                              ])),
                                                      CustomTextFormField(
                                                          width: 326,
                                                          focusNode:
                                                              FocusNode(),
                                                          controller: _card_color_Controller,
                                                          hintText:
                                                              "lbl_card_color"
                                                                  .tr,
                                                          margin: getMargin(
                                                              top: 14),
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done)
                                                    ]))),
                                        CustomButton(
                                            height: 35,
                                            width: 116,
                                            text: "lbl_select_image".tr,
                                            margin: getMargin(right: 58),
                                            variant:
                                                ButtonVariant.OutlineBlack9003f,
                                            shape: ButtonShape.RoundedBorder5,
                                            padding: ButtonPadding.PaddingT9,
                                            fontStyle: ButtonFontStyle
                                                .NunitoSansBlack12,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 8),
                                                child: CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgMap)),
                                            onTap: onTapSelectimageOne,
                                            alignment: Alignment.topRight),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: getMargin(right: 4),
                                                color: ColorConstant.pink900,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                                child: Container(
                                                    height:
                                                        getVerticalSize(35.00),
                                                    width: getHorizontalSize(
                                                        45.00),
                                                    padding: getPadding(
                                                        left: 18,
                                                        top: 12,
                                                        right: 18,
                                                        bottom: 12),
                                                    decoration: AppDecoration
                                                        .outlineBlack9003f2
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Stack(children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgDelete,
                                                          height:
                                                              getVerticalSize(
                                                                  10.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  8.00),
                                                          alignment: Alignment
                                                              .bottomRight)
                                                    ])))),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgC1,
                                            height: getVerticalSize(76.00),
                                            width: getHorizontalSize(236.00),
                                            alignment: Alignment.bottomRight)
                                      ])),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_next".tr,
                                  margin: getMargin(top: 17),
                                  onTap: onTapNext),
                              Container(
                                  height: getVerticalSize(94.00),
                                  width: getHorizontalSize(105.00),
                                  margin: getMargin(top: 17),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapEllipseFour();
                                                },
                                                child: Container(
                                                    height:
                                                        getVerticalSize(94.00),
                                                    width: getHorizontalSize(
                                                        105.00),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .pink900,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    52.00)))))),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgHomeWhiteA700,
                                            height: getVerticalSize(25.00),
                                            width: getHorizontalSize(27.00),
                                            alignment: Alignment.topCenter,
                                            margin: getMargin(top: 33))
                                      ]))
                            ])))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  onTapSelecttemplateOne() {
    Get.toNamed(AppRoutes.selectTemplatetwoScreen);
  }

  onTapSelectimage() {
    Get.toNamed(AppRoutes.imageModifytwoScreen);
  }

  onTapSelectimageOne() {
    Get.toNamed(AppRoutes.imageModifytwoScreen);
  }

  onTapNext() {
    Get.toNamed(AppRoutes.customizationScreen);
  }

  onTapEllipseFour() {
    Get.toNamed(AppRoutes.homePageScreen);
  }

  onTapContrast9() {
    Get.toNamed(AppRoutes.eGreetingCardOptionsScreen);
  }
}
