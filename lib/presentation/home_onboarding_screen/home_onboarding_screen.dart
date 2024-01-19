import 'dart:convert';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../localization/en_us/en_us_translations.dart';

class HomeOnboardingScreen extends StatefulWidget {
  const HomeOnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeOnboardingScreen createState() => _HomeOnboardingScreen();
}

class _HomeOnboardingScreen extends State<HomeOnboardingScreen> {
  var isAlreadyLoggedIn = false;
  @override
  void initState() {
    GlobalVariables.setBuildContext(context);
    SharedPreferences.getInstance().then((value) {
      GlobalVariables.appleDisplayName =
          value.getString("appleDisplayName") ?? '';
      GlobalVariables.appleEmail = value.getString("appleEmail") ?? '';
      if (value.getBool("isLoggedIn") == true) {
        setState(() {
          isAlreadyLoggedIn =
              GlobalVariables.isLoggedIn = value.getBool("isLoggedIn") ?? false;

          GlobalVariables.isGoogleLoggedIn =
              value.getBool("isGoogleLoggedIn") ?? false;
          GlobalVariables.userID = value.getString("userID") ?? '';
          GlobalVariables.displayName = value.getString("displayName") ?? '';
          GlobalVariables.userName = value.getString("userName") ?? '';
          GlobalVariables.userPhotoUrl = value.getString("userPhotoUrl") ?? '';

          try {
            var currenntlanguage = (value.getString("currentLocale") ?? '');

            var currentLanguageID =
                (value.getString("currentLanguageID") ?? '1');
            GlobalVariables.currentLanguage = currentLanguageID;
            if (currenntlanguage == "" || currenntlanguage == "en_US") {
              Get.clearTranslations();
              Map<String, Map<String, String>> languageKeys = {'en_US': enUs};
              Get.addTranslations(languageKeys);
              var locale = Locale('en', 'US');
              Get.updateLocale(locale);
            } else {
              var currentLocale = (value.getString("currentLocale") ?? '');
              var currentLocaleTranslations =
                  (value.getString("currentLocaleTranslations") ?? '');

              var localeTranslations = json.decode(currentLocaleTranslations);
              Map<String, String> translations = Map<String, String>();
              localeTranslations.forEach(
                  (key, value) => translations[key] = (value ?? '').toString());

              Get.clearTranslations();

              Map<String, Map<String, String>> languageKeys = {
                currentLocale: translations
              };
              var lang = currentLocale.split('_')[0];
              var country = currentLocale.split('_')[1];
              Get.addTranslations(languageKeys);
              var locale = Locale(lang, country);
              Get.updateLocale(locale);
            }
          } catch (e) {}
        });
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (isAlreadyLoggedIn) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.homePageScreen, (Route<dynamic> route) => false);
            // Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
          }
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.deepOrangeA100,
            body: Container(
                width: size.width,
                padding: getPadding(top: 32, bottom: 32),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(360.00),
                          width: size.width,
                          margin: getMargin(top: 12),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgVectorWhiteA700,
                                height: getVerticalSize(332.00),
                                width: getHorizontalSize(340.00),
                                alignment: Alignment.center),
                            CustomImageView(
                                imagePath: ImageConstant.imgPortraityoung,
                                height: getVerticalSize(360.00),
                                width: getHorizontalSize(375.00),
                                alignment: Alignment.center)
                          ])),
                      Container(
                          width: getHorizontalSize(341.00),
                          margin: getMargin(left: 17, right: 17),
                          padding: getPadding(
                              left: 37, top: 10, right: 37, bottom: 34),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder40),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: getPadding(top: 33),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgGaammabyteslogo,
                                              height: getVerticalSize(26.00),
                                              width: getHorizontalSize(31.00)),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgGaammabyteslogo24x181,
                                              height: getVerticalSize(24.00),
                                              width: getHorizontalSize(181.00),
                                              margin: getMargin(top: 1))
                                        ])),
                                Container(
                                    width: getHorizontalSize(203.00),
                                    margin:
                                        getMargin(left: 32, top: 21, right: 31),
                                    decoration: AppDecoration.outlineBlack9003f,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          (!isAlreadyLoggedIn)
                                              ? GestureDetector(
                                                  onTap: () {
                                                    onTapButtonhalfFill();
                                                  },
                                                  child: Container(
                                                      width: getHorizontalSize(
                                                          203.00),
                                                      padding: getPadding(
                                                          left: 55,
                                                          top: 19,
                                                          right: 55,
                                                          bottom: 19),
                                                      decoration: AppDecoration
                                                          .fillPink900
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .circleBorder31),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "lbl_get_started"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtNunitoSansBlack16))
                                                          ])))
                                              : Container()
                                        ])),
                                Container(
                                    width: getHorizontalSize(267.00),
                                    margin: getMargin(top: 28),
                                    child: Text("msg_platform_to_create".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style:
                                            AppStyle.txtNunitoSansExtraBold22)),
                              ]))
                    ]))));
  }

  onTapButtonhalfFill() {
    Navigator.of(context).pushNamed(AppRoutes.signupPageScreen);
  }

  onTapTxtDonthaveanaccount() {
    Navigator.of(context).pushNamed(AppRoutes.regiterPageScreen);
  }
}
