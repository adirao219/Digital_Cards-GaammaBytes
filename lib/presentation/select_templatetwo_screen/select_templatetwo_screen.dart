
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_stack.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class SelectTemplatetwoScreen extends StatefulWidget {
  const SelectTemplatetwoScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _SelectTemplatetwoScreen createState() => _SelectTemplatetwoScreen();
            }

class _SelectTemplatetwoScreen extends State<SelectTemplatetwoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
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
                              left: 40, top: 44, right: 112, bottom: 6),
                          child: Row(children: [
                            AppbarIconbutton(
                                svgPath: ImageConstant.imgArrowleft,
                                margin: getMargin(bottom: 5),
                                onTap: onTapArrowleft1),
                            AppbarSubtitle(
                                text: "lbl_template_view".tr,
                                margin: getMargin(left: 36, top: 18))
                          ]))
                    ])),
                actions: [
                  Container(
                      height: getVerticalSize(46.00),
                      width: getHorizontalSize(86.00),
                      margin:
                          getMargin(left: 286, top: 44, right: 3, bottom: 18),
                      child: Stack(alignment: Alignment.topRight, children: [
                        AppbarStack(margin: getMargin(right: 29)),
                        AppbarImage(
                            height: getVerticalSize(35.00),
                            width: getHorizontalSize(43.00),
                            svgPath: ImageConstant.imgOverflowmenu,
                            margin: getMargin(left: 43, top: 3, bottom: 8))
                      ]))
                ],
                styleType: Style.bgStyle_5),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 19, top: 28, right: 19, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomDropDown(
                                  width: 257,
                                  focusNode: FocusNode(),
                                  icon: Container(
                                      margin: getMargin(left: 30, right: 9),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowdownPink900)),
                                  hintText: "lbl_select".tr,
                                  margin: getMargin(right: 30),
                                  variant: DropDownVariant.OutlineBlack900,
                                  fontStyle: DropDownFontStyle.NunitoSansBold16,
                                  items: [],
                                  onChanged: (value) {
                                    
                                  }),
                              Container(
                                  width: getHorizontalSize(257.00),
                                  margin: getMargin(top: 1, right: 30),
                                  padding: getPadding(top: 4, bottom: 4),
                                  decoration: AppDecoration.outlineBlack9003f1
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL15),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(257.00),
                                            padding:
                                                getPadding(left: 10, right: 10),
                                            decoration: AppDecoration
                                                .fillDeeporange100
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Text(
                                                          "msg_sample_template"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansBold16Pink900
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36))))
                                                ])),
                                        Padding(
                                            padding: getPadding(left: 10),
                                            child: Text(
                                                "msg_sample_template2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansBold16Pink900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36)))),
                                        Padding(
                                            padding: getPadding(
                                                left: 10, top: 1, bottom: 1),
                                            child: Text(
                                                "msg_sample_template3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansBold16Pink900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36))))
                                      ])),
                              Container(
                                  height: getVerticalSize(529.00),
                                  width: getHorizontalSize(335.00),
                                  margin: getMargin(top: 17),
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                height: getVerticalSize(478.00),
                                                width:
                                                    getHorizontalSize(296.00),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .deepOrangeA100A3,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                10.00))))),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgClock,
                                            height: getVerticalSize(46.00),
                                            width: getHorizontalSize(42.00),
                                            alignment: Alignment.topRight),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgMinimize,
                                            height: getVerticalSize(39.00),
                                            width: getHorizontalSize(41.00),
                                            alignment: Alignment.bottomLeft),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                height: getVerticalSize(456.00),
                                                width:
                                                    getHorizontalSize(273.00),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .purpleA2002d,
                                                    border: Border.all(
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        width:
                                                            getHorizontalSize(
                                                                2.00)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: ColorConstant
                                                              .black9003f,
                                                          spreadRadius:
                                                              getHorizontalSize(
                                                                  2.00),
                                                          blurRadius:
                                                              getHorizontalSize(
                                                                  2.00),
                                                          offset: Offset(0, 4))
                                                    ])))
                                      ])),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_select".tr,
                                  margin: getMargin(top: 13),
                                  fontStyle: ButtonFontStyle.NunitoSansBlack16,
                                  onTap: onTapSelect,
                                  alignment: Alignment.center)
                            ]))))));
  }

  onTapSelect() {
    Get.toNamed(AppRoutes.basicGreetingEntryScreen);
  }

  onTapArrowleft1() {
    Get.back();
  }
}
