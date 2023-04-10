import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';

import '../../../data/globals/globalvariables.dart';
import '../../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../../data/models/greetingDetails/get_greeting_details_resp.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../data/models/hideGreeting/post_hide_greeting_resp.dart';

// ignore: must_be_immutable
class GreetingItemWidget extends StatelessWidget {
  GreetingItemWidget(this.modelobj, this.isHidden);

  GreetingListDetail modelobj;
  bool isHidden;
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
          decoration: BoxDecoration(
            boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(1.00),
                                              blurRadius:
                                                  getHorizontalSize(1.00),
                                              offset: Offset(0, 1))
                                        ],
              color: ColorConstant.whiteA700,
              border: Border.all(
                color: ColorConstant.gray300,
                width: getHorizontalSize(
                  2.00,
                ),
                
              )).copyWith(
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
                  110.00,
                ),
                width: getHorizontalSize(
                  110.00,
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
                  
                  style: AppStyle.txtInterSemiBold12.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.10,
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
          (isHide ? (isHidden ? "un-hide" : "hide") : "delete") +
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
        arguments: {
          "Type": this.modelobj.typeID,
          "SelectedCardID": this.modelobj.iD
        });
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
          PopupMenuItem(
            value: 'hide',
            child: Text((isHidden ? "Un-Hide" : "Hide")),
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
        "IsHidden": (isHidden ? false : true).toString(),
      };
      PostHideGreetingResp resp =
          await api.createHideGreeting(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        Get.snackbar('Success',
            "Greeting " + (isHidden ? "un-" : "") + "hidden successfully!",
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
