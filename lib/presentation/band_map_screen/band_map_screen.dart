import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import '../../core/utils/osm_map.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/getBands/get_band_data_resp.dart';

class BandMapScreen extends StatefulWidget {
  const BandMapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BandMapScreen createState() => _BandMapScreen();
}

class _BandMapScreen extends State<BandMapScreen> {
  String htmlContent = "";
  final HtmlEditorController _htmlcontroller = HtmlEditorController();
  TextEditingController _heading_Controller = new TextEditingController();
  TextEditingController _latitude_Controller = new TextEditingController();
  TextEditingController _longitude_Controller = new TextEditingController();
  MapController _mapController = MapController();
  LatLng? finalLocation;
  bool locationSelected = false;
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

  var existingHtml = "";
  bool isToolBarVisible = true;
  List<Result> fontList = [];
  String? changedFont;
  ApiClient api = new ApiClient();
  @override
  void initState() {
    getFontList(context);
    getCurrentLocation();
    if (bandID != null && bandID != 0) {
      getBandData(context);
    }
    super.initState();
  }

  getFontList(BuildContext appcontext) async {
    try {
      CommonDropdownResp resp =
          await api.getFontList(appcontext, queryParams: {});
      if ((resp.isSuccess ?? false)) {
        setState(() {
          fontList = resp.result ?? [];
          if (fontList.isNotEmpty) {
            // changedFont = fontList.first.text;
            var currentFont = fontList.first.value;
            _htmlcontroller.execCommand('fontName', argument: currentFont);
          }
        });
      } else {
        Get.snackbar("lbl_error".tr, resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  getBandData(BuildContext appcontext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "BandID": bandID.toString(),
        "LanguageId": GlobalVariables.currentLanguage
      };
      GetGetBandDataResp resp =
          await api.fetchGetBandData(appcontext, queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          _heading_Controller.text = resp.result!.heading ?? '';

          existingHtml = resp.result!.cBContent ?? '';
          finalLocation = LatLng(
              resp.result?.latitude ?? 0.0, resp.result?.longitude ?? 0.0);
          _latitude_Controller.text = resp.result!.latitude!.toString();
          _longitude_Controller.text = resp.result!.longitude!.toString();
          locationSelected = true;
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

  saveBandLinks(BuildContext appcontext) async {
    try {
      var req = {
        "CardBandID": (bandID == null || bandID == 0) ? "0" : bandID.toString(),
        "CardID": selectedCardID.toString(),
        "BandType": "3",
        "Heading": _heading_Controller.text,
        "CBContent": htmlContent,
        "Latitude": _latitude_Controller.text,
        "Longitude": _longitude_Controller.text,
        "Link1": "",
        "Link2": "",
        "Link3": "",
        "Link4": "",
        "Link5": "",
        "Link6": "",
        "Link7": "",
        "Link8": "",
        "DataPosition": "0",
        "CaptionLanguageId": GlobalVariables.currentLanguage
      };
      APIBooleanResponse resp =
          await api.createSaveBands(appcontext, requestData: req);
      if (resp.result ?? false) {
        Get.snackbar("lbl_success".tr, "lbl_band_saved".tr,
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

  getCurrentLocation() async {
    try {
      var checkpermission = await _handleLocationPermission();
      if (true) {
        //checkpermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          // finalLocation = LatLng(position.latitude, position.longitude);
        });
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      // return false;
    }
    return true;
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
                              left: 38, top: 44, right: 151, bottom: 5),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(children: [
                                Container(
                                    height: getVerticalSize(36.00),
                                    width: getHorizontalSize(38.00),
                                    margin: getMargin(bottom: 8),
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
                                    margin: getMargin(left: 76, top: 16))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_34),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 20, right: 20, bottom: 20),
                child: Column(
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
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(("msg_band_type_ex_map".tr),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoRegular16)),

                      CustomTextFormField(
                          width: 326,
                          focusNode: FocusNode(),
                          controller: _heading_Controller,
                          hintText: "lbl_heading".tr,
                          margin: getMargin(top: 35)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 5, top: 22),
                              child: Text("lbl_content".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansRegular14
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.36))))),
                      CustomButton(
                          height: 50,
                          width: 350,
                          text: "  " +
                              (htmlContent.isEmpty
                                  ? "lbl_click_enter".tr
                                  : "lbl_click_update".tr),
                          margin: getMargin(top: 19, right: 6),
                          variant: ButtonVariant.OutlineBlack9003f_1,
                          shape: ButtonShape.RoundedBorder15,
                          fontStyle: ButtonFontStyle.NunitoSansBold14,
                          alignment: Alignment.center,
                          prefixWidget: Icon(
                            Icons.edit,
                            color: ColorConstant.pink900,
                          ),
                          onTap: () {
                            setState(() {
                              isToolBarVisible = true;
                            });
                            showAlertDialog(context);
                          }),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 5, top: 22),
                              child: Text("lbl_location".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNunitoSansRegular14
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.36))))),

                      CustomButton(
                          height: 50,
                          width: 375,
                          text: locationSelected
                              ? "  " + "lbl_change_location".tr
                              : "  " + "lbl_select_location".tr,
                          margin: getMargin(top: 19),
                          variant: ButtonVariant.OutlineBlack9003f_1,
                          shape: ButtonShape.RoundedBorder15,
                          fontStyle: ButtonFontStyle.NunitoSansBold14,
                          alignment: Alignment.center,
                          prefixWidget: Icon(
                            Icons.location_pin,
                            color: ColorConstant.pink900,
                          ),
                          onTap: () {
                            goToLocationPage();
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      // CustomImageView(
                      //     imagePath: ImageConstant.imgScreenshot55,
                      //     height: getVerticalSize(171.00),
                      //     width: getHorizontalSize(344.00),
                      //     margin: getMargin(top: 22)),
                      finalLocation == null
                          ? Container()
                          : Expanded(
                              child: Stack(children: [
                              FlutterMap(
                                options: MapOptions(
                                    center: LatLng(finalLocation!.latitude,
                                        finalLocation!.longitude),
                                    interactiveFlags: InteractiveFlag.pinchZoom,
                                    zoom: 15.0,
                                    maxZoom: 18,
                                    minZoom: 6),
                                mapController: _mapController,
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    subdomains: ['a', 'b', 'c'],
                                    // attributionBuilder: (_) {
                                    //   return Text("© OpenStreetMap contributors");
                                    // },
                                  ),
                                ],
                              ),
                              // Positioned.fill(
                              //     child: IgnorePointer(
                              //   child: Center(
                              //     child: Icon(Icons.location_pin,
                              //         size: 50, color: ColorConstant.pink900),
                              //   ),
                              // )),
                            ])),
                      CustomTextFormField(
                          width: 326,
                          focusNode: FocusNode(),
                          controller: _latitude_Controller,
                          hintText: "lbl_latitude".tr,
                          margin: getMargin(top: 23)),
                      CustomTextFormField(
                          width: 326,
                          focusNode: FocusNode(),
                          controller: _longitude_Controller,
                          hintText: "lbl_longitude".tr,
                          margin: getMargin(top: 24),
                          textInputAction: TextInputAction.done),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_save".tr,
                          margin: getMargin(top: 20, bottom: 5),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapSave)
                    ]))));
  }

  updateHtmlContent() {
    setState(() {
      _htmlcontroller.getText().then((value) {
        htmlContent = value;
      });
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("lbl_cancel".tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("lbl_okay".tr),
      onPressed: () {
        updateHtmlContent();
        Navigator.pop(context);
        // removeSelectedImage();
      },
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setPopState) {
          return AlertDialog(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("lbl_enter_note".tr),
                  IconButton(
                      icon: Icon(
                        isToolBarVisible
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        size: 35,
                      ),
                      onPressed: () {
                        setPopState(() {
                          isToolBarVisible = !isToolBarVisible;
                        });
                      }),
                ]),
            content: HtmlEditor(
              controller: _htmlcontroller,
              htmlEditorOptions: HtmlEditorOptions(
                  filePath: "assets/summernote.html",
                  hint: "lbl_your_text".tr,
                  shouldEnsureVisible: true,
                  initialText: htmlContent),
              htmlToolbarOptions: HtmlToolbarOptions(
                defaultToolbarButtons: !isToolBarVisible
                    ? []
                    : [
                        FontSettingButtons(
                            fontName: false, fontSizeUnit: false),
                        FontButtons(
                            subscript: false,
                            superscript: false,
                            clearAll: false),
                        ColorButtons(),
                        ParagraphButtons(
                            alignCenter: true,
                            alignJustify: true,
                            alignLeft: true,
                            alignRight: true,
                            lineHeight: true,
                            caseConverter: false,
                            decreaseIndent: true,
                            increaseIndent: true,
                            textDirection: false),
                      ],
                customToolbarButtons: !isToolBarVisible
                    ? []
                    : [
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          height: kMinInteractiveDimension,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.12))),
                          child: CustomDropdownButtonHideUnderline(
                            child: CustomDropdownButton<String>(
                              hint: Text(
                                ("lbl_select_font".tr),
                                style: AppStyle.txtNunitoSansRegular14Gray70001,
                              ),
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height / 4,
                              menuDirection: DropdownMenuDirection.down,
                              items: fontList.map((e) {
                                return CustomDropdownMenuItem(
                                  value: e.text,
                                  child: Text(e.text ?? '',
                                      style: TextStyle(fontFamily: e.value)),
                                );
                              }).toList(),
                              value: changedFont,
                              onChanged: (String? changed) {
                                if (changed != null) {
                                  var currentfont = fontList
                                      .firstWhere(
                                          (element) => element.text == changed)
                                      .value;
                                  setPopState(() {
                                    changedFont = changed;
                                    _htmlcontroller.execCommand('fontName',
                                        argument: currentfont);
                                  });
                                }
                              },
                            ),
                          ),
                        )
                        // add the other widgets here!!
                      ],
                toolbarPosition: ToolbarPosition.aboveEditor, //by default
                toolbarType: ToolbarType.nativeGrid, //by default
                onButtonPressed:
                    (ButtonType type, bool? status, Function? updateStatus) {
                  // print(
                  //     "button '${describeEnum(type)}' pressed, the current selected status is $status");
                  return true;
                },
                onDropdownChanged: (DropdownType type, dynamic changed,
                    Function(dynamic)? updateSelectedItem) {
                  // print("dropdown '${describeEnum(type)}' changed to $changed");
                  return true;
                },
                mediaLinkInsertInterceptor: (String url, InsertFileType type) {
                  print(url);
                  return true;
                },
                mediaUploadInterceptor:
                    (PlatformFile file, InsertFileType type) async {
                  print(file.name); //filename
                  print(file.size); //size in bytes
                  print(file.extension); //file extension (eg jpeg or mp4)
                  return true;
                },
              ),
              otherOptions: OtherOptions(height: 600),
              callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                print('html before change is $currentHtml');
              }, onChangeContent: (String? changed) {
                print('content changed to $changed');
              }, onChangeCodeview: (String? changed) {
                print('code changed to $changed');
              }, onChangeSelection: (EditorSettings settings) {
                print('parent element is ${settings.parentElement}');
                print('font name is ${settings.fontName}');
              }, onDialogShown: () {
                print('dialog shown');
              }, onEnter: () {
                print('enter/return pressed');
              }, onFocus: () {
                print('editor focused');
              }, onBlur: () {
                print('editor unfocused');
              }, onBlurCodeview: () {
                print('codeview either focused or unfocused');
              }, onInit: () {
                _htmlcontroller.setText(existingHtml);
                print('init');
              }, onImageUploadError:
                  (FileUpload? file, String? base64Str, UploadError error) {
                // print(describeEnum(error));
                print(base64Str ?? '');
                if (file != null) {
                  print(file.name);
                  print(file.size);
                  print(file.type);
                }
              }, onKeyDown: (int? keyCode) {
                print('$keyCode key downed');
                // print('current character count: ${_htmlcontroller.characterCount}');
              }, onKeyUp: (int? keyCode) {
                print('$keyCode key released');
              }, onMouseDown: () {
                print('mouse downed');
              }, onMouseUp: () {
                print('mouse released');
              }, onNavigationRequestMobile: (String url) {
                print(url);
                return NavigationActionPolicy.ALLOW;
              }, onPaste: () {
                print('pasted into editor');
              }, onScroll: () {
                print('editor scrolled');
              }),
              plugins: [
                SummernoteAtMention(
                    getSuggestionsMobile: (String value) {
                      var mentions = <String>['test1', 'test2', 'test3'];
                      return mentions
                          .where((element) => element.contains(value))
                          .toList();
                    },
                    mentionsWeb: ['test1', 'test2', 'test3'],
                    onSelect: (String value) {
                      print(value);
                    }),
              ],
            ),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        });
      },
    );
  }

  goToLocationPage() {
    Get.toNamed(AppRoutes.locationselection)?.then((value) {
      setState(() {
        finalLocation = null;
      });
      setState(() {
        if (value['latLong'] != null) {
          locationSelected = true;
          var ltlng = value['latLong'] as LatLong;
          finalLocation = LatLng(ltlng.latitude, ltlng.longitude);
          var newLatLong = LatLng(ltlng.latitude, ltlng.longitude);
          _latitude_Controller.text = ltlng.latitude.toString();
          _longitude_Controller.text = ltlng.longitude.toString();
          _mapController.move(newLatLong, 15);
        }
      });
    });
  }

  onTapSave() {
    saveBandLinks(context);
  }
}
