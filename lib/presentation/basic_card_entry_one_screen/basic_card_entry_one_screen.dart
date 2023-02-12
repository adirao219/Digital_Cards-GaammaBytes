import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class BasicCardEntryOneScreen extends StatefulWidget {
  const BasicCardEntryOneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BasicCardEntryOneScreen createState() => _BasicCardEntryOneScreen();
}

class _BasicCardEntryOneScreen extends State<BasicCardEntryOneScreen> {
  TextEditingController _card_name_Controller = new TextEditingController();
  TextEditingController _url_Controller = new TextEditingController();
  TextEditingController _template_Controller = new TextEditingController();
  TextEditingController _website_Controller = new TextEditingController();
  TextEditingController _email_id4_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _whatsapp_Controller = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                                          onTap: onTapContrast1),
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
                                margin: getMargin(left: 54, top: 10))
                          ]))
                    ])),
                actions: [
                  // MoreOptionMenu()
                  // AppbarImage(
                  //     height: getVerticalSize(35.00),
                  //     width: getHorizontalSize(43.00),
                  //     svgPath: ImageConstant.imgOverflowmenu,
                  //     margin: getMargin(left: 3, top: 47, right: 3, bottom: 26),
                  //     onTap: onTapOverflowmenu)
                ],
                styleType: Style.bgStyle_14),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 28, right: 27),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 15),
                                      child: Text(
                                          "msg_card_type_ex_buisness".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNunitoBold18))),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _card_name_Controller,
                                  hintText: "lbl_card_name".tr,
                                  margin: getMargin(top: 30),
                                  validator: (value) {
                                    if (!isText(value)) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  }),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _url_Controller,
                                  hintText: "lbl_url".tr,
                                  margin: getMargin(top: 23)),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_select_template".tr,
                                  margin: getMargin(top: 20),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  shape: ButtonShape.RoundedBorder15,
                                  fontStyle: ButtonFontStyle.NunitoSansBold14,
                                  onTap: onTapSelecttemplateOne),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _template_Controller,
                                  hintText: "lbl_template".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _website_Controller,
                                  hintText: "lbl_website".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _email_id4_Controller,
                                  hintText: "lbl_email_id4".tr,
                                  margin: getMargin(top: 23),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _phone_number_Controller,
                                  hintText: "lbl_phone_number".tr,
                                  margin: getMargin(top: 23),
                                  textInputType: TextInputType.phone,
                                  validator: (value) {
                                    if (!isValidPhone(value)) {
                                      return "Please enter valid phone number";
                                    }
                                    return null;
                                  }),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _whatsapp_Controller,
                                  hintText: "lbl_whatsapp".tr,
                                  margin: getMargin(top: 24),
                                  textInputAction: TextInputAction.done),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_next".tr,
                                  margin: getMargin(top: 19),
                                  onTap: onTapNext),
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                onNextClicked: onTapNext,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapSelecttemplateOne() {
    Navigator.of(context).pushNamed(AppRoutes.selectTemplateScreen);
  }

  onTapNext() {
    Navigator.of(context).pushNamed(AppRoutes.cardEntryoneScreen);
  }

  onTapEllipseFour() {
    Navigator.of(context).pop();
  }

  onTapContrast1() {
    Navigator.of(context).pushNamed(AppRoutes.digitalCardOptionsScreen);
  }

  onTapOverflowmenu() {
    Navigator.of(context).pushNamed(AppRoutes.basicCardEntryScreen);
  }
}
