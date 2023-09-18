import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_title.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/getBands/get_band_data_resp.dart';

class BandNoteScreen extends StatefulWidget {
  const BandNoteScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BandNoteScreen createState() => _BandNoteScreen();
}

class _BandNoteScreen extends State<BandNoteScreen> {
  TextEditingController _heading_Controller = new TextEditingController();
  TextEditingController _content_Controller = new TextEditingController();

  final HtmlEditorController _htmlcontroller = HtmlEditorController();
  String htmlContent = "";
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
  ApiClient api = new ApiClient();
  
  Color editorColor = Colors.white;
  List<Result> fontList = [];
  String? changedFont;
  bool isToolBarVisible = true;
var existingHtml="";
  @override
  void initState() {
    
    getFontList(context);
    if (bandID != null && bandID != 0) {
      getBandData(context);
    }
    super.initState();
  }

  getFontList(BuildContext appcontext) async {
    try {
      CommonDropdownResp resp = await api.getFontList(appcontext, queryParams: {});
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
        Get.snackbar('Error', resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  getBandData(BuildContext appcontext) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "CardID": selectedCardID.toString(),
        "BandID": bandID.toString(),
        "LanguageId":GlobalVariables.currentLanguage
      };
      GetGetBandDataResp resp = await api.fetchGetBandData(appcontext, queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          _heading_Controller.text = resp.result!.heading ?? '';
          existingHtml=resp.result!.cBContent ?? '';
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

  saveBandLinks(BuildContext appcontext) async {
    try {
      var req = {
        "CardBandID": (bandID == null || bandID == 0) ? "0" : bandID.toString(),
        "CardID": selectedCardID.toString(),
        "BandType": "2",
        "Heading": _heading_Controller.text,
        "CBContent": htmlContent,
        "Latitude ": "",
        "Longitude": "",
        "Link1": "",
        "Link2": "",
        "Link3": "",
        "Link4": "",
        "Link5": "",
        "Link6": "",
        "Link7": "",
        "Link8": "",
        "DataPosition": "0",
        "CaptionLanguageId":GlobalVariables.currentLanguage
      };
      APIBooleanResponse resp = await api.createSaveBands(appcontext, requestData: req);
      if (resp.isSuccess ?? false) {
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
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
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
                                    margin: getMargin(left: 76, top: 0))
                              ])))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_33),
            body: Container(
                width: size.width,
                padding: getPadding(left: 24, top: 0, right: 24, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Text(("msg_band_type_ex_note".tr),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoRegular16)),
                      Container(
                        margin: getMargin(
                          top: 35,
                        ),
                        child: Text("lbl_heading".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      CustomTextFormField(
                          width: 326,
                          focusNode: FocusNode(),
                          controller: _heading_Controller,
                          hintText: "Enter your heading here..".tr,
                          margin: getMargin(left: 1, top: 10)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: getMargin(
                          top: 10,
                        ),
                        child: Text("lbl_content".tr,
                            style: AppStyle.txtNunitoSansBold14Pink900),
                      ),
                      CustomButton(
                          height: 50,
                          width: 350,
                          text: "  Click here to " +
                              (htmlContent.isEmpty ? "enter" : "update") +
                              " your Content".tr,
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
                              isToolBarVisible=true;
                            });
                            showAlertDialog(context);
                          }),
                      Spacer(),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_save".tr,
                          margin: getMargin(bottom: 56),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapSave,
                          alignment: Alignment.center)
                    ]))));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Okay"),
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
    return StatefulBuilder(
      builder: (context, setPopState) {
        return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Enter your Note content"),IconButton(
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
                }),]),
      content: HtmlEditor(
        controller: _htmlcontroller,
        htmlEditorOptions: HtmlEditorOptions(
          
                    filePath: "assets/summernote.html",
            hint: 'Your text here...',
            shouldEnsureVisible: true,
            initialText: htmlContent),
        htmlToolbarOptions: HtmlToolbarOptions(
          defaultToolbarButtons:!isToolBarVisible?[]: [
            FontSettingButtons(
                fontName: false,
                fontSizeUnit: false),
            FontButtons(subscript: false, superscript: false, clearAll: false),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.12))),
                            child: CustomDropdownButtonHideUnderline(
                              child: CustomDropdownButton<String>(
                                hint: Text(
                                  ('Select Font'.tr),
                                  style:
                                      AppStyle.txtNunitoSansRegular14Gray70001,
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
                                        .firstWhere((element) =>
                                            element.text == changed)
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
            print(
                "button '${describeEnum(type)}' pressed, the current selected status is $status");
            return true;
          },
          onDropdownChanged: (DropdownType type, dynamic changed,
              Function(dynamic)? updateSelectedItem) {
            print("dropdown '${describeEnum(type)}' changed to $changed");
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
          print(describeEnum(error));
          print(base64Str ?? '');
          if (file != null) {
            print(file.name);
            print(file.size);
            print(file.type);
          }
        }, onKeyDown: (int? keyCode) {
          print('$keyCode key downed');
          print('current character count: ${_htmlcontroller.characterCount}');
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
      });},
    );
  }

  updateHtmlContent() {
    setState(() {
      _htmlcontroller.getText().then((value) {
        htmlContent = value;
      });
    });
  }

  onTapSave() {
    saveBandLinks(context);
  }
}
