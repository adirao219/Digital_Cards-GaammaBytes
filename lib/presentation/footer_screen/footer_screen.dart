import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import '../../data/apiClient/api_client.dart';

import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/getBands/get_get_bands_resp.dart';
import '../../data/models/getFooter/get_get_footer_resp.dart';
import '../../data/models/saveFooter/post_save_footer_resp.dart';
import '../../widgets/custom_button.dart';

class FooterScreen extends StatefulWidget {
  const FooterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FooterScreen createState() => _FooterScreen();
}

class _FooterScreen extends State<FooterScreen> {
  List<Result> allLinks = [];
  FooterData? footerData;
  String? link1Value;
  String? link2Value;
  String? link3Value;
  String? link4Value;
  String? link5Value;
  ApiClient api = new ApiClient();

  var cardType = Get.arguments["cardType"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardSubtypeID = Get.arguments["cardSubtypeID"] as int?;
  var templateId = Get.arguments["templateId"] as String?;
  var cardTypeName = Get.arguments["cardTypeName"] as String?;
  var templateName = Get.arguments["templateName"] as String?;
  var cardSubTypeName = Get.arguments["cardSubTypeName"] as String?;
  var isPublishAvailable = Get.arguments["isPublishAvailable"] as bool?;
  var cardName = Get.arguments["cardName"] as String?;
  @override
  void initState() {
    getFooterLinks();
    super.initState();
  }

  getFooterLinks({bool isProgress = true}) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "LanguageId":GlobalVariables.currentLanguage
      };
      CommonDropdownResp resp =
          await api.fetchGetBandLinkList(context,queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          allLinks = resp.result ?? [];
          getFooterData();
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

  getFooterData() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "LanguageId":GlobalVariables.currentLanguage
      };
      GetGetFooterResp resp = await api.fetchGetFooter(context,queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          link1Value = resp.result!.footerData!.link1 == null
              ? null
              : resp.result!.footerData!.link1!.toString();
          link2Value = resp.result!.footerData!.link2 == null
              ? null
              : resp.result!.footerData!.link2!.toString();
          link3Value = resp.result!.footerData!.link3 == null
              ? null
              : resp.result!.footerData!.link3!.toString();
          link4Value = resp.result!.footerData!.link4 == null
              ? null
              : resp.result!.footerData!.link4!.toString();
          link5Value = resp.result!.footerData!.link5 == null
              ? null
              : resp.result!.footerData!.link5!.toString();
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

  saveFooterLinks() async {
    try {
      var req = {
        "CardID": selectedCardID,
        "Link1": link1Value ?? '',
        "Link2": link2Value ?? '',
        "Link3": link3Value ?? '',
        "Link4": link4Value ?? '',
        "Link5": link5Value ?? '',
        "Link6": "",
        "Link7": "",
        "Link8": "",
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      APIBooleanResponse resp = await api.createSaveFooter(context,requestData: req);
      if ((resp.isSuccess ?? false) && (resp.result ?? false)) {
        Get.snackbar("lbl_success".tr, "lbl_links_updated".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        Navigator.pop(context);
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
                              left: 38, top: 44, right: 148, bottom: 7),
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
                                    text: ("lbl_footer".tr).toUpperCase(),
                                    margin: getMargin(left: 71, top: 0))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_25),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 10, right: 24, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(("msg_card_type_ex_new2".tr) + (cardTypeName ?? ""),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold18),
                      Container(
                        margin: getMargin(
                          top: 30,
                        ),
                        child: Text("lbl_link_1".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        // Initial Value
                        value: link1Value,
                        icon: link1Value == null
                            ? Icon(Icons.keyboard_arrow_down)
                            : GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (link1Value != null) link1Value = null;
                                  });
                                },
                              ),
                        hint: Text(
                          ("lbl_select".tr)+" " + ('lbl_link_1'.tr),
                          style: AppStyle.txtNunitoSansRegular14Gray70001,
                        ),
                        // Array list of items
                        items: allLinks.map((items) {
                          return DropdownMenuItem(
                            value: items.value,
                            child: Text(
                              items.text ?? '',
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            link1Value = newValue;
                          });
                          //  getTemplate(newValue ?? "");
                        },
                      ),
                      Container(
                        margin: getMargin(
                          top: 10,
                        ),
                        child: Text("lbl_link_2".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        // Initial Value
                        value: link2Value,
                        icon: link2Value == null
                            ? Icon(Icons.keyboard_arrow_down)
                            : GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (link2Value != null) link2Value = null;
                                  });
                                },
                              ),
                        hint: Text(
                          ("lbl_select".tr)+" " + ('lbl_link_2'.tr),
                          style: AppStyle.txtNunitoSansRegular14Gray70001,
                        ),
                        // Array list of items
                        items: allLinks.map((items) {
                          return DropdownMenuItem(
                            value: items.value,
                            child: Text(
                              items.text ?? '',
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            link2Value = newValue;
                          });
                          //  getTemplate(newValue ?? "");
                        },
                      ),
                      Container(
                        margin: getMargin(
                          top: 10,
                        ),
                        child: Text("lbl_link_3".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        // Initial Value
                        value: link3Value,
                        icon: link3Value == null
                            ? Icon(Icons.keyboard_arrow_down)
                            : GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (link3Value != null) link3Value = null;
                                  });
                                },
                              ),
                        hint: Text(
                          ("lbl_select".tr)+" " + ('lbl_link_3'.tr),
                          style: AppStyle.txtNunitoSansRegular14Gray70001,
                        ),
                        // Array list of items
                        items: allLinks.map((items) {
                          return DropdownMenuItem(
                            value: items.value,
                            child: Text(
                              items.text ?? '',
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            link3Value = newValue;
                          });
                          //  getTemplate(newValue ?? "");
                        },
                      ),
                      Container(
                        margin: getMargin(
                          top: 10,
                        ),
                        child: Text("lbl_link_4".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        // Initial Value
                        value: link4Value,
                        icon: link4Value == null
                            ? Icon(Icons.keyboard_arrow_down)
                            : GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (link4Value != null) link4Value = null;
                                  });
                                },
                              ),
                        hint: Text(
                          ("lbl_select".tr)+" " + ('lbl_link_4'.tr),
                          style: AppStyle.txtNunitoSansRegular14Gray70001,
                        ),
                        // Array list of items
                        items: allLinks.map((items) {
                          return DropdownMenuItem(
                            value: items.value,
                            child: Text(
                              items.text ?? '',
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            link4Value = newValue;
                          });
                          //  getTemplate(newValue ?? "");
                        },
                      ),
                      Container(
                        margin: getMargin(
                          top: 10,
                        ),
                        child: Text("lbl_link_5".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        // Initial Value
                        value: link5Value,
                        icon: link5Value == null
                            ? Icon(Icons.keyboard_arrow_down)
                            : GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (link5Value != null) link5Value = null;
                                  });
                                },
                              ),
                        hint: Text(
                          ("lbl_select".tr)+" " + ('lbl_link_5'.tr),
                          style: AppStyle.txtNunitoSansRegular14Gray70001,
                        ),
                        // Array list of items
                        items: allLinks.map((items) {
                          return DropdownMenuItem(
                            value: items.value,
                            child: Text(
                              items.text ?? '',
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            link5Value = newValue;
                          });
                          //  getTemplate(newValue ?? "");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  height: 40,
                                  width: 148,
                                  text: "lbl_other_links".tr,
                                  padding: ButtonPadding.PaddingT9,
                                  prefixWidget: Container(
                                      margin: getMargin(right: 10),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgSearchWhiteA700)),
                                  onTap: onTapOtherlinks),
                            ],
                          ),
                          CustomButton(
                              height: 40,
                              width: 148,
                              text: "lbl_save".tr,
                              padding: ButtonPadding.PaddingT9,
                              onTap: onTapTxtBtnConfirm),
                        ],
                      )
                    ]))));
  }

  onTapTxtBtnConfirm() {
    saveFooterLinks();
  }

  onTapOtherlinks() {
    Navigator.of(context).pushNamed(AppRoutes.linkScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "cardName": cardName
    }).then((value) => getFooterLinks(isProgress: false));
  }
}
