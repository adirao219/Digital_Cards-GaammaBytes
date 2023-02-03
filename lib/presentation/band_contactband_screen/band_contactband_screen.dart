
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BandContactbandScreen extends StatefulWidget {
  const BandContactbandScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _BandContactbandScreen createState() => _BandContactbandScreen();
            }

class _BandContactbandScreen extends State<BandContactbandScreen> {
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
                              left: 38, top: 44, right: 151, bottom: 5),
                          child: Row(children: [
                            Container(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                margin: getMargin(bottom: 8),
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
                                text: "lbl_bands2".tr.toUpperCase(),
                                margin: getMargin(left: 76, top: 16))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenu,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_37),
            body: Container(
                width: size.width,
                padding: getPadding(left: 36, top: 20, right: 36, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(286.00),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_card_name_ex3".tr,
                                    style: TextStyle(
                                        color: ColorConstant.pink900,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: "msg_band_type_ex_contactband".tr,
                                    style: TextStyle(
                                        color: ColorConstant.pink900,
                                        fontSize: getFontSize(18),
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w600))
                              ]),
                              textAlign: TextAlign.left)),
                      Spacer(),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_save".tr,
                          margin: getMargin(bottom: 56),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapSave,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapSave() {
    Get.toNamed(AppRoutes.bandsScreen);
  }
}
