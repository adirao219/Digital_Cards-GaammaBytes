import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CardEntryoneScreen extends StatefulWidget {
  const CardEntryoneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardEntryoneScreen createState() => _CardEntryoneScreen();
}

class _CardEntryoneScreen extends State<CardEntryoneScreen> {
  TextEditingController _field1_Controller = new TextEditingController();
  TextEditingController _field2_Controller = new TextEditingController();
  TextEditingController _field3_Controller = new TextEditingController();
  TextEditingController _field4_Controller = new TextEditingController();
  TextEditingController _field5_Controller = new TextEditingController();
  TextEditingController _field6_Controller = new TextEditingController();
  TextEditingController _field7_Controller = new TextEditingController();
  TextEditingController _field8_Controller = new TextEditingController();
  TextEditingController _field9_Controller = new TextEditingController();
  TextEditingController _field10_Controller = new TextEditingController();
  TextEditingController _field11_Controller = new TextEditingController();
  TextEditingController _field12_Controller = new TextEditingController();
  TextEditingController _field13_Controller = new TextEditingController();
  TextEditingController _field14_Controller = new TextEditingController();
  TextEditingController _field15_Controller = new TextEditingController();
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
                                          onTap: onTapContrast2),
                                      AppbarImage(
                                          height: getVerticalSize(10.00),
                                          width: getHorizontalSize(5.00),
                                          svgPath:
                                              ImageConstant.imgVectorstroke,
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
                                text: "lbl_card_details".tr.toUpperCase(),
                                margin: getMargin(left: 54, top: 14))
                          ]))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_15),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 31, right: 25),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      width: getHorizontalSize(266.00),
                                      margin: getMargin(left: 14),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "msg_card_type_ex_buisness2"
                                                        .tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.pink900,
                                                    fontSize: getFontSize(18),
                                                    fontFamily: 'Nunito',
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            TextSpan(
                                                text: "msg_template_type".tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.pink900,
                                                    fontSize: getFontSize(18),
                                                    fontFamily: 'Nunito',
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ]),
                                          textAlign: TextAlign.left))),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field1_Controller,
                                  hintText: "lbl_field1".tr,
                                  margin: getMargin(top: 29)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field2_Controller,
                                  hintText: "lbl_field2".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field3_Controller,
                                  hintText: "lbl_field3".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field4_Controller,
                                  hintText: "lbl_field4".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field5_Controller,
                                  hintText: "lbl_field5".tr,
                                  margin: getMargin(top: 16)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field6_Controller,
                                  hintText: "lbl_field6".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field7_Controller,
                                  hintText: "lbl_field7".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field8_Controller,
                                  hintText: "lbl_field8".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field9_Controller,
                                  hintText: "lbl_field9".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field10_Controller,
                                  hintText: "lbl_field10".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field11_Controller,
                                  hintText: "lbl_field11".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field12_Controller,
                                  hintText: "lbl_field12".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field13_Controller,
                                  hintText: "lbl_field13".tr,
                                  margin: getMargin(top: 25)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field14_Controller,
                                  hintText: "lbl_field14".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _field15_Controller,
                                  hintText: "lbl_field15".tr,
                                  margin: getMargin(top: 23),
                                  textInputAction: TextInputAction.done),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_next".tr,
                                  margin: getMargin(top: 24),
                                  onTap: onTapNext),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                onNextClicked: onTapNext,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapNext() {
    Navigator.of(context).pushNamed(AppRoutes.cardEntrytwoScreen);
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast2() {
    Navigator.of(context).pushNamed(AppRoutes.basicCardEntryScreen);
  }
}
