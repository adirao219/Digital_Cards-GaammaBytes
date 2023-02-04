
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HelponeScreen extends StatefulWidget {
  const HelponeScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _HelponeScreen createState() => _HelponeScreen();
            }

class _HelponeScreen extends State<HelponeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            body: Container(
                height: getVerticalSize(1651.00),
                width: size.width,
                child: Stack(alignment: Alignment.center, children: [
                  CustomAppBar(
                      height: getVerticalSize(108.00),
                      centerTitle: true,
                      title: Container(
                          height: getVerticalSize(94.00),
                          width: size.width,
                          child: Stack(children: [
                            AppbarImage(
                                height: getVerticalSize(94.00),
                                width: getHorizontalSize(375.00),
                                imagePath:
                                    ImageConstant.imgVectorDeepOrangeA100),
                            Padding(
                                padding: getPadding(
                                    left: 38, top: 44, right: 147, bottom: 2),
                                child: Row(children: [
                                  Container(
                                      height: getVerticalSize(36.00),
                                      width: getHorizontalSize(38.00),
                                      margin: getMargin(bottom: 11),
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
                                                svgPath: ImageConstant
                                                    .imgVectorstroke,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                                margin: getMargin(
                                                    left: 15,
                                                    top: 13,
                                                    right: 18,
                                                    bottom: 13))
                                          ])),
                                  AppbarTitle(
                                      text: "lbl_help".tr.toUpperCase(),
                                      margin: getMargin(left: 99, top: 19))
                                ]))
                          ])),
                      styleType: Style.bgStyle_24),
                  CustomImageView(
                      imagePath: ImageConstant.imgHelp1,
                      height: getVerticalSize(1415.00),
                      width: getHorizontalSize(375.00),
                      alignment: Alignment.center)
                ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 62, right: 63),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                      height: 40,
                      width: 250,
                      text: "lbl_ok".tr,
                      fontStyle: ButtonFontStyle.NunitoSansBlack16,
                      onTap: onTapOk)
                ]))));
  }

  onTapOk() {
    Navigator.of(context).pushNamed(AppRoutes.myDigitalCardsScreen);
  }
}
