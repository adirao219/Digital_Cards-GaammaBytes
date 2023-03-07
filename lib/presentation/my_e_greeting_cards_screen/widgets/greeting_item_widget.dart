import 'package:digitalcards_gaammabytes/data/apiClient/api_client.dart';

import '../../../data/globals/globalvariables.dart';
import '../../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../../data/models/greetingDetails/get_greeting_details_resp.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../data/models/hideGreeting/post_hide_greeting_resp.dart';

// ignore: must_be_immutable
class GreetingItemWidget extends StatelessWidget {
  GreetingItemWidget(this.modelobj);

  GreetingListDetail modelobj;
  ApiClient api = new ApiClient();
  Offset _tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => openGreeting(context),
        onTapDown: (details) => _getTapPosition(details, context),
        onLongPress: () => _showContextMenu(context),
        child: Container(
          padding: getPadding(
            left: 3,
            top: 3,
            right: 3,
            bottom: 3,
          ),
          decoration: AppDecoration.outlineBlack9002.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                url: "https://digitalcard.gaamma.cards/" +
                    (modelobj.thumbnailImage ?? ''),
                // imagePath: ImageConstant.imgChristmasthumbnail,
                height: getVerticalSize(
                  110.00,
                ),
                width: getHorizontalSize(
                  110.00,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    5.00,
                  ),
                ),
                margin: getMargin(
                  left: 2,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 2,
                  top: 10,
                ),
                child: Text(
                  modelobj.typeIDName ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtNunitoBold14.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  showAlertDialog(BuildContext context, bool isHide) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        if (isHide)
          hideGreeting(context);
        else
          deleteGreeting(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure you want to " +
          (isHide ? "hide" : "delete") +
          " the card?"),
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
    Navigator.of(mainContext).pushNamed(AppRoutes.basicGreetingEntryScreen,
        arguments: {"Type": 0, "SelectedCardID": this.modelobj.iD});
  }

  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
          const PopupMenuItem(
            value: 'hide',
            child: Text('Hide'),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'delete':
        showAlertDialog(context, false);
        break;
      case 'hide':
        showAlertDialog(context, true);
        break;
    }
  }

  hideGreeting(BuildContext mainContext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID.toString(),
        "GreetingID": modelobj.iD.toString(),
        "IsHidden": true.toString(),
      };
      PostHideGreetingResp resp =
          await api.createHideGreeting(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        Get.snackbar('Success', "Greeting hidden successfully!",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));

        Navigator.of(mainContext).pushNamed(AppRoutes.myEGreetingCardsScreen);
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

  deleteGreeting(BuildContext mainContext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID.toString(),
        "GreetingID": modelobj.iD.toString(),
      };
      PostDeleteGreetingResp resp =
          await api.createDeleteGreeting(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        Get.snackbar('Success', "Greeting deleted successfully!",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));

        Navigator.of(mainContext).pushNamed(AppRoutes.myEGreetingCardsScreen);
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
}
