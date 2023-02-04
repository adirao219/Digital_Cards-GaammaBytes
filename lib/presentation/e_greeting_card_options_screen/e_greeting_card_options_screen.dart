
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EGreetingCardOptionsScreen
 extends StatefulWidget {
  const EGreetingCardOptionsScreen
({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _EGreetingCardOptionsScreen
 createState() => _EGreetingCardOptionsScreen
();
            }

class _EGreetingCardOptionsScreen
 extends State<EGreetingCardOptionsScreen
> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child:MoreOptionMenu()),
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
                      Container(
                          height: getVerticalSize(36.00),
                          width: getHorizontalSize(38.00),
                          margin: getMargin(
                              left: 38, top: 44, right: 299, bottom: 14),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            AppbarImage(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                svgPath: ImageConstant.imgContrast,
                                onTap: onTapContrast5),
                            AppbarImage(
                                height: getVerticalSize(10.00),
                                width: getHorizontalSize(5.00),
                                svgPath: ImageConstant.imgVectorstroke,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                margin: getMargin(
                                    left: 15, top: 13, right: 18, bottom: 13))
                          ]))
                    ])),
                 // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_18),
            body: Container(
                width: size.width,
                padding: getPadding(left: 15, top: 39, right: 15, bottom: 39),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 24),
                          child: Text("msg_choose_greeting".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoBold20)),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: getVerticalSize(136.00),
                                        width: getHorizontalSize(146.00),
                                        child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        onTapColumnleadersday();
                                                      },
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 1),
                                                          padding: getPadding(
                                                              left: 12,
                                                              top: 16,
                                                              right: 12,
                                                              bottom: 16),
                                                          decoration: AppDecoration
                                                              .fillPurple50
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder5),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        bottom:
                                                                            83),
                                                                    child: Text(
                                                                        "lbl_leaders_day"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtNunitoBlack14
                                                                            .copyWith(letterSpacing: getHorizontalSize(0.36))))
                                                              ])))),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgHolicolordown,
                                                  height:
                                                      getVerticalSize(95.00),
                                                  width:
                                                      getHorizontalSize(146.00),
                                                  alignment:
                                                      Alignment.bottomCenter)
                                            ])),
                                    GestureDetector(
                                        onTap: () {
                                          onTapColumnspecialday();
                                        },
                                        child: Container(
                                            margin: getMargin(left: 13),
                                            padding: getPadding(
                                                left: 6,
                                                top: 9,
                                                right: 6,
                                                bottom: 9),
                                            decoration: AppDecoration
                                                .fillDeeppurple50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 16, top: 7),
                                                      child: Text(
                                                          "lbl_special_day".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoBlack14
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36)))),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgImage11,
                                                      height: getVerticalSize(
                                                          76.00),
                                                      width: getHorizontalSize(
                                                          71.00),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      margin:
                                                          getMargin(top: 14))
                                                ])))
                                  ]))),
                      Padding(
                          padding: getPadding(left: 13, top: 17),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapRowfestival();
                                    },
                                    child: Container(
                                        margin: getMargin(bottom: 9),
                                        padding: getPadding(
                                            left: 3,
                                            top: 5,
                                            right: 3,
                                            bottom: 5),
                                        decoration: AppDecoration.fillRed10001
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 5, bottom: 86),
                                                  child: Text("lbl_festival".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNunitoBlack14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.36)))),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPngimage1,
                                                  height:
                                                      getVerticalSize(93.00),
                                                  width:
                                                      getHorizontalSize(73.00),
                                                  margin: getMargin(
                                                      left: 2, top: 19))
                                            ]))),
                                Container(
                                    height: getVerticalSize(131.00),
                                    width: getHorizontalSize(173.00),
                                    margin: getMargin(left: 10),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    onTapColumnresponse();
                                                  },
                                                  child: Container(
                                                      padding: getPadding(
                                                          left: 15,
                                                          top: 12,
                                                          right: 15,
                                                          bottom: 12),
                                                      decoration: AppDecoration
                                                          .fillYellow100
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder5),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            77),
                                                                child: Text(
                                                                    "lbl_response"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtNunitoBlack14
                                                                        .copyWith(
                                                                            letterSpacing:
                                                                                getHorizontalSize(0.36))))
                                                          ])))),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgPngitem7570206,
                                              height: getVerticalSize(116.00),
                                              width: getHorizontalSize(114.00),
                                              alignment: Alignment.bottomRight)
                                        ]))
                              ])),
                      GestureDetector(
                          onTap: () {
                            onTapColumnimportantday();
                          },
                          child: Container(
                              width: getHorizontalSize(148.00),
                              margin: getMargin(left: 12, top: 4, bottom: 5),
                              padding: getPadding(
                                  left: 9, top: 22, right: 9, bottom: 22),
                              decoration: AppDecoration.fillLightblue50
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(left: 5),
                                        child: Text("lbl_important_day".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtNunitoBlack14
                                                .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            0.36)))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.img7597598520unl,
                                        height: getVerticalSize(49.00),
                                        width: getHorizontalSize(129.00),
                                        margin: getMargin(top: 18, bottom: 3))
                                  ])))
                    ]))));
  }

  onTapColumnleadersday() {
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen);
  }

  onTapColumnspecialday() {
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen);
  }

  onTapRowfestival() {
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen);
  }

  onTapColumnresponse() {
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen);
  }

  onTapColumnimportantday() {
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen);
  }

  onTapContrast5() {
    Navigator.of(context).pushNamed(AppRoutes.myEGreetingCardsScreen);
  }
}
