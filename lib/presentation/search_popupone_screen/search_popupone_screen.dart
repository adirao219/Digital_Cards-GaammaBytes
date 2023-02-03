
import 'package:digitalcards_gaammabytes/presentation/search_popupone_screen/widgets/gridbusinesscardseven1_item_widget.dart';

import '../search_popupone_screen/widgets/listlanguage_three_item_widget.dart';

import 'models/gridbusinesscardseven1_item_model.dart';
import 'models/listlanguage_three_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/search_popupone_model.dart';

class SearchPopuponeScreen extends StatefulWidget {
  const SearchPopuponeScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _SearchPopuponeScreen createState() => _SearchPopuponeScreen();
            }

class _SearchPopuponeScreen extends State<SearchPopuponeScreen> {
  
    Rx<SearchPopuponeModel> searchPopuponeModelObj =
      SearchPopuponeModel().obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(253.00),
                          width: size.width,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgVectorDeepOrangeA100,
                                height: getVerticalSize(90.00),
                                width: getHorizontalSize(375.00),
                                alignment: Alignment.topCenter),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: getVerticalSize(104.00),
                                    width: size.width,
                                    padding: getPadding(
                                        left: 35,
                                        top: 29,
                                        right: 35,
                                        bottom: 29),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(ImageConstant
                                                .imgVectorDeepOrangeA100),
                                            fit: BoxFit.cover)),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgSearch,
                                              height: getSize(16.00),
                                              width: getSize(16.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 8, bottom: 6)),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Card(
                                                  clipBehavior: Clip.antiAlias,
                                                  elevation: 0,
                                                  margin: EdgeInsets.all(0),
                                                  color: ColorConstant.gray50,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder5),
                                                  child: Container(
                                                      height: getVerticalSize(
                                                          28.00),
                                                      width: getHorizontalSize(
                                                          31.00),
                                                      padding: getPadding(
                                                          left: 7,
                                                          top: 6,
                                                          right: 7,
                                                          bottom: 6),
                                                      decoration: AppDecoration
                                                          .fillGray50
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder5),
                                                      child: Stack(children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSearch,
                                                            height:
                                                                getSize(16.00),
                                                            width:
                                                                getSize(16.00),
                                                            alignment: Alignment
                                                                .centerLeft)
                                                      ]))))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    margin: getMargin(left: 34, right: 34),
                                    padding: getPadding(top: 8, bottom: 8),
                                    decoration: AppDecoration.outlineWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomAppBar(
                                              height: getVerticalSize(40.00),
                                              centerTitle: true,
                                              title: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 44,
                                                            right: 45),
                                                        child: Row(children: [
                                                          AppbarImage(
                                                              height:
                                                                  getVerticalSize(
                                                                      14.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      17.00),
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgClose,
                                                              margin: getMargin(
                                                                  bottom: 11),
                                                              onTap:
                                                                  onTapClose),
                                                          AppbarSubtitle1(
                                                              text:
                                                                  "lbl_search_details"
                                                                      .tr,
                                                              margin: getMargin(
                                                                  left: 73,
                                                                  top: 4)),
                                                          AppbarSubtitle2(
                                                              text:
                                                                  "lbl_clear_all"
                                                                      .tr,
                                                              margin: getMargin(
                                                                  left: 44,
                                                                  bottom: 9))
                                                        ])),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(
                                                            height:
                                                                getVerticalSize(
                                                                    1.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    303.00),
                                                            margin: getMargin(
                                                                left: 36,
                                                                top: 12,
                                                                right: 36),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    ColorConstant
                                                                        .red100)))
                                                  ]),
                                              styleType: Style.bgFillRed100),
                                          Padding(
                                              padding:
                                                  getPadding(left: 16, top: 11),
                                              child: Row(children: [
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 1),
                                                    child: Text(
                                                        "lbl_anywhere".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtNotoSerifTeluguRegular12)),
                                                Container(
                                                    height:
                                                        getVerticalSize(18.00),
                                                    width: getHorizontalSize(
                                                        75.00),
                                                    margin: getMargin(left: 14),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .deepPurple100,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    5.00))))
                                              ])),
                                          Padding(
                                              padding:
                                                  getPadding(left: 16, top: 7),
                                              child: Row(children: [
                                                Text("lbl_card_type".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtNotoSerifTeluguRegular12),
                                                Card(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    elevation: 0,
                                                    margin: getMargin(left: 14),
                                                    color: ColorConstant
                                                        .deepPurple100,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            18.00),
                                                        width:
                                                            getHorizontalSize(
                                                                75.00),
                                                        padding: getPadding(
                                                            left: 5,
                                                            top: 6,
                                                            right: 5,
                                                            bottom: 6),
                                                        decoration: AppDecoration
                                                            .fillDeeppurple100
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder5),
                                                        child: Stack(children: [
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgVectorPink900,
                                                              height:
                                                                  getVerticalSize(
                                                                      5.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      9.00),
                                                              alignment: Alignment
                                                                  .bottomRight)
                                                        ])))
                                              ])),
                                          Padding(
                                              padding:
                                                  getPadding(left: 16, top: 7),
                                              child: Row(children: [
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 3),
                                                    child: Text("lbl_hidden".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtNotoSerifTeluguRegular12)),
                                                Card(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    elevation: 0,
                                                    margin: getMargin(
                                                        left: 13, top: 2),
                                                    color: ColorConstant
                                                        .deepPurple100,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                    child: Container(
                                                        height: getVerticalSize(
                                                            18.00),
                                                        width:
                                                            getHorizontalSize(
                                                                75.00),
                                                        padding: getPadding(
                                                            left: 5,
                                                            top: 6,
                                                            right: 5,
                                                            bottom: 6),
                                                        decoration: AppDecoration
                                                            .fillDeeppurple100
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder5),
                                                        child: Stack(children: [
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgVectorPink900,
                                                              height:
                                                                  getVerticalSize(
                                                                      5.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      9.00),
                                                              alignment: Alignment
                                                                  .bottomRight)
                                                        ])))
                                              ])),
                                          Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(303.00),
                                              margin:
                                                  getMargin(left: 2, top: 6),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant.red100)),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: getPadding(
                                                      left: 15,
                                                      top: 3,
                                                      right: 13),
                                                  child: Obx(() =>
                                                      ListView.separated(
                                                          physics:
                                                              BouncingScrollPhysics(),
                                                          shrinkWrap: true,
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return SizedBox(
                                                                height:
                                                                    getVerticalSize(
                                                                        2.00));
                                                          },
                                                          itemCount: searchPopuponeModelObj
                                                              .value
                                                              .listlanguageThreeItemList
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            ListlanguageThreeItemModel
                                                                model =
                                                                searchPopuponeModelObj
                                                                    .value
                                                                    .listlanguageThreeItemList[index];
                                                            return ListlanguageThreeItemWidget(
                                                                model);
                                                          })))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    onTapTxtGroup125();
                                                  },
                                                  child: Container(
                                                      width: getHorizontalSize(
                                                          150.00),
                                                      margin: getMargin(
                                                          top: 12, bottom: 4),
                                                      padding: getPadding(
                                                          left: 30,
                                                          top: 1,
                                                          right: 52,
                                                          bottom: 1),
                                                      decoration: AppDecoration
                                                          .txtFillPink900
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .txtCircleBorder10),
                                                      child: Text(
                                                          "lbl_apply".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansBlack12))))
                                        ])))
                          ])),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding:
                                      getPadding(left: 37, top: 23, right: 36),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Obx(() => GridView.builder(
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisExtent: getVerticalSize(
                                                        160.00),
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing:
                                                        getHorizontalSize(
                                                            30.00),
                                                    crossAxisSpacing:
                                                        getHorizontalSize(
                                                            30.00)),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: searchPopuponeModelObj
                                                .value
                                                .gridbusinesscardseven1ItemList
                                                .length,
                                            itemBuilder: (context, index) {
                                              Gridbusinesscardseven1ItemModel
                                                  model =searchPopuponeModelObj
                                                          .value
                                                          .gridbusinesscardseven1ItemList[
                                                      index];
                                              return Gridbusinesscardseven1ItemWidget(
                                                  model);
                                            })),
                                        Padding(
                                            padding: getPadding(top: 21),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Card(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      elevation: 0,
                                                      margin: EdgeInsets.all(0),
                                                      color:
                                                          ColorConstant.gray50,
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: ColorConstant
                                                                  .black900,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00)),
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderTL15),
                                                      child: Container(
                                                          height: getVerticalSize(
                                                              159.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  136.00),
                                                          padding: getPadding(
                                                              top: 8,
                                                              bottom: 8),
                                                          decoration: AppDecoration
                                                              .outlineBlack9001
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .customBorderTL15),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                55),
                                                                        child: Text(
                                                                            "lbl_card_name"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtNunitoSansRegular14.copyWith(letterSpacing: getHorizontalSize(0.36))))),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgLocationthumbnail,
                                                                    height: getVerticalSize(
                                                                        122.00),
                                                                    width: getHorizontalSize(
                                                                        119.00),
                                                                    radius: BorderRadius.circular(
                                                                        getHorizontalSize(
                                                                            5.00)),
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter)
                                                              ]))),
                                                  Card(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      elevation: 0,
                                                      margin: EdgeInsets.all(0),
                                                      color:
                                                          ColorConstant.gray50,
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: ColorConstant
                                                                  .black900,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00)),
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderTL15),
                                                      child: Container(
                                                          height: getVerticalSize(
                                                              159.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  136.00),
                                                          padding: getPadding(
                                                              top: 8,
                                                              bottom: 8),
                                                          decoration: AppDecoration
                                                              .outlineBlack9001
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .customBorderTL15),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child: Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                55),
                                                                        child: Text(
                                                                            "lbl_card_name"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtNunitoSansRegular14.copyWith(letterSpacing: getHorizontalSize(0.36))))),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgLocationthumbnail,
                                                                    height: getVerticalSize(
                                                                        122.00),
                                                                    width: getHorizontalSize(
                                                                        119.00),
                                                                    radius: BorderRadius.circular(
                                                                        getHorizontalSize(
                                                                            5.00)),
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter)
                                                              ])))
                                                ]))
                                      ]))))
                    ]))));
  }

  onTapClose() {
    Get.back();
  }

  onTapTxtGroup125() {
    Get.toNamed(AppRoutes.myDigitalCardsScreen);
  }
}
