
import 'package:digitalcards_gaammabytes/presentation/card_entrytwo_screen/widgets/card_entrytwo_item_widget.dart';

import 'models/card_entrytwo_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'models/card_entrytwo_model.dart';

class CardEntrytwoScreen extends StatefulWidget {
  const CardEntrytwoScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _CardEntrytwoScreen createState() => _CardEntrytwoScreen();
            }

class _CardEntrytwoScreen extends State<CardEntrytwoScreen> {
   Rx<CardEntrytwoModel> cardEntrytwoModelObj =
      CardEntrytwoModel().obs;
  TextEditingController _latitude_Controller = new TextEditingController();
  TextEditingController _longitude_Controller = new TextEditingController();
  TextEditingController _card_color_Controller = new TextEditingController();
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
                                          onTap: onTapContrast3),
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
                styleType: Style.bgStyle_16),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 22, top: 31, right: 9),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(266.00),
                                  margin: getMargin(left: 14),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_card_type_ex_buisness2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                            text: "msg_template_type".tr,
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600))
                                      ]),
                                      textAlign: TextAlign.left)),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Text("lbl_location".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoSansRegular14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.36)))),
                              CustomImageView(
                                  imagePath: ImageConstant.imgScreenshot55,
                                  height: getVerticalSize(171.00),
                                  width: getHorizontalSize(344.00),
                                  margin: getMargin(top: 22)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _latitude_Controller,
                                  hintText: "lbl_latitude".tr,
                                  margin: getMargin(top: 23)),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _longitude_Controller,
                                  hintText: "lbl_longitude".tr,
                                  margin: getMargin(top: 24)),
                              Padding(
                                  padding:
                                      getPadding(left: 6, top: 17, right: 49),
                                  child: Obx(() => ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return Container(
                                            height: getVerticalSize(1.00),
                                            width: getHorizontalSize(326.00),
                                            decoration: BoxDecoration(
                                                color: ColorConstant.gray300Cc,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            1.00))));
                                      },
                                      itemCount: 
                                          cardEntrytwoModelObj.value.cardEntrytwoItemList.length,
                                      itemBuilder: (context, index) {
                                        CardEntrytwoItemModel model =cardEntrytwoModelObj
                                            .value
                                            .cardEntrytwoItemList[index];
                                        return CardEntrytwoItemWidget(model,
                                            onTapSelectimage: onTapSelectimage);
                                      }))),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 2, top: 14),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Container(
                                  height: getVerticalSize(76.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 2, top: 22),
                                  child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        CustomTextFormField(
                                            width: 326,
                                            focusNode: FocusNode(),
                                            controller:
                                                _card_color_Controller,
                                            hintText: "lbl_card_color".tr,
                                            margin: getMargin(top: 1),
                                            textInputAction:
                                                TextInputAction.done,
                                            alignment: Alignment.topCenter),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgC1,
                                            height: getVerticalSize(76.00),
                                            width: getHorizontalSize(236.00),
                                            alignment: Alignment.centerRight)
                                      ])),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_next".tr,
                                  margin: getMargin(left: 40, top: 45),
                                  onTap: onTapNext),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(94.00),
                                      width: getHorizontalSize(105.00),
                                      margin: getMargin(top: 23),
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

  onTapSelectimage() {
    Get.toNamed(AppRoutes.imageModifyoneScreen);
  }

  onTapNext() {
    Get.toNamed(AppRoutes.customizationoneScreen);
  }

  onTapEllipseFour() {
    Get.toNamed(AppRoutes.homePageScreen);
  }

  onTapContrast3() {
    Get.toNamed(AppRoutes.cardEntryoneScreen);
  }
}
