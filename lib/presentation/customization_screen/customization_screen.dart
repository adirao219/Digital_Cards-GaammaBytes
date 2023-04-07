import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomizationScreen createState() => _CustomizationScreen();
}

class _CustomizationScreen extends State<CustomizationScreen> {
  var cardID = Get.arguments["CardID"] as int?;
  String? greetingTypeName = Get.arguments["TypeName"] as String?;
  String? templateName = Get.arguments["templateName"] as String?;
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
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
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
                                              svgPath:
                                                  ImageConstant.imgContrast,
                                              onTap: onTapContrast6),
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
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_19),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 27, top: 31, right: 23),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(267.00),
                                  margin: getMargin(left: 9),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: ("msg_card_type_ex_new2".tr) +
                                                (greetingTypeName ?? '') +
                                                "\n\n",
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                            text: ("msg_template_type2".tr) +
                                                (templateName ?? ''),
                                            style: TextStyle(
                                                color: ColorConstant.pink900,
                                                fontSize: getFontSize(18),
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600))
                                      ]),
                                      textAlign: TextAlign.left)),
                                       CustomButton(
                                  height: 55,
                                  width: 352,
                                  text: "lbl_card_preview2".tr,
                                  margin: getMargin(left: 0, top: 45),
                                  onTap: onTapTxtGroupThirtyFour),
                             
                            ])))),
            bottomNavigationBar: CustomBottomBar(
                onNextClicked: onTapTxtGroupThirtyFour,
                isPublishAvailable: false,
                onChanged: (BottomBarEnum type) {})));
  }

  onTapTxtGroupThirtyFour() {
    Navigator.of(context)
        .pushNamed(AppRoutes.cardPreviewScreen, arguments: {"CardID": cardID});
  }

  onTapEllipseFour() {
    Navigator.of(context).pushNamed(AppRoutes.homePageScreen);
  }

  onTapContrast6() {
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen);
  }
}
