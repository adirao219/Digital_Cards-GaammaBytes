import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        key: _scaffoldKey,
        top: false,
        bottom: false,
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: MoreOptionMenu()),
            backgroundColor: ColorConstant.whiteA700,
            drawer: new Drawer(
              child: Container(
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        270.00,
                      ),
                      padding: getPadding(
                        left: 29,
                        top: 14,
                        right: 29,
                        bottom: 14,
                      ),
                      decoration: AppDecoration.fillDeeporangeA100.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderBL151,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: getSize(
                              94.00,
                            ),
                            width: getSize(
                              94.00,
                            ),
                            margin: getMargin(
                              top: 80,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgInneroval,
                                  height: getSize(
                                    94.00,
                                  ),
                                  width: getSize(
                                    94.00,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      47.00,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgEdit,
                                  height: getSize(
                                    18.00,
                                  ),
                                  width: getSize(
                                    18.00,
                                  ),
                                  alignment: Alignment.bottomRight,
                                  margin: getMargin(
                                    right: 6,
                                    bottom: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "lbl_steve_smith".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBalooBhaijaanRegular19,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 50,
                        bottom: 132,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: getVerticalSize(
                              394.00,
                            ),
                            width: getHorizontalSize(
                              22.00,
                            ),
                            margin: getMargin(
                              bottom: 2,
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: getHorizontalSize(
                                      21.00,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgHome,
                                          height: getSize(
                                            21.00,
                                          ),
                                          width: getSize(
                                            21.00,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgGrid,
                                          height: getSize(
                                            19.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                          margin: getMargin(
                                            top: 38,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgMenuPink900,
                                          height: getSize(
                                            21.00,
                                          ),
                                          width: getSize(
                                            21.00,
                                          ),
                                          margin: getMargin(
                                            top: 46,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath:
                                              ImageConstant.imgMenuPink90021x21,
                                          height: getSize(
                                            21.00,
                                          ),
                                          width: getSize(
                                            21.00,
                                          ),
                                          margin: getMargin(
                                            top: 104,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgLock,
                                          height: getSize(
                                            21.00,
                                          ),
                                          width: getSize(
                                            21.00,
                                          ),
                                          margin: getMargin(
                                            top: 40,
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgRefresh,
                                          height: getSize(
                                            21.00,
                                          ),
                                          width: getSize(
                                            21.00,
                                          ),
                                          margin: getMargin(
                                            top: 42,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgUser,
                                  height: getSize(
                                    21.00,
                                  ),
                                  width: getSize(
                                    21.00,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 13,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_gaamma_cards".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 39,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_digital_cards".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNunitoSansSemiBold16,
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(
                                          15.00,
                                        ),
                                        width: getHorizontalSize(
                                          10.00,
                                        ),
                                        margin: getMargin(
                                          left: 80,
                                          top: 3,
                                          bottom: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 42,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_e_greetings".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNunitoSansSemiBold16,
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(
                                          15.00,
                                        ),
                                        width: getHorizontalSize(
                                          10.00,
                                        ),
                                        margin: getMargin(
                                          left: 80,
                                          top: 5,
                                          bottom: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 3,
                                    top: 38,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "lbl_my_profile".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNunitoSansSemiBold16,
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(
                                          15.00,
                                        ),
                                        width: getHorizontalSize(
                                          10.00,
                                        ),
                                        margin: getMargin(
                                          left: 98,
                                          top: 7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 39,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_make_payment".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNunitoSansSemiBold16,
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(
                                          15.00,
                                        ),
                                        width: getHorizontalSize(
                                          10.00,
                                        ),
                                        margin: getMargin(
                                          left: 67,
                                          top: 6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 39,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_change_password".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNunitoSansSemiBold16,
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgArrowdownPink900,
                                        height: getVerticalSize(
                                          15.00,
                                        ),
                                        width: getHorizontalSize(
                                          10.00,
                                        ),
                                        margin: getMargin(
                                          left: 44,
                                          top: 5,
                                          bottom: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 44,
                                  ),
                                  child: Text(
                                    "lbl_logout".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNunitoSansSemiBold16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                              left: 38, top: 44, right: 121, bottom: 14),
                          child: Row(children: [
                            IconButton(
                              icon: Icon(Icons.menu),
                              color: Colors.black,
                              onPressed: () =>
                                  _scaffoldKey.currentState?.openDrawer(),
                            ),
                            AppbarSubtitle(
                                text: "lbl_let_s_design".tr,
                                margin: getMargin(left: 35, top: 10))
                          ]))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_4),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 35, right: 24, bottom: 35),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_choose_the_card".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterLight18),
                      Container(
                          height: getVerticalSize(200.00),
                          width: getHorizontalSize(326.00),
                          margin: getMargin(top: 45),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(bottom: 10),
                                    width: getHorizontalSize(150.00),
                                    child: Text("lbl_digital_cards".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtNunitoSansBold14))),
                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapColumnotherstwo();
                                    },
                                    child: Container(
                                        padding: getPadding(
                                            left: 9,
                                            top: 5,
                                            right: 9,
                                            bottom: 8),
                                        decoration: BoxDecoration(
                                          color: Color(0x71EEA792),
                                          border: Border.all(
                                            color: Color(0x71EEA792),
                                            width: getHorizontalSize(
                                              1.00,
                                            ),
                                          ),
                                        ).copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder15),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgOthers2,
                                                  height:
                                                      getVerticalSize(155.00),
                                                  width:
                                                      getHorizontalSize(308.00),
                                                  radius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          getHorizontalSize(
                                                              15.00)),
                                                      topRight: Radius.circular(
                                                          getHorizontalSize(
                                                              15.00)),
                                                      bottomLeft:
                                                          Radius.circular(
                                                              getHorizontalSize(
                                                                  5.00)),
                                                      bottomRight: Radius.circular(
                                                          getHorizontalSize(5.00))),
                                                  margin: getMargin(bottom: 25))
                                            ]))))
                          ])),
                      Container(
                          height: getVerticalSize(200.00),
                          width: getHorizontalSize(326.00),
                          margin: getMargin(top: 49, bottom: 5),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          onTapColumnothersone();
                                        },
                                        child: Container(
                                            padding: getPadding(
                                                left: 4,
                                                top: 3,
                                                right: 4,
                                                bottom: 7),
                                            decoration: BoxDecoration(
                                              color: Color(0x71EEA792),
                                              border: Border.all(
                                                color: Color(0x71EEA792),
                                                width: getHorizontalSize(
                                                  1.00,
                                                ),
                                              ),
                                            ).copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder15),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgOthers1,
                                                      height: getVerticalSize(
                                                          154.00),
                                                      width: getHorizontalSize(
                                                          317.00),
                                                      radius: BorderRadius.only(
                                                          topLeft: Radius.circular(
                                                              getHorizontalSize(
                                                                  15.00)),
                                                          topRight: Radius.circular(
                                                              getHorizontalSize(
                                                                  15.00)),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  getHorizontalSize(
                                                                      5.00)),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  getHorizontalSize(5.00))),
                                                      margin: getMargin(bottom: 25))
                                                ])))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        width: getHorizontalSize(150.00),
                                        padding: getPadding(bottom: 10),
                                        child: Text("lbl_e_greetings".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            style:
                                                AppStyle.txtNunitoSansBold14)))
                              ]))
                    ]))));
  }

  onTapColumnotherstwo() {
    Get.toNamed(AppRoutes.myDigitalCardsScreen);
    // Get.toNamed(AppRoutes.myProfileScreen);

  }

  onTapColumnothersone() {
    Get.toNamed(AppRoutes.myEGreetingCardsScreen);
  }
}
