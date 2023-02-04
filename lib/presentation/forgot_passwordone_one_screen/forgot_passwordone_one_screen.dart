
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordoneOneScreen
 extends StatefulWidget {
  const ForgotPasswordoneOneScreen
({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _ForgotPasswordoneOneScreen
 createState() => _ForgotPasswordoneOneScreen
();
            }

class _ForgotPasswordoneOneScreen
 extends State<ForgotPasswordoneOneScreen
> {
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
                    height: getVerticalSize(108.00),
                    width: size.width,
                    child: Stack(alignment: Alignment.center, children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100,
                          margin: getMargin(bottom: 14)),
                      AppbarImage(
                          height: getVerticalSize(108.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100)
                    ]))),
            body: Container(
                width: size.width,
                padding: getPadding(left: 31, top: 29, right: 31, bottom: 29),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 23),
                          child: Text("msg_forgot_password".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold20)),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 26),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 20,
                                        top: 18,
                                        right: 20,
                                        bottom: 18),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: Text(
                                                  "lbl_91_9964077688".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold14))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: Text("lbl_phone_email_id".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtNunitoSansRegular12)))
                          ])),
                      Container(
                          height: getVerticalSize(66.00),
                          width: getHorizontalSize(295.00),
                          margin: getMargin(top: 12),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 20,
                                        top: 18,
                                        right: 20,
                                        bottom: 18),
                                    decoration: AppDecoration.outlineGray200
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: Text("lbl_5_4_8_5_4_7".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansBold14))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 28),
                                    child: Text("lbl_otp".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtNunitoSansRegular12)))
                          ])),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_next".tr,
                          margin: getMargin(top: 38, bottom: 5),
                          onTap: onTapNext,
                          alignment: Alignment.center)
                    ]))));
  }

  onTapNext() {
    Navigator.of(context).pushNamed(AppRoutes.forgotPasswordtwoScreen);
  }
}
