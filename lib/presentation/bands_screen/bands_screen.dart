import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/progress_dialog_utils.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteCard/get_delete_card_resp.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/getBands/get_get_bands_resp.dart';
import '../../data/models/moveUp/post_move_up_resp.dart';

class BandsScreen extends StatefulWidget {
  const BandsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BandsScreen createState() => _BandsScreen();
}

class _BandsScreen extends State<BandsScreen> {
  var cardType = Get.arguments["cardType"] as int?;
  var selectedCardID = Get.arguments["SelectedCardID"] as int?;
  var cardSubtypeID = Get.arguments["cardSubtypeID"] as int?;
  var templateId = Get.arguments["templateId"] as String?;
  var cardTypeName = Get.arguments["cardTypeName"] as String?;
  var templateName = Get.arguments["templateName"] as String?;
  var cardSubTypeName = Get.arguments["cardSubTypeName"] as String?;
  var isPublishAvailable = Get.arguments["isPublishAvailable"] as bool?;
  var cardName = Get.arguments["cardName"] as String?;
  ApiClient api = new ApiClient();
  List<BandsList> bandList = [];
  @override
  void initState() {
    getBands(true);
    super.initState();
  }

  getBands(bool showProgress) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString()
      };
      GetGetBandsResp resp =
          await api.fetchGetBands(showProgress, queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          bandList = resp.result?.bandsList ?? [];
          bandList.sort(
              (a, b) => (a.dataPosition ?? 0).compareTo(b.dataPosition ?? 0));
          // var s = 2;
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
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      var s = 1;
    }
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
                              left: 38, top: 44, right: 152, bottom: 7),
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
                                    text: "lbl_bands2".tr.toUpperCase(),
                                    margin: getMargin(left: 75, top: 0))
                              ])))
                    ])),
                styleType: Style.bgStyle_30),
            body: SingleChildScrollView(
                child: Container(
                    height: 700,
                    width: 400,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 25),
                              child: Text(
                                  ("msg_card_type_ex_new2".tr) +
                                      (cardTypeName ?? ""),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoBold18))
                        ],
                      ),
                      Visibility(
                          child: CustomButton(
                              height: 50,
                              width: 275,
                              text: "  Create New " + "lbl_note".tr + " Band",
                              margin: getMargin(top: 10, right: 6),
                              variant: ButtonVariant.OutlineBlack9003f_1,
                              shape: ButtonShape.RoundedBorder15,
                              fontStyle: ButtonFontStyle.NunitoSansBold14,
                              prefixWidget: Icon(
                                Icons.add_circle,
                                color: ColorConstant.pink900,
                              ),
                              onTap: () {
                                onTapNote(0);
                              }),
                          visible: true),
                      Visibility(
                          child: CustomButton(
                              height: 50,
                              width: 275,
                              text: "  Create New " + "lbl_map".tr + " Band",
                              margin: getMargin(top: 10, right: 6),
                              variant: ButtonVariant.OutlineBlack9003f_1,
                              shape: ButtonShape.RoundedBorder15,
                              fontStyle: ButtonFontStyle.NunitoSansBold14,
                              prefixWidget: Icon(
                                Icons.add_circle,
                                color: ColorConstant.pink900,
                              ),
                              onTap: () {
                                onTapMap(0);
                              }),
                          visible: (cardType ?? 0) != 1),
                      Visibility(
                          child: CustomButton(
                              height: 50,
                              width: 275,
                              text: "  Create New " +
                                  "lbl_icon_group".tr +
                                  " Band",
                              margin: getMargin(top: 10, bottom: 10, right: 6),
                              variant: ButtonVariant.OutlineBlack9003f_1,
                              shape: ButtonShape.RoundedBorder15,
                              fontStyle: ButtonFontStyle.NunitoSansBold14,
                              prefixWidget: Icon(
                                Icons.add_circle,
                                color: ColorConstant.pink900,
                              ),
                              onTap: () {
                                onTapIconGroup(0);
                              }),
                          visible: (cardType ?? 0) != 1),
                      Divider(),
                      Padding(
                          padding: getPadding(left: 15, top: 10),
                          child: Text("lbl_band_list".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoSansBold16Pink900
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.36)))),
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: true,
                        // Let the ListView know how many items it needs to build.
                        itemCount: bandList.length,
                        // Provide a builder function. This is where the magic happens.
                        // Convert each item into a widget based on the type of item it is.
                        itemBuilder: (context, index) {
                          var data = bandList[index];
                          return ListTile(
                              leading: Visibility(
                                  child: GestureDetector(
                                      child: Container(
                                          margin: getMargin(left: 5),
                                          child: getIconByBandType(
                                              data.bandType ?? 0)),
                                      onTap: () {
                                        editBand(data.cardBandID ?? 0,
                                            data.bandType ?? 0);
                                      }),
                                  visible: (data.bandType) != 10),
                              trailing: Visibility(
                                  child: GestureDetector(
                                      child: Container(
                                          margin: getMargin(left: 5),
                                          child: Icon(
                                            Icons.delete,
                                            color: ColorConstant.pink900,
                                          )),
                                      onTap: () {
                                        showAlertDialog(
                                            context,
                                            data.cardBandID ?? 0,
                                            data.bandType ?? 0);
                                      }),
                                  visible: (data.bandType) != 10),
                              title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(data.bandTypeIDName ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtNunitoSansBold14Pink900
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.36))),
                                          Text(data.heading ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtNunitoSansRegular14Pink
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.36)))
                                        ]),
                                    Row(
                                      children: [
                                        Visibility(
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.arrow_circle_up_rounded,
                                              color: ColorConstant.pink900,
                                              size: 32,
                                            ),
                                            onTap: () {
                                              moveUp(data.cardBandID ?? 0,
                                                  (data.dataPosition ?? 0));
                                            },
                                          ),
                                          visible: index > 0,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Visibility(
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.arrow_circle_down_rounded,
                                              color: ColorConstant.pink900,
                                              size: 32,
                                            ),
                                            onTap: () {
                                              moveDown(data.cardBandID ?? 0,
                                                  (data.dataPosition ?? 0));
                                            },
                                          ),
                                          visible:
                                              index < (bandList.length - 1),
                                        ),
                                      ],
                                    )
                                  ]));
                        },
                      )),
                      SizedBox(
                        height: 10,
                      ),
                    ])))));
  }

  Icon getIconByBandType(int bandType) {
    switch (bandType) {
      // case 2:
      //   return Icon(
      //     Icons.edit_note_rounded,
      //     size: 30,
      //   );

      // case 3:
      //   return Icon(Icons.edit_location_alt_rounded);

      // case 7:
      //   return Icon(
      //     Icons.add_link_rounded,
      //     size: 25,
      //   );

      default:
        return Icon(
          Icons.edit,
          color: ColorConstant.pink900,
        );
    }
  }

  editBand(int bandId, int bandTypeeID) {
    if (bandTypeeID == 2) {
      onTapNote(bandId);
    } else if (bandTypeeID == 3) {
      onTapMap(bandId);
    } else if (bandTypeeID == 7) {
      onTapIconGroup(bandId);
    }
  }

  showAlertDialog(BuildContext context, int bandId, int bandTypeeID) {
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
        Navigator.pop(context);
        deleteBandId(bandId, bandTypeeID);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure you want to delete the band?"),
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

  deleteBandId(int bandId, int bandTypeeID) async {
    try {
      var req = {
        "BandId": bandId.toString(),
      };
      GetDeleteCardResp resp = await api.fetchDeleteBand(queryParams: req);
      if ((resp.isSuccess ?? false) && (resp.result ?? false)) {
        Get.snackbar('Success', "Band Deleted successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        getBands(false);
      } else {
        Get.snackbar('Error', resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {
      var s = 1;
    }
  }

  moveUp(int bandId, int dataPosition) async {
    try {
      var req = {
        "BandId": bandId.toString(),
        "DataPosition": dataPosition.toString()
      };
      APIBooleanResponse resp = await api.createMoveUp(queryParams: req);
      if ((resp.isSuccess ?? false) && (resp.result ?? false)) {
        Get.snackbar('Success', "Band Moved Up!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        getBands(false);
      } else {
        Get.snackbar('Error', resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {
      var s = 1;
    }
  }

  moveDown(int bandId, int dataPosition) async {
    try {
      var req = {
        "BandId": bandId.toString(),
        "DataPosition": dataPosition.toString()
      };
      APIBooleanResponse resp = await api.createMoveDown(queryParams: req);
      if ((resp.isSuccess ?? false) && (resp.result ?? false)) {
        Get.snackbar('Success', "Band Moved Down!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
        getBands(false);
      } else {
        Get.snackbar('Error', resp.errorMessage.toString(),
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
      }
    } catch (e) {
      var s = 1;
    }
  }

  onTapNote(int bandId) {
    Navigator.of(context).pushNamed(AppRoutes.bandNoteScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "BandId": bandId,
      "cardName": cardName
    }).then((value) {
      getBands(false);
    });
  }

  onTapMap(int bandId) {
    Navigator.of(context).pushNamed(AppRoutes.bandMapScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "BandId": bandId,
      "cardName": cardName
    }).then((value) {
      getBands(false);
    });
  }

  onTapIconGroup(int bandId) {
    Navigator.of(context).pushNamed(AppRoutes.iconGroupScreen, arguments: {
      "cardType": cardType,
      "cardSubtypeID": cardSubtypeID,
      "templateId": templateId,
      "cardTypeName": cardTypeName,
      "templateName": templateName,
      "cardSubTypeName": cardSubTypeName,
      "SelectedCardID": selectedCardID,
      "isPublishAvailable": isPublishAvailable,
      "BandId": bandId,
      "cardName": cardName
    }).then((value) {
      getBands(false);
    });
  }
}
