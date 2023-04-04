import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomizationoneScreen extends StatefulWidget {
  const CustomizationoneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomizationoneScreen createState() => _CustomizationoneScreen();
}

class _CustomizationoneScreen extends State<CustomizationoneScreen> {
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
                              left: 38, top: 44, right: 114, bottom: 7),
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
                                              onTap: onTapContrast4),
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
                                    margin: getMargin(left: 39, top: 5))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_17),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 27, top: 31, right: 23),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(266.00),
                                  margin: getMargin(left: 9),
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
                              CustomButton(
                                  height: 60,
                                  width: 325,
                                  text: "lbl_card_preview2".tr,
                                  margin: getMargin(top: 32),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  padding: ButtonPadding.PaddingAll18,
                                  fontStyle: ButtonFontStyle.NunitoSansBold16,
                                  onTap: onTapCardpreview),
                              Padding(
                                  padding: getPadding(left: 15, top: 31),
                                  child: Text("lbl_smart_links".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansBold16Pink900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.36)))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(212.00),
                                      width: getHorizontalSize(289.00),
                                      margin: getMargin(top: 13),
                                      child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      onTapRectangle4214();
                                                    },
                                                    child: Container(
                                                        height: getSize(80.00),
                                                        width: getSize(80.00),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .deepOrange40033,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        5.00)))))),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      onTapRectangle4215();
                                                    },
                                                    child: Container(
                                                        height: getSize(80.00),
                                                        width: getSize(80.00),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .deepOrange40033,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        5.00)))))),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      onTapRectangle4216();
                                                    },
                                                    child: Container(
                                                        height: getSize(80.00),
                                                        width: getSize(80.00),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .deepOrange40033,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        5.00)))))),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      onTapStacksearch();
                                                    },
                                                    child: Card(
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        elevation: 0,
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        color: ColorConstant
                                                            .deepOrange40033,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                        child: Container(
                                                            height:
                                                                getSize(80.00),
                                                            width:
                                                                getSize(80.00),
                                                            padding: getPadding(
                                                                all: 25),
                                                            decoration: AppDecoration
                                                                .fillDeeporangeA100a3
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder5),
                                                            child: Stack(
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgSearchPink900,
                                                                      height: getVerticalSize(
                                                                          19.00),
                                                                      width: getHorizontalSize(
                                                                          29.00),
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter)
                                                                ]))))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding:
                                                        getPadding(left: 2),
                                                    child: Text(
                                                        "msg_advanced_feature"
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
                                                                        0.36))))),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                    padding: getPadding(
                                                        left: 8, top: 6),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 1),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                        "lbl_footer"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoSansRegular12Black900
                                                                            .copyWith(letterSpacing: getHorizontalSize(0.36))),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                65),
                                                                        child: Text(
                                                                            "lbl_icon_groups"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtNunitoSansRegular12Black900.copyWith(letterSpacing: getHorizontalSize(0.36)))),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                40),
                                                                        child: Text(
                                                                            "lbl_bands"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtNunitoSansRegular12Black900.copyWith(letterSpacing: getHorizontalSize(0.36))))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 18,
                                                                      top: 7),
                                                              child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgVideocamera,
                                                                        height: getVerticalSize(
                                                                            25.00),
                                                                        width: getHorizontalSize(
                                                                            21.00),
                                                                        margin: getMargin(
                                                                            bottom:
                                                                                1)),
                                                                    CustomImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgLink,
                                                                        height: getVerticalSize(
                                                                            23.00),
                                                                        width: getHorizontalSize(
                                                                            32.00),
                                                                        margin: getMargin(
                                                                            left:
                                                                                84,
                                                                            top:
                                                                                3))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 82),
                                                              child: Text(
                                                                  "lbl_advanced"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtNunitoSansRegular12Black900
                                                                      .copyWith(
                                                                          letterSpacing:
                                                                              getHorizontalSize(0.36))))
                                                        ]))),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgGridPink900,
                                                height: getVerticalSize(25.00),
                                                width: getHorizontalSize(22.00),
                                                alignment: Alignment.topRight,
                                                margin: getMargin(
                                                    top: 33, right: 28))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 42),
                                  child: Text("msg_created_on_02_02_2023".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansRegular14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.36)))),
                              Padding(
                                  padding: getPadding(top: 9),
                                  child: Text("msg_published_on_02_02_2023".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansRegular14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.36)))),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                onNextClicked: onTapCardpreview,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapCardpreview() {
    Navigator.of(context).pushNamed(AppRoutes.cardPreviewScreen);
  }

  onTapRectangle4214() {
    Navigator.of(context).pushNamed(AppRoutes.footerScreen);
  }

  onTapRectangle4215() {
    Navigator.of(context).pushNamed(AppRoutes.bandsScreen);
  }

  onTapRectangle4216() {
    Navigator.of(context).pushNamed(AppRoutes.iconGroupScreen);
  }

  onTapStacksearch() {
    Navigator.of(context).pushNamed(AppRoutes.advancedScreen);
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast4() {
    Navigator.of(context).pushNamed(AppRoutes.cardEntrytwoScreen);
  }
}
