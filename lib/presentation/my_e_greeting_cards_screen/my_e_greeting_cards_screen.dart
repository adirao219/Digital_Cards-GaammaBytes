import 'package:digitalcards_gaammabytes/presentation/my_e_greeting_cards_screen/widgets/gridchristmasthumbnail_item_widget.dart';

import 'models/gridchristmasthumbnail_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'models/my_e_greeting_cards_model.dart';

class MyEGreetingCardsScreen extends StatefulWidget {
  const MyEGreetingCardsScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _MyEGreetingCardsScreen createState() => _MyEGreetingCardsScreen();
            }

class _MyEGreetingCardsScreen extends State<MyEGreetingCardsScreen> {
  
    Rx<MyEGreetingCardsModel> myEGreetingCardsModelObj =
      MyEGreetingCardsModel().obs;
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
                      Container(
                          height: getVerticalSize(36.00),
                          width: getHorizontalSize(38.00),
                          margin: getMargin(
                              left: 38, top: 44, right: 299, bottom: 14),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            AppbarImage(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                svgPath: ImageConstant.imgContrast),
                            AppbarImage(
                                height: getVerticalSize(10.00),
                                width: getHorizontalSize(5.00),
                                svgPath: ImageConstant.imgVectorstroke,
                                margin: getMargin(
                                    left: 15, top: 13, right: 18, bottom: 13))
                          ]))
                    ])),
                actions: [
                  Container(
                      margin:
                          getMargin(left: 35, top: 50, right: 35, bottom: 29),
                      padding: getPadding(left: 7, top: 6, right: 7, bottom: 6),
                      decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSearch,
                                height: getVerticalSize(17.00),
                                width: getHorizontalSize(16.00),
                                alignment: Alignment.centerLeft,
                                margin: getMargin(
                                    left: 7, top: 6, right: 8, bottom: 6),
                                onTap: () {
                                  onTapImgSearch();
                                })
                          ]))
                ],
                styleType: Style.bgStyle_8),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 40, top: 47, right: 33),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomButton(
                                  height: 57,
                                  width: 237,
                                  text: "msg_create_e_greeting".tr,
                                  variant: ButtonVariant.OutlineBlack9003f,
                                  shape: ButtonShape.RoundedBorder28,
                                  padding: ButtonPadding.PaddingAll18,
                                  fontStyle: ButtonFontStyle.NovaCut16,
                                  onTap: onTapCreateegreetingcard),
                              Padding(
                                  padding: getPadding(top: 29),
                                  child: Obx(() => GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent:
                                                  getVerticalSize(159.00),
                                              crossAxisCount: 2,
                                              mainAxisSpacing:
                                                  getHorizontalSize(30.00),
                                              crossAxisSpacing:
                                                  getHorizontalSize(30.00)),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: myEGreetingCardsModelObj
                                          .value
                                          .gridchristmasthumbnailItemList
                                          .length,
                                      itemBuilder: (context, index) {
                                        GridchristmasthumbnailItemModel model =
                                            myEGreetingCardsModelObj
                                                    .value
                                                    .gridchristmasthumbnailItemList[
                                                index];
                                        return GridchristmasthumbnailItemWidget(
                                            model);
                                      }))),
                              Padding(
                                  padding: getPadding(top: 56),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: getVerticalSize(159.00),
                                            width: getHorizontalSize(135.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Card(
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          elevation: 0,
                                                          margin:
                                                              EdgeInsets.all(0),
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          shape: RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: ColorConstant
                                                                      .black900,
                                                                  width: getHorizontalSize(
                                                                      1.00)),
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .customBorderTL15),
                                                          child: Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      158.00),
                                                              width: getHorizontalSize(
                                                                  135.00),
                                                              padding: getPadding(
                                                                  all: 6),
                                                              decoration: AppDecoration
                                                                  .outlineBlack9002
                                                                  .copyWith(
                                                                      borderRadius: BorderRadiusStyle
                                                                          .customBorderTL15),
                                                              child: Stack(
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgDiwalithumbnail,
                                                                        height: getVerticalSize(
                                                                            120.00),
                                                                        width: getHorizontalSize(
                                                                            122.00),
                                                                        radius: BorderRadius.circular(getHorizontalSize(
                                                                            5.00)),
                                                                        alignment:
                                                                            Alignment.topCenter)
                                                                  ])))),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text(
                                                          "lbl_card_name".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansRegular14
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36))))
                                                ])),
                                        Container(
                                            height: getVerticalSize(159.00),
                                            width: getHorizontalSize(135.00),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Card(
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          elevation: 0,
                                                          margin:
                                                              EdgeInsets.all(0),
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          shape: RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: ColorConstant
                                                                      .black900,
                                                                  width: getHorizontalSize(
                                                                      1.00)),
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .customBorderTL15),
                                                          child: Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      158.00),
                                                              width: getHorizontalSize(
                                                                  135.00),
                                                              padding: getPadding(
                                                                  all: 6),
                                                              decoration: AppDecoration
                                                                  .outlineBlack9002
                                                                  .copyWith(
                                                                      borderRadius: BorderRadiusStyle
                                                                          .customBorderTL15),
                                                              child: Stack(
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgDiwalithumbnail,
                                                                        height: getVerticalSize(
                                                                            120.00),
                                                                        width: getHorizontalSize(
                                                                            122.00),
                                                                        radius: BorderRadius.circular(getHorizontalSize(
                                                                            5.00)),
                                                                        alignment:
                                                                            Alignment.topCenter)
                                                                  ])))),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text(
                                                          "lbl_card_name".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansRegular14
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36))))
                                                ]))
                                      ]))
                            ]))))));
  }

  onTapCreateegreetingcard() {
    Get.toNamed(AppRoutes.eGreetingCardOptionsScreen);
  }

  onTapImgSearch() {
    Get.toNamed(AppRoutes.searchPopuptwoScreen);
  }
}
