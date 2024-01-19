import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class BandBankaCdetailsScreen extends StatefulWidget {
  const BandBankaCdetailsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BandBankaCdetailsScreen createState() => _BandBankaCdetailsScreen();
}

class _BandBankaCdetailsScreen extends State<BandBankaCdetailsScreen> {
  TextEditingController _a_c_holder_name_Controller =
      new TextEditingController();
  TextEditingController _bank_name_Controller = new TextEditingController();
  TextEditingController _branch_name_Controller = new TextEditingController();
  TextEditingController _a_c_type_Controller = new TextEditingController();
  TextEditingController _a_c_number_Controller = new TextEditingController();
  TextEditingController _ifsc_code_Controller = new TextEditingController();
  TextEditingController _micr_code_Controller = new TextEditingController();
  TextEditingController _swift_code_Controller = new TextEditingController();
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
                              left: 38, top: 44, right: 151, bottom: 5),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
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
                                    text: "lbl_bands2".tr,
                                    margin: getMargin(left: 76, top: 16))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_39),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 24, top: 20, right: 24, bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: getHorizontalSize(286.00),
                              margin: getMargin(left: 12),
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
                                        text: "msg_band_type_ex_bank".tr,
                                        style: TextStyle(
                                            color: ColorConstant.pink900,
                                            fontSize: getFontSize(18),
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                        text: "lbl4".tr,
                                        style: TextStyle(
                                            color: ColorConstant.pink900,
                                            fontSize: getFontSize(18),
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w600))
                                  ]),
                                  textAlign: TextAlign.left)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _a_c_holder_name_Controller,
                              hintText: "msg_a_c_holder_name".tr,
                              margin: getMargin(left: 1, top: 26),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _bank_name_Controller,
                              hintText: "lbl_bank_name".tr,
                              margin: getMargin(left: 1, top: 23),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _branch_name_Controller,
                              hintText: "lbl_branch_name".tr,
                              margin: getMargin(left: 1, top: 23),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _a_c_type_Controller,
                              hintText: "lbl_a_c_type".tr,
                              margin: getMargin(left: 1, top: 23)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _a_c_number_Controller,
                              hintText: "lbl_a_c_number".tr,
                              margin: getMargin(left: 1, top: 23),
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _ifsc_code_Controller,
                              hintText: "lbl_ifsc_code".tr,
                              margin: getMargin(left: 1, top: 23)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _micr_code_Controller,
                              hintText: "lbl_micr_code".tr,
                              margin: getMargin(left: 1, top: 23)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _swift_code_Controller,
                              hintText: "lbl_swift_code".tr,
                              margin: getMargin(left: 1, top: 23),
                              textInputAction: TextInputAction.done),
                          CustomButton(
                              height: 40,
                              width: 250,
                              text: "lbl_save".tr,
                              margin: getMargin(top: 33, bottom: 5),
                              fontStyle: ButtonFontStyle.NunitoSansBlack16,
                              onTap: onTapSave,
                              alignment: Alignment.center)
                        ])))));
  }

  onTapSave() {
    Navigator.of(context).pushNamed(AppRoutes.bandsScreen);
  }
}
