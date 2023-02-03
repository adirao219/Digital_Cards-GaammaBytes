
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _CustomizationScreen createState() => _CustomizationScreen();
            }

class _CustomizationScreen extends State<CustomizationScreen> {
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
                                          onTap: onTapContrast6),
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
                styleType: Style.bgStyle_19),
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
                                  width: getHorizontalSize(267.00),
                                  margin: getMargin(left: 9),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_card_type_ex_new2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                            text: "msg_template_type2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600))
                                      ]),
                                      textAlign: TextAlign.left)),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtGroupThirtyFour();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(325.00),
                                      margin: getMargin(top: 32),
                                      padding: getPadding(
                                          left: 30,
                                          top: 17,
                                          right: 101,
                                          bottom: 17),
                                      decoration: AppDecoration
                                          .txtOutlineBlack9003f
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtRoundedBorder15),
                                      child: Text("lbl_card_preview2".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtNunitoSansBold16Pink900
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.36))))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(94.00),
                                      width: getHorizontalSize(105.00),
                                      margin: getMargin(top: 435),
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
                                                        height: getVerticalSize(
                                                            94.00),
                                                        width:
                                                            getHorizontalSize(
                                                                105.00),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .pink900,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        52.00)))))),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgHomeWhiteA700,
                                                height: getVerticalSize(25.00),
                                                width: getHorizontalSize(27.00),
                                                alignment: Alignment.topCenter,
                                                margin: getMargin(top: 33))
                                          ])))
                            ])))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  onTapTxtGroupThirtyFour() {
    Get.toNamed(AppRoutes.cardPreviewoneScreen);
  }

  onTapEllipseFour() {
    Get.toNamed(AppRoutes.homePageScreen);
  }

  onTapContrast6() {
    Get.toNamed(AppRoutes.basicGreetingEntryScreen);
  }
}
