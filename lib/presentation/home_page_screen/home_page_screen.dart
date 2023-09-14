import 'dart:convert';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/data/models/deleteGreeting/post_delete_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/localization/en_us/en_us_translations.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/service/authenticationservice.dart';
import '../../data/apiClient/api_client.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  ApiClient api = new ApiClient();
  List<Result>? languages;
  APIResponse languageCaptionResponse = new APIResponse();
  Map<String, String> captionMap = new Map<String, String>();
  String? selectedLanguage;
  @override
  void initState() {
    requestPermission();

    getLanguages();
    super.initState();
  }

  Future<void> requestPermission() async {
    var gallery = Permission.photos;
    var storage = Permission.storage;
    var location = Permission.locationWhenInUse;
    var camera = Permission.camera;
    final storagestatus = await storage.request();
    final gallerystatus = await gallery.request();
    final camerastatus = await camera.request();
    final locationstatus = await location.request();
  }

  getLanguages() async {
    try {
      CommonDropdownResp resp = await api.getLanguages(queryParams: {});
      if (resp.isSuccess ?? false) {
        setState(() {
          languages = resp.result;
          selectedLanguage = languages?.first.value;
        });
      } else {
        Get.snackbar('Error', resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {}
  }

  getLanguageCaptionData(String languageID) async {
    try {
      var req = {"LanguageId": languageID};
      APIResponse resp = await api.getLanguageCaptionData(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          languageCaptionResponse = resp;

          languageCaptionResponse.result
              .forEach((key, value) => captionMap[key] = value.toString());
        });
      } else {
        Get.snackbar('Error', resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // key: _scaffoldKey,
        top: false,
        bottom: false,
        child: Scaffold(
            key: _scaffoldKey,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: CommonMoreOptionMenu()),
            backgroundColor: ColorConstant.whiteA700,
            drawer: appDrawer(),
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
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
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
                                      onTapDigitalCards();
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
                                                  // url:"https://mldigitalservices.com/wp-content/uploads/2021/05/D7-edited-e1620746055355.png"
                                                  // url:
                                                  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRjBUFIqTONNxHpoMv0wfaeDU-1Z_1lvuhUQ&usqp=CAU",
                                                  // url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY1rqfS-yLLn0GsLxuqFtUzRP_j8QHZnSCWg&usqp=CAU",
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
                                          onTapGreetings();
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
                                                      // url:
                                                      //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_WjlBo3M1i4xcqEuVWhBF1FfeT9jtPFTkxg&usqp=CAU",
                                                      // url: "https://www.befunky.com/images/prismic/3f297bed-29c1-4db2-93ab-9896c6292fcf_hero-card-maker.jpg?auto=avif,webp&format=jpg&width=950",
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

  Widget appDrawer() {
    return Drawer(
      child: Container(
        decoration: AppDecoration.fillWhiteA700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: getHorizontalSize(
                  250.00,
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
                child: GestureDetector(
                  onTap: onTapProfile,
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
                          top: 50,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            GlobalVariables.userPhotoUrl.isEmpty
                                ? CustomImageView(
                                    imagePath:
                                        ImageConstant.imgProfiletransparent,
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
                                  )
                                : CustomImageView(
                                    // imagePath: ImageConstant.imgProfiletransparent,
                                    url: GlobalVariables.userPhotoUrl,
                                    height: getSize(
                                      90.00,
                                    ),
                                    width: getSize(
                                      90.00,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        50.00,
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
                      Container(
                          margin: getMargin(top: 10, left: 5),
                          child: Text(
                            GlobalVariables.displayName.isEmpty
                                ? GlobalVariables.userName
                                : GlobalVariables.displayName,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNunitoSansBold14Pink900,
                          )),
                    ],
                  ),
                )),
            Padding(
              padding: getPadding(
                top: 25,
                left: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 10,
                      left: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Row(children: [
                        //   CustomImageView(
                        //     svgPath: ImageConstant.imgHome,
                        //     height: getSize(
                        //       21.00,
                        //     ),
                        //     width: getSize(
                        //       21.00,
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     width: 10,
                        //   ),
                        //   Text(
                        //     "lbl_gaamma_cards".tr,
                        //     overflow: TextOverflow.ellipsis,
                        //     textAlign: TextAlign.left,
                        //     style: AppStyle.txtNunitoSansSemiBold16,
                        //   ),
                        // ]),
                        Padding(
                          padding: getPadding(
                            top: 35,
                          ),
                          child: Row(children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgGrid,
                              height: getSize(
                                21.00,
                              ),
                              width: getSize(
                                21.00,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                "lbl_digital_cards".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              onTap: onTapDigitalCards,
                            )
                          ]),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 35,
                          ),
                          child: Row(children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgMenuPink900,
                              height: getSize(
                                21.00,
                              ),
                              width: getSize(
                                21.00,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                "lbl_e_greetings".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              onTap: onTapGreetings,
                            )
                          ]),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 35,
                          ),
                          child: Row(children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgUser,
                              height: getSize(
                                21.00,
                              ),
                              width: getSize(
                                21.00,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                "lbl_my_profile".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              onTap: onTapProfile,
                            )
                          ]),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 35,
                          ),
                          child: Row(children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgMenuPink90021x21,
                              height: getSize(
                                21.00,
                              ),
                              width: getSize(
                                21.00,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                "lbl_make_payment".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              onTap: onTapPayment,
                            )
                          ]),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 35,
                          ),
                          child: Row(children: [
                            Icon(
                              Icons.history,
                              size: 20,
                              color: ColorConstant.pink900,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                "lbl_payment_history".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansSemiBold16,
                              ),
                              onTap: onTapCreditHistory,
                            )
                          ]),
                        ),
                        Visibility(
                          child: Padding(
                            padding: getPadding(
                              top: 35,
                            ),
                            child: Row(children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgLock,
                                height: getSize(
                                  21.00,
                                ),
                                width: getSize(
                                  21.00,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Text(
                                  "lbl_change_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16,
                                ),
                                onTap: onTapChangePassword,
                              )
                            ]),
                          ),
                          visible: !GlobalVariables.isGoogleLoggedIn,
                        ),
                        Padding(
                            padding: getPadding(
                              top: 35,
                            ),
                            child: Row(children: [
                              Icon(
                                Icons.language,
                                size: 20,
                                color: ColorConstant.pink900,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Text(
                                  "lbl_changelanguage".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16,
                                ),
                                onTap: () {
                                  showLanguageDialog(context);
                                },
                              )
                            ])),
                        Padding(
                            padding: getPadding(
                              top: 35,
                            ),
                            child: Row(children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgRefresh,
                                height: getSize(
                                  21.00,
                                ),
                                width: getSize(
                                  21.00,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Text(
                                  "lbl_logout".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansSemiBold16,
                                ),
                                onTap: () {
                                  showAlertDialog(context);
                                },
                              )
                            ])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getLang(String value) async {
    await getLanguageCaptionData(value);
  }

  showLanguageDialog(BuildContext context) {
    // set up the button

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Choose your Language"),
      content: Container(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: languages!.map((element) {
                return GestureDetector(
                  child: Container(
                      child: Card(
                    elevation: 2,
                    child: Padding(
                        padding: getPadding(top: 10, bottom: 10, left: 5),
                        child: Row(children: [
                          Icon(Icons.language, size: 18),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            element.text ?? '',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNunitoSansBold14Pink900,
                          ),
                        ])),
                  )),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() async {
                      if (element.value == "1") {
                        Get.clearTranslations();

                        Map<String, Map<String, String>> languageKeys = {
                          'en_US': enUs
                        };
                        Get.addTranslations(languageKeys);
                        var locale = Locale('en', 'US');
                        Get.updateLocale(locale);

                        GlobalVariables.setCurrentLocale("en_US");
                      } else {
                        await getLang(element.value ?? '');
                        Get.clearTranslations();

                        Map<String, Map<String, String>> languageKeys = {
                          element.group: captionMap
                        };
                        var lang = element.group?.toString().split('_')[0];
                        var country = element.group?.toString().split('_')[1];
                        Get.addTranslations(languageKeys);
                        var locale = Locale(lang ?? '', country ?? '');
                        Get.updateLocale(locale);

                        GlobalVariables.setCurrentLocale(
                            element.group.toString());
                        var encodedJSON = json.encode(captionMap);
                        GlobalVariables.setCurrentLocaleTranslations(
                            encodedJSON);
                      }
                    });
                  },
                );
              }).toList())),
      // actions: [okButton, cancelButtonn],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: onTapLogout,
    );
    Widget cancelButtonn = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to logout?"),
      actions: [okButton, cancelButtonn],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  onTapDigitalCards() {
    // GlobalVariables.setUserID('2e1dcb65-421e-4164-8ccb-a7214a9a7b55');
    Navigator.of(context).pushNamed(AppRoutes.myDigitalCardsScreen);
    // Get.toNamed(AppRoutes.myProfileScreen);
  }

  onTapLogout() async {
    GlobalVariables.setLogin(false);
    if (GlobalVariables.isGoogleLoggedIn) {
      final bool isUnauthenticated = await AuthService.instance.logout();
      signoutGoogle();
    }

    setState(() {
      Get.clearTranslations();

      Map<String, Map<String, String>> languageKeys = {'en_US': enUs};
      Get.addTranslations(languageKeys);
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);

      GlobalVariables.setCurrentLocale("en_US");
    });
    GlobalVariables.setUserID("");
    GlobalVariables.setDisplayname("");
    GlobalVariables.setUserName("");
    GlobalVariables.setGoogleLoggedIn(false);
    GlobalVariables.setUserPhotoUrl("");
    // Navigator.of(context).pushAndRemoveUntil(AppRoutes.signupPageScreen);
    Get.snackbar('Success', "Logged out successfully!",
        backgroundColor: Color.fromARGB(255, 208, 245, 216),
        colorText: Colors.green[900],
        icon: Icon(
          Icons.done,
          color: Colors.green[900],
        ));
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.signupPageScreen, (Route<dynamic> route) => false);
  }

  signoutGoogle() {
    try {
      _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }

  onTapGreetings() {
    // Get.reset(clearRouteBindings: true,clearFactory: true);
    //  Get.toNamed(AppRoutes.myEGreetingCardsScreen);
    Navigator.of(context).pushNamed(AppRoutes.myEGreetingCardsScreen);
  }

  onTapProfile() {
    Navigator.of(context).pushNamed(AppRoutes.myProfileScreen);
  }

  onTapChangePassword() {
    Navigator.of(context).pushNamed(AppRoutes.changePasswordScreen);
  }

  onTapPayment() {
    Navigator.of(context).pushNamed(AppRoutes.makePaymentScreen);
  }

  onTapCreditHistory() {
    Navigator.of(context).pushNamed(AppRoutes.purchasecredithistory);
  }
}
