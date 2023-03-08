

import 'package:digitalcardsgaammabytes/presentation/my_digital_cards_screen/widgets/gridbusinesscardseven_item_widget.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import 'models/gridbusinesscardseven_item_model.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'models/my_digital_cards_model.dart';

class MyDigitalCardsScreen extends StatefulWidget {
  const MyDigitalCardsScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _MyDigitalCardsScreen createState() => _MyDigitalCardsScreen();
            }

class _MyDigitalCardsScreen extends State<MyDigitalCardsScreen> {

    Rx<MyDigitalCardsModel> myDigitalCardsModelObj =
      MyDigitalCardsModel().obs;
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
                          width: size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      ImageConstant.imgVectorDeepOrangeA100),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomAppBar(
                                    height: getVerticalSize(94.00),
                                    leadingWidth: 76,
                                    leading: Container(
                                        height: getVerticalSize(36.00),
                                        width: getHorizontalSize(38.00),
                                        margin: getMargin(
                                            left: 38, top: 44, bottom: 14),
                                        child: 
                                        Row(children: [
                                        Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              AppbarImage(
                                                  height:
                                                      getVerticalSize(36.00),
                                                  width:
                                                      getHorizontalSize(38.00),
                                                  svgPath: ImageConstant
                                                      .imgContrast),
                                              AppbarImage(
                                                onTap: (){
                                                  Navigator.of(context).pop();
                                                },
                                                  height:
                                                      getVerticalSize(10.00),
                                                  width:
                                                      getHorizontalSize(5.00),
                                                  svgPath: ImageConstant
                                                      .imgVectorstroke,
                                                  margin: getMargin(
                                                      left: 15,
                                                      top: 13,
                                                      right: 18,
                                                      bottom: 13))
                                            ]),
                                            
                                             AppbarSubtitle(
                                text: "lbl_my_digitalcards".tr,
                                margin:
                                    getMargin(left: 40, top: 10)),
                                            ])),
                                    actions: [
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: getMargin(
                                              left: 35,
                                              top: 50,
                                              right: 35,
                                              bottom: 15),
                                          color: ColorConstant.gray50,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(5.00))),
                                          child: Container(
                                              height: getVerticalSize(29.00),
                                              width: getHorizontalSize(31.00),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant.gray50,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              5.00))),
                                              child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgSearch,
                                                        height: getVerticalSize(
                                                            17.00),
                                                        width:
                                                            getHorizontalSize(
                                                                16.00),
                                                        alignment:
                                                            Alignment.center,
                                                        margin: getMargin(
                                                            left: 7,
                                                            top: 6,
                                                            right: 8,
                                                            bottom: 6)),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgSearch,
                                                        height: getVerticalSize(
                                                            17.00),
                                                        width:
                                                            getHorizontalSize(
                                                                16.00),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: getMargin(
                                                            left: 7,
                                                            top: 6,
                                                            right: 8,
                                                            bottom: 6))
                                                  ])))
                                    ],
                                    styleType: Style.bgStyle_7)
                              ])),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding:
                                      getPadding(left: 37, top:20, right: 36),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomButton(
                                            height: 57,
                                            width: 237,
                                            text: "msg_create_digital".tr,
                                            margin: getMargin(right: 24),
                                            variant:
                                                ButtonVariant.OutlineBlack9003f,
                                            shape: ButtonShape.RoundedBorder28,
                                            padding: ButtonPadding.PaddingAll18,
                                            fontStyle:
                                                ButtonFontStyle.NovaCut16,
                                            onTap: onTapCreatedigitalcard),
                                        Padding(
                                            padding: getPadding(top: 0),
                                            child: Obx(() => GridView.builder(
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
                                                itemCount: myDigitalCardsModelObj
                                                    .value
                                                    .gridbusinesscardsevenItemList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  GridbusinesscardsevenItemModel
                                                      model = myDigitalCardsModelObj
                                                          .value
                                                          .gridbusinesscardsevenItemList[index];
                                                  return GridbusinesscardsevenItemWidget(
                                                      model);
                                                }))),
                                        Padding(
                                            padding: getPadding(top: 59),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                  Container(
                                                      height: getVerticalSize(
                                                          122.00),
                                                      width: getHorizontalSize(
                                                          128.00),
                                                      margin: getMargin(
                                                          top: 8, bottom: 29),
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          children: [
                                                            Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child: Padding(
                                                                    padding: getPadding(
                                                                        bottom:
                                                                            34),
                                                                    child: Text(
                                                                        "lbl_card_name"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoSansRegular14
                                                                            .copyWith(letterSpacing: getHorizontalSize(0.36))))),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgLocationthumbnail,
                                                                height:
                                                                    getVerticalSize(
                                                                        122.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        119.00),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            5.00)),
                                                                alignment: Alignment
                                                                    .centerLeft)
                                                          ]))
                                                ]))
                                      ]))))
                    ]))));
  }

  onTapCreatedigitalcard() {
    Get.toNamed(AppRoutes.digitalCardOptionsScreen);
  }
}
