import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/getBands/get_band_data_resp.dart';
import '../../data/models/getFooter/get_get_footer_resp.dart';

// ignore_for_file: must_be_immutable
class IconGroupScreen extends StatefulWidget {
  const IconGroupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IconGroupScreen createState() => _IconGroupScreen();
}

class _IconGroupScreen extends State<IconGroupScreen> {
  TextEditingController _name2_Controller = new TextEditingController();

  var cardType = Get.arguments["cardType"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardSubtypeID = Get.arguments["cardSubtypeID"] as int?;
  var templateId = Get.arguments["templateId"] as String?;
  var cardTypeName = Get.arguments["cardTypeName"] as String?;
  var templateName = Get.arguments["templateName"] as String?;
  var cardSubTypeName = Get.arguments["cardSubTypeName"] as String?;
  var isPublishAvailable = Get.arguments["isPublishAvailable"] as bool?;
  var bandID = Get.arguments["BandId"] as int?;
  var cardName = Get.arguments["cardName"] as String?;
  String? link1Value;
  String? link2Value;
  String? link3Value;
  String? link4Value;
  String? link5Value;
  String? link6Value;
  String? link7Value;
  String? link8Value;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Result> allLinks = [];
  ApiClient api = new ApiClient();
  @override
  void initState() {
    getBandLinks();
    super.initState();
  }

  getBandData() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "BandID": bandID.toString(),
        "LanguageId": GlobalVariables.currentLanguage
      };
      GetGetBandDataResp resp =
          await api.fetchGetBandData(context, queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          _name2_Controller.text = resp.result!.heading ?? '';
          link1Value = resp.result!.link1 == null
              ? null
              : resp.result!.link1!.toString();
          link2Value = resp.result!.link2 == null
              ? null
              : resp.result!.link2!.toString();
          link3Value = resp.result!.link3 == null
              ? null
              : resp.result!.link3!.toString();
          link4Value = resp.result!.link4 == null
              ? null
              : resp.result!.link4!.toString();
          link5Value = resp.result!.link5 == null
              ? null
              : resp.result!.link5!.toString();
          link6Value = resp.result!.link6 == null
              ? null
              : resp.result!.link6!.toString();
          link7Value = resp.result!.link7 == null
              ? null
              : resp.result!.link7!.toString();
          link8Value = resp.result!.link8 == null
              ? null
              : resp.result!.link8!.toString();
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

  getBandLinks({bool isProgress = true}) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "LanguageId": GlobalVariables.currentLanguage
      };
      CommonDropdownResp resp =
          await api.fetchGetBandLinkList(context, queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          allLinks = resp.result ?? [];
          if (bandID != null && bandID != 0) {
            getBandData();
          }
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

  saveBandLinks() async {
    try {
      var req = {
        "CardBandID": (bandID == null || bandID == 0) ? "0" : bandID.toString(),
        "CardID": selectedCardID.toString(),
        "BandType": "7",
        "Heading": _name2_Controller.text,
        "CBContent": "",
        "Latitude ": "",
        "Longitude": "",
        "Link1": link1Value ?? '',
        "Link2": link2Value ?? '',
        "Link3": link3Value ?? '',
        "Link4": link4Value ?? '',
        "Link5": link5Value ?? '',
        "Link6": link6Value ?? '',
        "Link7": link7Value ?? '',
        "Link8": link8Value ?? '',
        "DataPosition": "0",
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      APIBooleanResponse resp =
          await api.createSaveBands(context, requestData: req);
      if (resp.result ?? false) {
        Get.snackbar('Success', "Band Created successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        Navigator.pop(context);
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
                              left: 38, top: 43, right: 123, bottom: 14),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(children: [
                                Container(
                                    height: getVerticalSize(36.00),
                                    width: getHorizontalSize(38.00),
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
                                    text: "lbl_icon_group".tr.toUpperCase(),
                                    margin: getMargin(left: 48, bottom: 8))
                              ])))
                    ])),
                styleType: Style.bgStyle_26),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 23, top: 10, right: 23, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  ("msg_card_type_ex_new2".tr) +
                                      (cardTypeName ?? ""),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoBold18)),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(("msg_band_type_ex_icon_group".tr),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoRegular16)),
                          CustomTextFormField(
                              width: 326,
                              focusNode: FocusNode(),
                              controller: _name2_Controller,
                              hintText: "lbl_name2".tr,
                              margin: getMargin(top: 30, bottom: 5),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
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
                                        if (link1Value != null)
                                          link1Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_1'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),

                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
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
                                        if (link2Value != null)
                                          link2Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_2'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
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
                                        if (link3Value != null)
                                          link3Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_3'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
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
                                        if (link4Value != null)
                                          link4Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_4'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
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
                                        if (link5Value != null)
                                          link5Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_5'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
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
                          DropdownButton<String>(
                            isExpanded: true,
                            // Initial Value
                            value: link6Value,
                            icon: link6Value == null
                                ? Icon(Icons.keyboard_arrow_down)
                                : GestureDetector(
                                    child: Icon(Icons.remove),
                                    onTap: () {
                                      setState(() {
                                        if (link6Value != null)
                                          link6Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_6'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                link6Value = newValue;
                              });
                              //  getTemplate(newValue ?? "");
                            },
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            // Initial Value
                            value: link7Value,
                            icon: link7Value == null
                                ? Icon(Icons.keyboard_arrow_down)
                                : GestureDetector(
                                    child: Icon(Icons.remove),
                                    onTap: () {
                                      setState(() {
                                        if (link7Value != null)
                                          link7Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_7'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                link7Value = newValue;
                              });
                              //  getTemplate(newValue ?? "");
                            },
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            // Initial Value
                            value: link8Value,
                            icon: link8Value == null
                                ? Icon(Icons.keyboard_arrow_down)
                                : GestureDetector(
                                    child: Icon(Icons.remove),
                                    onTap: () {
                                      setState(() {
                                        if (link8Value != null)
                                          link8Value = null;
                                      });
                                    },
                                  ),
                            hint: Text(
                              ('lbl_link_8'.tr),
                              style: AppStyle.txtNunitoSansRegular14Gray70001,
                            ),
                            // Array list of items
                            items: allLinks.map((items) {
                              return DropdownMenuItem(
                                value: items.value,
                                child: Text(
                                  items.text ?? '',
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                link8Value = newValue;
                              });
                              //  getTemplate(newValue ?? "");
                            },
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
                        ])))));
  }

  onTapTxtBtnConfirm() {
    saveBandLinks();
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
    }).then((value) => getBandLinks(isProgress: false));
  }
}
