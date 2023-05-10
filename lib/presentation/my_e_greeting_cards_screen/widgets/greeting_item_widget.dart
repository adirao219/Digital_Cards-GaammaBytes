import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';

import '../../../data/globals/globalvariables.dart';
import '../../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../../data/models/greetingDetails/get_greeting_details_resp.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../../../data/models/hideGreeting/post_hide_greeting_resp.dart';

// ignore: must_be_immutable
class GreetingItemWidget extends StatelessWidget {
  GreetingItemWidget(this.modelobj, this.isHidden,this.actionPerformed);

  GreetingListDetail modelobj;
  bool isHidden;
  Function actionPerformed;
  ApiClient api = new ApiClient();
  Offset _tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.50,
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
            title: Text("Edit"),
            trailingIcon: Icon(Icons.edit),
            onPressed: () {
              openGreeting(context);
            }),
            FocusedMenuItem(
            title: Text("Preview"),
            trailingIcon: Icon(Icons.remove_red_eye),
            onPressed: () {
              openCardPreview(context);
            }),
        FocusedMenuItem(
            title: Text((isHidden ? "Un-Hide" : "Hide")),
            trailingIcon:
                Icon(isHidden ? Icons.unarchive : Icons.remove_circle),
            onPressed: () {
              showAlertDialog(context, true);
            }),
        
        FocusedMenuItem(
            title: Text(
              "Delete",
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
                      110.00,
                    ),
                    width: getHorizontalSize(
                      110.00,
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
                          modelobj.typeIDName ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold12.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.10,
                            ),
                          ),
                        ),
                         Text(
                          modelobj.createdDateString ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:TextStyle(color: ColorConstant.pink900,fontSize: 10)
                        )
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
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
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

  openCardPreview(BuildContext mainContext) {
    Navigator.of(mainContext).pushNamed(AppRoutes.cardPreviewScreen,
        arguments: {"CardID": this.modelobj.iD});
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
actionPerformed();
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
      PostBooleanGreetingResp resp =
          await api.createDeleteGreeting(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        Get.snackbar('Success', "Greeting deleted successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
actionPerformed();
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
