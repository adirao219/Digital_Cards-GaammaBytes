import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/myProfile/get_my_profile_resp.dart';
import '../../data/models/myProfile/post_my_profile_resp.dart';
import '../../widgets/app_bar/appbar_title.dart';

class PurchaseCreditHistoryDetails extends StatefulWidget {
  const PurchaseCreditHistoryDetails({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PurchaseCreditHistoryDetails createState() =>
      _PurchaseCreditHistoryDetails();
}

class _PurchaseCreditHistoryDetails
    extends State<PurchaseCreditHistoryDetails> {
  ApiClient api = new ApiClient();
  var creditHistoryID = Get.arguments["slNo"] as int?;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<CreditDetailsData> creditDetails = [];
  @override
  void initState() {
    getPurchaseCreditHistoryDetails();
    super.initState();
  }

  getPurchaseCreditHistoryDetails() async {
    try {
      var query = {
        "UserId": GlobalVariables.userID,
        "CreditId": creditHistoryID.toString(),
        "LanguageId":GlobalVariables.currentLanguage
      };
      CreditDetailsResponse resp =
          await api.getCreditDetails(context, queryParams: query);
      if (resp.isSuccess ?? false) {
        setState(() {
          creditDetails = resp.result ?? [];
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
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
      top: false,
      bottom: false,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
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
                        padding:
                            getPadding(left: 38, top: 44, right: 99, bottom: 7),
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
                                          svgPath: ImageConstant.imgContrast,
                                        ),
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
                                  text: "lbl_credit_usage".tr.toUpperCase(),
                                  margin: getMargin(left: 40, top: 0))
                            ])))
                  ])),
              styleType: Style.bgStyle_22),
          body: SingleChildScrollView(
            child: Container(
                width: size.width,
                padding: getPadding(
                  left: 22,
                  top: 0,
                  right: 22,
                  bottom: 28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Accordion(
                        maxOpenSections: 1,
                        disableScrolling: true,
                        openAndCloseAnimation: true,
                        paddingListHorizontal: 0,
                        scrollIntoViewOfItems: ScrollIntoViewOfItems.slow,
                        contentBorderColor: ColorConstant.pink900,
                        flipRightIconIfOpen: true,
                        headerBackgroundColor: ColorConstant.pink900,
                        leftIcon: Icon(Icons.credit_score_rounded,
                            size: 25, color: Colors.white),
                        children: creditDetails.map((element) {
                          return AccordionSection(
                            isOpen: true,
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text((element.parentTypeIdName ?? ''),
                                          style: AppStyle
                                              .txtNunitoSansBold14white),
                                      Text((element.creditAddedOnString ?? ''),
                                          style: AppStyle
                                              .txtNunitoSansRegular14white),
                                    ]),
                                Container(
                                    padding: getPadding(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: Text(
                                        (element.noofCredits.toString()),
                                        style: AppStyle
                                            .txtNunitoSansRegular14white))
                              ],
                            ),
                            content: creditItem(context, element),
                          );
                        }).toList()),
                    // CustomButton(
                    //   height: 40,
                    //   width: 250,
                    //   text: "lbl_ok".tr,
                    //   margin: getMargin(
                    //     top: 30,
                    //     bottom: 5,
                    //   ),
                    //   alignment: Alignment.center,
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                  ],
                )),
          )),
    );
  }

  Widget creditItem(BuildContext context, CreditDetailsData data) {
    return GestureDetector(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: getPadding(left: 0, top: 3, bottom: 3),
                  child: Text("lbl_card_name".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansBoldPink15.copyWith(
                          letterSpacing: getHorizontalSize(0.36),
                          height: getVerticalSize(1.26)))),
              Padding(
                  padding: getPadding(left: 0, top: 3, bottom: 5),
                  child: Text(data.parentIdName ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansRegular15.copyWith(
                          letterSpacing: getHorizontalSize(0.36),
                          height: getVerticalSize(1.26)))),
              Padding(
                  padding: getPadding(left: 0, top: 5, bottom: 3),
                  child: Text("lbl_type".tr+":",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansBoldPink15.copyWith(
                          letterSpacing: getHorizontalSize(0.36),
                          height: getVerticalSize(1.26)))),
              Padding(
                  padding: getPadding(left: 0, top: 3, bottom: 3),
                  child: Text(data.parentIdSubName ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansRegular15.copyWith(
                          letterSpacing: getHorizontalSize(0.36),
                          height: getVerticalSize(1.26)))),
            ]),
        onTap: () {});
  }
}
