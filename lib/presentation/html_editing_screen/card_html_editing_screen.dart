import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/services.dart';
import '../../data/apiClient/api_client.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../helper/constants.dart';
import '../../widgets/custom_button.dart';

class CardHtmlEditorScreen extends StatefulWidget {
  CardHtmlEditorScreen({Key? key}) : super(key: key);

  @override
  _CardHtmlEditorScreenState createState() => _CardHtmlEditorScreenState();
}

class _CardHtmlEditorScreenState extends State<CardHtmlEditorScreen> {
  String result = '';
  List<DefaultCaptionMessageData>? allDefaultCaptions;
  List<DefaultCaptionMessageData>? defaultCaptions;
  TextEditingController _searchController = new TextEditingController();
  final HtmlEditorController _htmlcontroller = HtmlEditorController();
  String htmlContent = "";
  int groupValue = 0;
  var typeID = Get.arguments["templateID"] as String?;
  var cardType = Get.arguments["cardType"] as int?;
  var cardSubType = Get.arguments["cardSubType"] as int?;
  var messageDefault = Get.arguments["messageContent"] as String?;
  var backgroundColor = Get.arguments["backgroundColor"] as String?;
  ApiClient api = new ApiClient();
  Color editorColor = Colors.white;
  List<Result> fontList = [];
  String? changedFont;
  bool isToolBarVisible = true;
  @override
  void initState() {
    getFontList();
    setState(() {
      editorColor = fromHex(backgroundColor ?? '');
    });

    _htmlcontroller.setText(messageDefault ?? '');
    super.initState();
  }

  getFontList() async {
    try {
      CommonDropdownResp resp = await api.getFontList(context,queryParams: {});
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

  bool checkIsLight(Color background) {
    return (background.computeLuminance() > 0.179) ? false : true;
  }

  getControllerContent() {
    _htmlcontroller.getText().then((value) {
      htmlContent = value;
      Navigator.pop(context, {"htmlContent": htmlContent});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          _htmlcontroller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[50],
          foregroundColor: Color.fromARGB(255, 97, 8, 8),
          title: Text("lbl_edit_your_html".tr),
          elevation: 0,
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                   GestureDetector(
                      onTap: () {
                        setState(() {
                          isToolBarVisible = !isToolBarVisible;
                        });
                      },
                      child: Text(
                        " " +
                            (!isToolBarVisible ? "Show" : "Hide") +
                            "\nToolbar",
                        style: TextStyle(fontSize: 10),
                      ),
                    ), IconButton(
                        icon: Icon(
                          isToolBarVisible
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            isToolBarVisible = !isToolBarVisible;
                          });
                        }),
                    
                  ]),
            IconButton(
                icon: Icon(Icons.done_all),
                onPressed: () async {
                  getControllerContent();
                })
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color.fromARGB(255, 97, 8, 8),
        //   foregroundColor: Colors.white,
        //   onPressed: () {
        //     _htmlcontroller.toggleCodeView();
        //   },
        //   child: Text(r'<\>',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        // ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              HtmlEditor(
                controller: _htmlcontroller,
                htmlEditorOptions: HtmlEditorOptions(
                    filePath: "assets/summernote.html",
                    hint: "lbl_your_text".tr,
                    shouldEnsureVisible: true,
                    initialText: htmlContent),
                htmlToolbarOptions: HtmlToolbarOptions(
                  textStyle: TextStyle(
                      color: checkIsLight(editorColor)
                          ? Colors.white
                          : Colors.black),
                  buttonFillColor: Colors.white,
                                  dropdownBackgroundColor: editorColor,
                  buttonColor:
                      checkIsLight(editorColor) ? Colors.white : Colors.black,
                  // buttonBorderColor: Colors.,
                  buttonHighlightColor: Colors.white,
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
                          InsertButtons(
                              table: true,
                              audio: false,
                              hr: false,
                              link: false,
                              otherFile: false,
                              picture: false,
                              video: false),
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
                                  ("lbl_select_font".tr),
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
                                    setState(() {
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
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
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
                otherOptions: OtherOptions(
                    height: 600, decoration: BoxDecoration(color: editorColor)),
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
                  // if (changedFont != null) {
                  //   var currentfont = fontList
                  //       .firstWhere((element) => element.text == changedFont)
                  //       .value;
                  //   setState(() {
                  //     _htmlcontroller.execCommand('fontName',
                  //         argument: currentfont);
                  //   });
                  // }
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  _htmlcontroller.setText(messageDefault ?? '');
                  // _htmlcontroller.execCommand('fontName',
                  //     argument: changedFont);
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
                  print(
                      'current character count: ${_htmlcontroller.characterCount}');
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 16,
                    ),
                    CustomButton(
                      height: 40,
                      width: 40,
                      // text: logoPositionName,
                      prefixWidget: Icon(
                        Icons.undo,
                        color: ColorConstant.pink900,
                      ),
                      // margin: getMargin(top: 22),
                      variant: ButtonVariant.OutlineBlack9003f_1,
                      shape: ButtonShape.RoundedBorder15,
                      fontStyle: ButtonFontStyle.NunitoSansBold14,
                      onTap: () {
                        _htmlcontroller.undo();
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    CustomButton(
                      height: 40,
                      width: 40,
                      // text: logoPositionName,
                      prefixWidget: Icon(
                        Icons.redo,
                        color: ColorConstant.pink900,
                      ),
                      // margin: getMargin(top: 22),
                      variant: ButtonVariant.OutlineBlack9003f_1,
                      shape: ButtonShape.RoundedBorder15,
                      fontStyle: ButtonFontStyle.NunitoSansBold14,
                      onTap: () {
                        _htmlcontroller.redo();
                      },
                    ),
                  ],
                ),
              ),

              // Container(margin: getMargin(bottom: 75)),
            ],
          ),
        ),
      ),
    );
  }
}
