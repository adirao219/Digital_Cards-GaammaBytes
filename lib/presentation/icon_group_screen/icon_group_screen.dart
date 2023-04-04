import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class IconGroupScreen extends StatefulWidget {
  const IconGroupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IconGroupScreen createState() => _IconGroupScreen();
}

class _IconGroupScreen extends State<IconGroupScreen> {
  TextEditingController _name2_Controller = new TextEditingController();
  TextEditingController _link7_Controller = new TextEditingController();
  TextEditingController _link8_Controller = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                              left: 38, top: 43, right: 123, bottom: 14),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(children: [
                                Container(
                                    height: getVerticalSize(36.00),
                                    width: getHorizontalSize(38.00),
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
                                    text: "lbl_icon_group".tr.toUpperCase(),
                                    margin: getMargin(left: 48, bottom: 8))
                              ])))
                    ])),
                actions: [
                  AppbarImage(
                      height: getSize(28.00),
                      width: getSize(28.00),
                      svgPath: ImageConstant.imgComputer,
                      margin:
                          getMargin(left: 32, top: 51, right: 32, bottom: 29))
                ],
                styleType: Style.bgStyle_26),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 23, top: 10, right: 23, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("msg_card_name_ex".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoBold18)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _name2_Controller,
                              hintText: "lbl_name2".tr,
                              margin: getMargin(top: 5),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(left: 45, top: 10, right: 25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 1),
                                        child: Text("lbl_link_1".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(8.00),
                                        width: getHorizontalSize(15.00),
                                        margin: getMargin(top: 13))
                                  ])),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(top: 11),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray300Cc,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00)))),
                          Padding(
                              padding: getPadding(left: 45, top: 17, right: 25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 3),
                                        child: Text("lbl_link_2".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(8.00),
                                        width: getHorizontalSize(15.00),
                                        margin: getMargin(top: 14))
                                  ])),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(top: 8),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray300Cc,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00)))),
                          Padding(
                              padding: getPadding(left: 45, top: 17, right: 25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 4),
                                        child: Text("lbl_link_3".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(8.00),
                                        width: getHorizontalSize(15.00),
                                        margin: getMargin(top: 15))
                                  ])),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(top: 7),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray300Cc,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00)))),
                          Padding(
                              padding: getPadding(left: 45, top: 17, right: 25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 2),
                                        child: Text("lbl_link_4".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(8.00),
                                        width: getHorizontalSize(15.00),
                                        margin: getMargin(top: 14))
                                  ])),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(top: 9),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray300Cc,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00)))),
                          Padding(
                              padding: getPadding(left: 45, top: 17, right: 25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 4),
                                        child: Text("lbl_link_5".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(8.00),
                                        width: getHorizontalSize(15.00),
                                        margin: getMargin(top: 15))
                                  ])),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(top: 8),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray300Cc,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(1.00)))),
                          Container(
                              height: getVerticalSize(133.00),
                              width: getHorizontalSize(326.00),
                              margin: getMargin(top: 14),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                        width: getHorizontalSize(15.00),
                                        margin:
                                            getMargin(right: 25, bottom: 11),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPink900,
                                                  height: getVerticalSize(8.00),
                                                  width:
                                                      getHorizontalSize(15.00)),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownPink900,
                                                  height: getVerticalSize(8.00),
                                                  width:
                                                      getHorizontalSize(15.00),
                                                  margin: getMargin(top: 39))
                                            ]))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 44, right: 25),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            bottom: 3),
                                                        child: Text(
                                                            "lbl_link_6".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtNunitoSansRegular14
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.36)))),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdownPink900,
                                                        height: getVerticalSize(
                                                            8.00),
                                                        width:
                                                            getHorizontalSize(
                                                                15.00),
                                                        margin:
                                                            getMargin(top: 14))
                                                  ])),
                                          Container(
                                              height: getVerticalSize(1.00),
                                              width: getHorizontalSize(326.00),
                                              margin: getMargin(top: 9),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.gray300Cc,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              1.00)))),
                                          CustomTextFormField(
                                              width: 326,
                                              focusNode: FocusNode(),
                                              controller: _link7_Controller,
                                              hintText: "lbl_link_7".tr,
                                              margin: getMargin(top: 17)),
                                          CustomTextFormField(
                                              width: 326,
                                              focusNode: FocusNode(),
                                              controller: _link8_Controller,
                                              hintText: "lbl_link_8".tr,
                                              margin: getMargin(top: 17),
                                              textInputAction:
                                                  TextInputAction.done)
                                        ]))
                              ])),
                          Padding(
                              padding: getPadding(left: 1, top: 24),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                        height: 40,
                                        width: 148,
                                        text: "lbl_other_links".tr,
                                        padding: ButtonPadding.PaddingT9,
                                        prefixWidget: Container(
                                            margin: getMargin(right: 10),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgSearchWhiteA700)),
                                        onTap: onTapOtherlinks),
                                    Container(
                                        padding: getPadding(
                                            left: 37,
                                            top: 9,
                                            right: 37,
                                            bottom: 9),
                                        decoration: AppDecoration.fillPink900
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgPlus,
                                                  height:
                                                      getVerticalSize(12.00),
                                                  width:
                                                      getHorizontalSize(14.00),
                                                  margin: getMargin(
                                                      top: 5, bottom: 4)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 22, top: 1),
                                                  child: Text("lbl_new".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNunitoSansBlack14))
                                            ]))
                                  ])),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtBtnConfirm();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(241.00),
                                      margin: getMargin(top: 25, bottom: 5),
                                      padding: getPadding(
                                          left: 30,
                                          top: 8,
                                          right: 93,
                                          bottom: 8),
                                      decoration: AppDecoration.txtFillPink900
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtCircleBorder20),
                                      child: Text("lbl_save".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtNunitoSansBlack16))))
                        ])))));
  }

  onTapOtherlinks() {
    Navigator.of(context).pushNamed(AppRoutes.linkScreen);
  }

  onTapTxtBtnConfirm() {
    Navigator.of(context).pushNamed(AppRoutes.customizationoneScreen);
  }
}
