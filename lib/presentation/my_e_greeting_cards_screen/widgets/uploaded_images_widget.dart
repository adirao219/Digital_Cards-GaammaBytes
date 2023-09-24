import 'dart:math';

import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';

import 'package:url_launcher/url_launcher.dart';
import '../../../data/globals/globalvariables.dart';
import '../../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../../data/models/driveImages/drive_file_images_resp.dart';
import '../../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../../data/models/greetingDetails/get_greeting_details_resp.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../../../data/models/hideGreeting/post_hide_greeting_resp.dart';

// ignore: must_be_immutable
class UploadedImageWidget extends StatelessWidget {
  UploadedImageWidget(this.modelobj, this.pictureType, this.selectedCard,this.cropSelectedImage);

  Random random = new Random();
  DriveFilesData modelobj;
  UserImageType pictureType;
  Function(DriveFilesData, UserImageType) selectedCard;
  Function(DriveFilesData, UserImageType) cropSelectedImage;
  ApiClient api = new ApiClient();
  Offset _tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: getMargin(left: 5),
        child: FocusedMenuHolder(
            menuWidth: MediaQuery.of(context).size.width * 0.40,
            blurSize: 5.0,
            menuItemExtent: 45,
            menuBoxDecoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            duration: Duration(milliseconds: 100),
            animateMenuItems: true,
            blurBackgroundColor: Colors.black54,
            bottomOffsetHeight: 100,
            openWithTap: true,
            menuItems: <FocusedMenuItem>[
              FocusedMenuItem(
                  title: Text("lbl_select".tr),
                  trailingIcon: Icon(Icons.done),
                  onPressed: () {
                    selectedCard(this.modelobj,  pictureType);
                  }),
              FocusedMenuItem(
                  title: Text("lbl_crop".tr),
                  trailingIcon: Icon(Icons.crop),
                  onPressed: () {
                    cropSelectedImage(this.modelobj,pictureType);
                    // showAlertDialog(context, true);
                  }),
              FocusedMenuItem(
                  title: Text("lbl_preview".tr),
                  trailingIcon: Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {
                    openImagePreview(this.modelobj.driveUrl ?? '');
                  }),
              // if (!(this.modelobj.isPreDefined ?? false))
              //   FocusedMenuItem(
              //       title: Text(
              //         "lbl_delete".tr,
              //         style: TextStyle(color: Colors.redAccent),
              //       ),
              //       trailingIcon: Icon(
              //         Icons.delete,
              //         color: Colors.redAccent,
              //       ),
              //       onPressed: () {
              //         showAlertDialog(context, false);
              //       }),
            ],
            onPressed: () {},
            child: Card(
                elevation: 7,
                child: Container(
                    width: getHorizontalSize(115.00),
                    margin: getMargin(left: 0, top: 5, bottom: 5),
                    padding: getPadding(left: 5, top: 5, right: 5, bottom: 5),
                    // decoration: getDecorationBox(random.nextInt(6)),
                    child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: getPadding(left: 0),
                              child: Text(this.modelobj.fileName ?? '',
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoBold12)),
                          CustomImageView(
                              url: this.modelobj.driveUrl,
                              radius: BorderRadius.circular(15),
                              // height: getVerticalSize(49.00),
                              // width: getHorizontalSize(129.00),
                              margin: getMargin(
                                top: 5,
                              ))
                        ])))));
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
        
        (isHide ? ("lbl_hide_confirm".tr) : "lbl_delete_card_confirm".tr)),
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

  void _getTapPosition(TapDownDetails details, BuildContext mainContext) {
    final RenderBox referenceBox = mainContext.findRenderObject() as RenderBox;

    _tapPosition = referenceBox.globalToLocal(details.globalPosition);

    // Navigator.of(mainContext).pushNamed(AppRoutes.basicGreetingEntryScreen,
    //     arguments: {"Type": 0, "SelectedCardID": this.modelobj.iD});
  }

  openGreeting(BuildContext mainContext) {
    Navigator.of(mainContext)
        .pushNamed(AppRoutes.basicGreetingEntryScreen, arguments: {
      // "Type": this.modelobj.typeID,
      // "SelectedCardID": this.modelobj.iD
    });
  }

  openImagePreview(String url) {
    launchURL(url);
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ' + url;
    }
  }

  hideGreeting(BuildContext mainContext) async {
    try {
      // var req = {
      //   "UserId": GlobalVariables.userID.toString(),
      //   "GreetingID": modelobj.iD.toString(),
      //   "IsHidden": (isHidden ? false : true).toString(),
      // };
      // PostHideGreetingResp resp =
      //     await api.createHideGreeting(context,queryParams: req);
      // if ((resp.isSuccess ?? false)) {
      //   Get.snackbar("lbl_success".tr,
      //       "Greeting " + (isHidden ? "un" : "") + "hidden successfully!",
      //       backgroundColor: Color.fromARGB(255, 208, 245, 216),
      //       colorText: Colors.green[900],
      //       icon: Icon(
      //         Icons.done,
      //         color: Colors.green[900],
      //       ));

      //   Navigator.of(mainContext).pushNamed(AppRoutes.myEGreetingCardsScreen);
      // } else {
      //   Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
      //       backgroundColor: Color.fromARGB(255, 255, 230, 230),
      //       colorText: Colors.red[900],
      //       icon: Icon(
      //         Icons.error,
      //         color: Colors.red[900],
      //       ));
      // }
    } catch (e) {}
  }

  deleteGreeting(BuildContext mainContext) async {
    try {
      // var req = {
      //   "UserId": GlobalVariables.userID.toString(),
      //   "GreetingID": modelobj.iD.toString(),
      // };
      // PostDeleteGreetingResp resp =
      //     await api.createDeleteGreeting(context,queryParams: req);
      // if ((resp.isSuccess ?? false)) {
      //   Get.snackbar("lbl_success".tr, "lbl_greeting_deleted".tr,
      //       backgroundColor: Color.fromARGB(255, 208, 245, 216),
      //       colorText: Colors.green[900],
      //       icon: Icon(
      //         Icons.done,
      //         color: Colors.green[900],
      //       ));

      //   Navigator.of(mainContext).pushNamed(AppRoutes.myEGreetingCardsScreen);
      // } else {
      //   Get.snackbar("lbl_error".tr, resp.errorMessage.toString(),
      //       backgroundColor: Color.fromARGB(255, 255, 230, 230),
      //       colorText: Colors.red[900],
      //       icon: Icon(
      //         Icons.error,
      //         color: Colors.red[900],
      //       ));
      // }
    } catch (e) {}
  }

  BoxDecoration getDecorationBox(int index) {
    switch (index) {
      case 1:
        return AppDecoration.fillPurple50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 2:
        return AppDecoration.fillDeeppurple50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 3:
        return AppDecoration.fillRed10001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 4:
        return AppDecoration.fillYellow100
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 5:
        return AppDecoration.fillDeeporangeA100a3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      default:
        return AppDecoration.fillLightblue50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);
    }
  }
}
