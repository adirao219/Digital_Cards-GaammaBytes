import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AdvancedScreen extends StatefulWidget {
  const AdvancedScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdvancedScreen createState() => _AdvancedScreen();
}

class _AdvancedScreen extends State<AdvancedScreen> {
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
                              left: 38, top: 44, right: 129, bottom: 6),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(children: [
                                Container(
                                    height: getVerticalSize(36.00),
                                    width: getHorizontalSize(38.00),
                                    margin: getMargin(bottom: 7),
                                    child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          AppbarImage(
                                              height: getVerticalSize(36.00),
                                              width: getHorizontalSize(38.00),
                                              svgPath:
                                                  ImageConstant.imgContrast),
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
                                    text: "lbl_advanced".tr.toUpperCase(),
                                    margin: getMargin(left: 56, top: 15))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_28),
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
                      Container(
                          margin: getMargin(top: 77, right: 8),
                          padding: getPadding(
                              left: 37, top: 18, right: 37, bottom: 18),
                          decoration: AppDecoration.outlineBlack9003f4.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: getMargin(bottom: 1),
                                    decoration:
                                        AppDecoration.txtOutlineBlack9003f1,
                                    child: Text("msg_remove_from_google".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtNunitoSansRegular14Pink900
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.36)))),
                                Container(
                                    height: getSize(22.00),
                                    width: getSize(22.00),
                                    margin: getMargin(right: 14, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.deepOrangeA10099,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(5.00)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(2.00),
                                              blurRadius:
                                                  getHorizontalSize(2.00),
                                              offset: Offset(0, 4))
                                        ]))
                              ])),
                      GestureDetector(
                          onTap: () {
                            onTapTxtBtnConfirm();
                          },
                          child: Container(
                              width: getHorizontalSize(250.00),
                              margin: getMargin(left: 30, top: 68, bottom: 5),
                              padding: getPadding(
                                  left: 30, top: 7, right: 97, bottom: 7),
                              decoration: AppDecoration.txtFillPink900.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.txtCircleBorder20),
                              child: Text("lbl_save".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansBlack16)))
                    ]))));
  }

  onTapTxtBtnConfirm() {
    Navigator.of(context).pushNamed(AppRoutes.customizationoneScreen);
  }
}
