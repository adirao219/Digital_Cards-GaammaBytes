import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/globals/globalvariables.dart';
import '../../../data/models/cardDetails/get_card_details_resp.dart';
import '../../../data/models/deleteCard/get_delete_card_resp.dart';
import '../../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../../data/models/greetingDetails/get_greeting_details_resp.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../../../data/models/hideCard/get_hide_card_resp.dart';
import '../../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../../widgets/custom_button.dart';

// ignore: must_be_immutable
class DigitalCardItemWidget extends StatelessWidget {
  DigitalCardItemWidget(this.modelobj, this.isHidden, this.actionPerformed);

  CardDetailsListDetail modelobj;
  bool isHidden;
  Function actionPerformed;
  ApiClient api = new ApiClient();
  Offset _tapPosition = Offset.zero;
  List<Result> creditTypes = [];
  @override
  Widget build(BuildContext context) {
    return CustomFocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.50,
      blurSize: 5.0,
      menuItemExtent: 45,
      menuBoxDecoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      duration: Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.black54,
      bottomOffsetHeight: 0,
      openWithTap: true,
      menuItems: <CustomFocusedMenuItem>[
        CustomFocusedMenuItem(
            title: Text("lbl_edit".tr),
            trailingIcon: Icon(Icons.edit),
            onPressed: () {
              openCard(context);
            }),
        CustomFocusedMenuItem(
            title: Text("lbl_preview".tr),
            trailingIcon: Icon(Icons.remove_red_eye),
            onPressed: () {
              openCardPreview(context);
            }),
        CustomFocusedMenuItem(
            title: Text("lbl_publish".tr),
            trailingIcon: Icon(Icons.cloud_upload_rounded),
            onPressed: () {
              publishCardAction(context);
            }),
        CustomFocusedMenuItem(
            isVisible: ((modelobj.cardStatus ?? 0) == 2 ||
                    (modelobj.cardStatus ?? 0) == 7)
                ? true
                : false,
            title: Text("lbl_open_published_card".tr),
            trailingIcon: Icon(Icons.open_in_new),
            onPressed: () {
              openPublishedCard(context);
            }),
        CustomFocusedMenuItem(
            title: Text("lbl_share".tr),
            isVisible: ((modelobj.cardStatus ?? 0) == 2 ||
                    (modelobj.cardStatus ?? 0) == 7)
                ? true
                : false,
            trailingIcon: Icon(Icons.share),
            onPressed: () {
              shareCard(context);
            }),
        CustomFocusedMenuItem(
            title: Text((isHidden ? ("lbl_unhide".tr) : ("lbl_hide".tr))),
            trailingIcon:
                Icon(isHidden ? Icons.unarchive : Icons.remove_circle),
            onPressed: () {
              showAlertDialog(context, true);
            }),
        CustomFocusedMenuItem(
            title: Text(
              "lbl_delete".tr,
              style: TextStyle(color: Colors.redAccent),
            ),
            trailingIcon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              showAlertDialog(context, false);
            }),
      ],
      onPressed: () {},
      child: Card(
        elevation: 7,
        child: Column(
          children: <Widget>[
            Container(
              padding: getPadding(
                left: 1,
                top: 1,
                right: 1,
                bottom: 1,
              ),
              decoration: BoxDecoration().copyWith(
                  borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  10.00,
                ),
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    url: (modelobj.thumbnailImage ?? ''),
                    radius: BorderRadius.circular(15),
                    // height: getVerticalSize(49.00),
                    // width: getHorizontalSize(129.00),
                    margin: getMargin(
                      top: 5,
                    ),
                    height: getVerticalSize(
                      100.00,
                    ),
                    width: getHorizontalSize(
                      100.00,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 2,
                      top: 2,
                    ),
                    child: Column(
                      children: [
                        Text(
                          modelobj.name ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold12.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.05,
                            ),
                          ),
                        ),
                        Text(
                          " (" + (modelobj.cardSubTypeName ?? '') + ")",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular10.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.05,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(modelobj.createdDateString ?? '',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ColorConstant.pink900, fontSize: 10))
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

  showAlertDialog(BuildContext context, bool isHide) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_cancel".tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("lbl_continue".tr),
      onPressed: () {
        if (isHide)
          hideGreeting(context);
        else
          deleteGreeting(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("lbl_confirmation".tr),
      content: Text(
          (isHide ? (isHidden ? ("lbl_unhide_confirm".tr) : ("lbl_hide_confirm".tr)) : "lbl_delete_card_confirm".tr)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showCreditTypeDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_cancel".tr),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(children: [
        Text(
          "lbl_editing_validity_title".tr,
          style: AppStyle.txtNunitoSansBold12Pink900,
        ),
        Text(
          "\n"
        ),
        Text(
          "lbl_credit_upgrade_msg".tr,
          style: AppStyle.txtNunitoSansBold14Pink900,
        )
      ]),
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: creditTypes
            .map(
              (e) => CustomButton(
                height: 50,
                width: 350,
                text: "   " + (e.text ?? ''),
                prefixWidget: Icon(
                  Icons.credit_score,
                  color: ColorConstant.pink900,
                ),
                margin: getMargin(top: 10),
                variant: ButtonVariant.OutlineBlack9003f_1,
                shape: ButtonShape.RoundedBorder15,
                fontStyle: ButtonFontStyle.NunitoSansBold14,
                onTap: () {
                  assignCardEditCredits(e.value.toString(), context);
                },
              ),
            )
            .toList(),
      )),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _getTapPosition(TapDownDetails details, BuildContext mainContext) {
    final RenderBox referenceBox = mainContext.findRenderObject() as RenderBox;

    _tapPosition = referenceBox.globalToLocal(details.globalPosition);

    // Navigator.of(mainContext).pushNamed(AppRoutes.basicGreetingEntryScreen,
    //     arguments: {"Type": 0, "SelectedCardID": this.modelobj.iD});
  }

  openCard(BuildContext mainContext) {
    checkEditExpiry(mainContext);
  }

  openCardPreview(BuildContext mainContext) {
    Navigator.of(mainContext).pushNamed(AppRoutes.cardPreviewScreen,
        arguments: {"CardID": this.modelobj.cardID, "isDigitalCard": true});
  }

  shareCard(BuildContext mainContext) {
    onShare();
  }

  openPublishedCard(BuildContext mainContext) {
    launchCardURL();
  }

  publishCardAction(BuildContext mainContext) {
    showPublishAlertDialog(mainContext);
  }

  launchCardURL() async {
    //open card url
    String cardURL =
        this.modelobj.publishedURL ?? ''; // this.modelobj.picture1??'';
    if (cardURL.isEmpty) {
      Get.snackbar("lbl_warning".tr, "Card needs to be published!",
          backgroundColor: Color.fromARGB(255, 255, 224, 156),
          colorText: Color.fromARGB(255, 105, 73, 3),
          icon: Icon(
            Icons.warning,
            color: Color.fromARGB(255, 105, 73, 3),
          ));

      return;
    }
    if (await canLaunch(cardURL)) {
      await launch(cardURL);
    } else {
      throw 'Could not launch ' + cardURL;
    }
  }

  onShare() {
    //open card url
    String cardURL =
        this.modelobj.publishedURL ?? ''; // this.modelobj.picture1??'';
    if (cardURL.isEmpty) {
      Get.snackbar("lbl_warning".tr, "Card needs to be published!",
          backgroundColor: Color.fromARGB(255, 255, 224, 156),
          colorText: Color.fromARGB(255, 105, 73, 3),
          icon: Icon(
            Icons.warning,
            color: Color.fromARGB(255, 105, 73, 3),
          ));

      return;
    }
    //open card url
    Share.share(
        (this.modelobj.publishedURL ?? '') // (this.modelobj.picture1??'')
        );
  }

  showPublishAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_no".tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("lbl_yes".tr),
      onPressed: () {
        // Navigator.pop(context);
        publishCard(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("lbl_confirmation".tr),
      content: Text("lbl_publish_confirmation".tr),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  publishCard(BuildContext maincontext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": this.modelobj.cardID.toString(),
      };
      APIResponse resp = await api.fetchPublish(maincontext,queryParams: req);
      if ((resp.isSuccess ?? false)) {
        
        Get.snackbar("lbl_success".tr, "lbl_card_publish".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));

    Navigator.pop(maincontext);
        actionPerformed();
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

  checkEditExpiry(BuildContext mainContext) async {
    try {
      var req = {
        "CardType": this.modelobj.cardType.toString(),
        "CardId": this.modelobj.cardID.toString(),
      };
      APIBooleanResponse resp = await api.checkCardEditExpiry(mainContext,requestData: req);
      if ((resp.result ?? false)) {
        Navigator.of(mainContext)
            .pushNamed(AppRoutes.basicCardEntryOneScreen, arguments: {
          "Type": this.modelobj.cardType,
          "SelectedCardID": this.modelobj.cardID,
          "isPublished": ((modelobj.cardStatus ?? 0) == 2 ||
              (modelobj.cardStatus ?? 0) == 7),
          "publishedURL": this.modelobj.publishedURL,
          "TypeName": this.modelobj.cardTypeName,
          "SubTypeName": this.modelobj.cardSubTypeName ?? ""
        });
      } else {
        Get.snackbar(
            "lbl_error".tr,
            "lbl_credit_expired_error".tr
                .toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
        await getCreditTypes(mainContext);
        showCreditTypeDialog(mainContext);
      }
    } catch (e) {}
  }

  getCreditTypes( BuildContext mainContext) async {
    try {

      var req = {
        "LanguageId":GlobalVariables.currentLanguage
      };
      CommonDropdownResp resp = await api.getCreditType(mainContext,queryParams: req);
      if ((resp.isSuccess ?? false)) {
        creditTypes = resp.result ?? [];
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

  assignCardEditCredits(String value, BuildContext mainContext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardType": this.modelobj.cardType.toString(),
        "CardId": this.modelobj.cardID.toString(),
        "NumCredits": value,
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      APIResponse resp = await api.assignCardEditCredits(mainContext,requestData: req);
      if ((resp.isSuccess ?? false)) {
        Get.snackbar(
            "lbl_success".tr,"lbl_validity_upgrade_success".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));

        Navigator.pop(mainContext);
        actionPerformed();
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

  hideGreeting(BuildContext mainContext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID.toString(),
        "CardId": modelobj.cardID.toString(),
        "IsHidden": (isHidden ? false : true).toString(),
      };
      GetHideCardResp resp = await api.fetchHideCard(mainContext,queryParams: req);
      if ((resp.isSuccess ?? false)) {
        Navigator.pop(mainContext);
        Get.snackbar("lbl_success".tr, (isHidden ? "lbl_card_unhidden_success".tr : "lbl_card_hidden_success".tr),
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        actionPerformed();
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

  deleteGreeting(BuildContext mainContext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID.toString(),
        "CardId": modelobj.cardID.toString(),
      };
      GetDeleteCardResp resp = await api.fetchDeleteCard(mainContext,queryParams: req);
      if ((resp.isSuccess ?? false)) {
        Navigator.pop(mainContext);
        Get.snackbar("lbl_success".tr, "lbl_card_deleted".tr,
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        actionPerformed();
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
}
