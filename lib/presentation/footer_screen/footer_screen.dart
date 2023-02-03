
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class FooterScreen extends StatefulWidget {
  const FooterScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _FooterScreen createState() => _FooterScreen();
            }

class _FooterScreen extends State<FooterScreen> {
 
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
                              left: 38, top: 44, right: 148, bottom: 7),
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
                                text: "lbl_footer2".tr.toUpperCase(),
                                margin: getMargin(left: 71, top: 14))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_25),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 10, right: 24, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_card_name_ex".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold18),
                      CustomDropDown(
                          width: 326,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 25),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPink900)),
                          hintText: "lbl_link_1".tr,
                          margin: getMargin(left: 1, top: 21),
                          items:[],
                          onChanged: (value) {
                            
                          }),
                      CustomDropDown(
                          width: 326,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 25),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPink900)),
                          hintText: "lbl_link_2".tr,
                          margin: getMargin(left: 1, top: 23),
                          items:[],
                          onChanged: (value) {
                            
                          }),
                      CustomDropDown(
                          width: 326,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 25),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPink900)),
                          hintText: "lbl_link_3".tr,
                          margin: getMargin(left: 1, top: 23),
                          items:[],
                          onChanged: (value) {
                            
                          }),
                      CustomDropDown(
                          width: 326,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 25),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPink900)),
                          hintText: "lbl_link_4".tr,
                          margin: getMargin(left: 1, top: 23),
                          items:[],
                          onChanged: (value) {
                            
                          }),
                      CustomDropDown(
                          width: 326,
                          focusNode: FocusNode(),
                          icon: Container(
                              margin: getMargin(left: 30, right: 25),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownPink900)),
                          hintText: "lbl_link_5".tr,
                          margin: getMargin(left: 1, top: 23),
                          items:[],
                          onChanged: (value) {
                            
                          }),
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtBtnConfirm();
                              },
                              child: Container(
                                  width: getHorizontalSize(250.00),
                                  margin: getMargin(bottom: 56),
                                  padding: getPadding(
                                      left: 30, top: 8, right: 93, bottom: 8),
                                  decoration: AppDecoration.txtFillPink900
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .txtCircleBorder20),
                                  child: Text("lbl_save".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansBlack16))))
                    ]))));
  }

  onTapTxtBtnConfirm() {
    Get.toNamed(AppRoutes.customizationoneScreen);
  }
}
