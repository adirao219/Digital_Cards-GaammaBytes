
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:digitalcardsgaammabytes/domain/facebookauth/facebook_auth_helper.dart';

class LinkScreen extends StatefulWidget {
  const LinkScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _LinkScreen createState() => _LinkScreen();
            }

class _LinkScreen extends State<LinkScreen> {
  TextEditingController _twitter_Controller = new TextEditingController();
  TextEditingController _instagram_Controller = new TextEditingController();
  TextEditingController _linkedin_Controller = new TextEditingController();
  TextEditingController _pinterest_Controller = new TextEditingController();
  TextEditingController _other_Controller = new TextEditingController();
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
                              left: 38, top: 44, right: 165, bottom: 6),
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
                                          svgPath: ImageConstant
                                              .imgContrastWhiteA700),
                                      AppbarImage(
                                          height: getVerticalSize(10.00),
                                          width: getHorizontalSize(5.00),
                                          svgPath: ImageConstant
                                              .imgVectorstrokeGray90005,
                                          margin: getMargin(
                                              left: 15,
                                              top: 13,
                                              right: 18,
                                              bottom: 13))
                                    ])),
                            AppbarTitle(
                                text: "lbl_link".tr.toUpperCase(),
                                margin: getMargin(left: 88, top: 15))
                          ]))
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(35.00),
                      width: getHorizontalSize(43.00),
                      svgPath: ImageConstant.imgOverflowmenuGray80001,
                      margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                ],
                styleType: Style.bgStyle_27),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 24, top: 10, right: 19, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("msg_card_name_ex".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoBold18),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _twitter_Controller,
                                  hintText: "lbl_twitter".tr,
                                  margin: getMargin(left: 1, top: 20),
                                  prefix: Container(
                                      padding: getPadding(
                                          left: 5, top: 6, right: 5, bottom: 6),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue500,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgTwitter)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowplus();
                                  },
                                  child: Padding(
                                      padding: getPadding(left: 1, top: 22),
                                      child: Row(children: [
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: EdgeInsets.all(0),
                                            color: ColorConstant.blueA400,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                            child: Container(
                                                height: getSize(22.00),
                                                width: getSize(22.00),
                                                padding: getPadding(all: 5),
                                                decoration: AppDecoration
                                                    .fillBlueA400
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Stack(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgPlusWhiteA700,
                                                      height: getSize(11.00),
                                                      width: getSize(11.00),
                                                      alignment:
                                                          Alignment.center)
                                                ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 22, top: 1),
                                            child: Text("lbl_facebook".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansRegular14
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36))))
                                      ]))),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _instagram_Controller,
                                  hintText: "lbl_instagram".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 12),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.pinkA400,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgInstagram)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(34.00))),
                              CustomTextFormField(
                                  width: 331,
                                  focusNode: FocusNode(),
                                  controller: _linkedin_Controller,
                                  hintText: "lbl_linkedin".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue800,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgLinkedin)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              Padding(
                                  padding: getPadding(left: 1, top: 22),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgBg,
                                        height: getSize(22.00),
                                        width: getSize(22.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(3.00))),
                                    Padding(
                                        padding: getPadding(left: 22, top: 2),
                                        child: Text("lbl_snapchat".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36))))
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Padding(
                                  padding: getPadding(left: 1, top: 22),
                                  child: Row(children: [
                                    Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.all(0),
                                        color: ColorConstant.gray5003,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5),
                                        child: Container(
                                            height: getSize(22.00),
                                            width: getSize(22.00),
                                            padding: getPadding(all: 5),
                                            decoration: AppDecoration
                                                .fillGray5003
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogle,
                                                      height: getSize(5.00),
                                                      width: getSize(5.00),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      margin:
                                                          getMargin(bottom: 1)),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogleGreen600,
                                                      height:
                                                          getVerticalSize(4.00),
                                                      width: getHorizontalSize(
                                                          8.00),
                                                      alignment:
                                                          Alignment.bottomLeft),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogleAmber500,
                                                      height:
                                                          getVerticalSize(4.00),
                                                      width: getHorizontalSize(
                                                          2.00),
                                                      alignment:
                                                          Alignment.centerLeft),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogleRed500,
                                                      height:
                                                          getVerticalSize(4.00),
                                                      width: getHorizontalSize(
                                                          8.00),
                                                      alignment:
                                                          Alignment.topLeft)
                                                ]))),
                                    Padding(
                                        padding: getPadding(left: 22, top: 2),
                                        child: Text("lbl_google".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36))))
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Padding(
                                  padding: getPadding(left: 1, top: 22),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgBg22x22,
                                        height: getSize(22.00),
                                        width: getSize(22.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(3.00))),
                                    Padding(
                                        padding: getPadding(left: 22, top: 2),
                                        child: Text("lbl_foursquare".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36))))
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Padding(
                                  padding: getPadding(left: 1, top: 22),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgBg1,
                                        height: getSize(22.00),
                                        width: getSize(22.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(3.00))),
                                    Padding(
                                        padding: getPadding(left: 22, top: 2),
                                        child: Text("lbl_blog".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36))))
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _pinterest_Controller,
                                  hintText: "lbl_pinterest".tr,
                                  margin: getMargin(left: 1, top: 22),
                                  prefix: Container(
                                      padding: getPadding(all: 5),
                                      margin: getMargin(right: 22, bottom: 13),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.redA700,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3.00))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgSettings)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(35.00))),
                              Padding(
                                  padding: getPadding(left: 1, top: 22),
                                  child: Row(children: [
                                    Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.all(0),
                                        color: ColorConstant.redA70001,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder5),
                                        child: Container(
                                            height: getSize(22.00),
                                            width: getSize(22.00),
                                            padding: getPadding(
                                                left: 5,
                                                top: 7,
                                                right: 5,
                                                bottom: 7),
                                            decoration: AppDecoration
                                                .fillRedA70001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Stack(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgYoutube,
                                                  height: getVerticalSize(7.00),
                                                  width:
                                                      getHorizontalSize(11.00),
                                                  alignment: Alignment.center)
                                            ]))),
                                    Padding(
                                        padding: getPadding(left: 21, top: 1),
                                        child: Text("lbl_youtube".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36))))
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              Padding(
                                  padding: getPadding(left: 1, top: 22),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgBg2,
                                        height: getSize(22.00),
                                        width: getSize(22.00),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(3.00))),
                                    Padding(
                                        padding: getPadding(left: 22, top: 2),
                                        child: Text("lbl_meetup".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNunitoSansRegular14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36))))
                                  ])),
                              Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(326.00),
                                  margin: getMargin(left: 1, top: 11),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray300Cc,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1.00)))),
                              CustomTextFormField(
                                  width: 326,
                                  focusNode: FocusNode(),
                                  controller: _other_Controller,
                                  hintText: "lbl_other".tr,
                                  margin: getMargin(left: 1, top: 23),
                                  textInputAction: TextInputAction.done),
                              Padding(
                                  padding: getPadding(left: 1, top: 14),
                                  child: Text("lbl_payment_qr".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNunitoBold14)),
                              Padding(
                                  padding: getPadding(left: 1, top: 11),
                                  child: DottedBorder(
                                      color: ColorConstant.pink900,
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(1.00),
                                          top: getVerticalSize(1.00),
                                          right: getHorizontalSize(1.00),
                                          bottom: getVerticalSize(1.00)),
                                      strokeWidth: getHorizontalSize(1.00),
                                      radius: Radius.circular(12),
                                      borderType: BorderType.RRect,
                                      dashPattern: [2, 2],
                                      child: Container(
                                          width: getHorizontalSize(326.00),
                                          padding: getPadding(
                                              left: 123,
                                              top: 15,
                                              right: 123,
                                              bottom: 15),
                                          decoration: AppDecoration
                                              .outlinePink9001
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgSharePink900,
                                                    height: getSize(30.00),
                                                    width: getSize(30.00)),
                                                Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                        padding: getPadding(
                                                            top: 3, bottom: 6),
                                                        child: Text(
                                                            "lbl_upload_file"
                                                                .tr,
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
                                                                            0.36)))))
                                              ])))),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtBtnConfirm();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(250.00),
                                      margin: getMargin(left: 31, top: 36),
                                      padding: getPadding(
                                          left: 30,
                                          top: 6,
                                          right: 97,
                                          bottom: 6),
                                      decoration: AppDecoration.txtFillPink900
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtCircleBorder20),
                                      child: Text("lbl_save".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtNunitoSansBlack16)))
                            ]))))));
  }

  onTapRowplus() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtBtnConfirm() {
    Navigator.of(context).pushNamed(AppRoutes.iconGroupScreen);
  }
}
