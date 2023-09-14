import 'dart:collection';

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

class HtmlEditorScreen extends StatefulWidget {
  HtmlEditorScreen({Key? key}) : super(key: key);

  @override
  _HtmlEditorScreenState createState() => _HtmlEditorScreenState();
}

class _HtmlEditorScreenState extends State<HtmlEditorScreen> {
  String result = '';
  List<DefaultCaptionMessageData>? allDefaultCaptions;
  List<DefaultCaptionMessageData>? defaultCaptions;
  int currentIndex = 0;
  int previousIndex = 0;
  TextEditingController _searchController = new TextEditingController();
  final HtmlEditorController _captioncontroller = HtmlEditorController();
  final HtmlEditorController _messagecontroller = HtmlEditorController();
  final HtmlEditorController _sendercontroller = HtmlEditorController();
  // String htmlContent="";
  var initialIndex = Get.arguments["initialIndex"] as int?;
  var captionContent = Get.arguments["captionContent"] as String?;
  var messageContent = Get.arguments["messageContent"] as String?;
  var senderContent = Get.arguments["senderContent"] as String?;
  var backgroundColor = Get.arguments["backgroundColor"] as String?;
  int groupValue = 0;
  var typeID = Get.arguments["templateID"] as String?;
  var greetingTypeID = Get.arguments["greetingType"] as int?;
  ApiClient api = new ApiClient();

  bool isCaptionToolBarVisible = true;
  bool isMessageToolBarVisible = true;
  bool isSenderToolBarVisible = true;
  List<Result> fontList = [];
  String? selectedCaptionFont;
  String? selectedMessageFont;
  String? selectedSenderFont;
  List<Result>? languages;
  String? selectedLanguage;
  String? initalFont;
  Color editorColor = Colors.white;
  @override
  void initState() {
    setState(() {
      editorColor = fromHex(backgroundColor ?? '');
    });

    // captionContent = "<div style='background-color:" +
    //     (backgroundColor ?? '') +
    //     ";'>" +
    //     (captionContent ?? '') +
    //     "</div>";

    // messageContent = "<div style='background-color:" +
    //     (backgroundColor ?? '') +
    //     ";'>" +
    //     (messageContent ?? '') +
    //     "</div>";

    // senderContent = "<div style='background-color:" +
    //     (backgroundColor ?? '') +
    //     ";'>" +
    //     (senderContent ?? '') +
    //     "</div>";
    // captionContent =GlobalVariables.tempCaptionContent;
    // senderContent =GlobalVariables.tempMessageContent;
    // messageContent =GlobalVariables.tempSenderContent;
    currentIndex = initialIndex ?? 0;

    getFontList();
    getLanguages();
    super.initState();
  }

  bool checkIsLight(Color background) {
    return (background.computeLuminance() > 0.179) ? false : true;
  }

  getFontList() async {
    try {
      CommonDropdownResp resp = await api.getFontList(queryParams: {});
      if ((resp.isSuccess ?? false)) {
        setState(() {
          fontList = resp.result ?? [];
          if (fontList.isNotEmpty) {
            // selectedCaptionFont =
            //     selectedMessageFont = selectedSenderFont = fontList.first.text;
            initalFont = fontList.first.value;
            _captioncontroller.execCommand('fontName', argument: initalFont);
            _messagecontroller.execCommand('fontName', argument: initalFont);
            _sendercontroller.execCommand('fontName', argument: initalFont);
          }
        });
      } else {
        Get.snackbar('Error', resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  getLanguages() async {
    try {
      CommonDropdownResp resp = await api.getLanguages(queryParams: {});
      if (resp.isSuccess ?? false) {
        setState(() {
          languages = resp.result;
          selectedLanguage = languages?.first.value;
          if (selectedLanguage != null && selectedLanguage!.isNotEmpty) {
            getDefaultCaptions();
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

  void getLastTabContent() {
    switch (currentIndex) {
      case 0:
        _captioncontroller.getText().then((value) {
          captionContent = value;
          Navigator.pop(context, {
            "messageContent": messageContent,
            "captionContent": captionContent,
            "senderContent": senderContent
          });
        });
        break;

      case 1:
        _messagecontroller.getText().then((value) {
          messageContent = value;
          Navigator.pop(context, {
            "messageContent": messageContent,
            "captionContent": captionContent,
            "senderContent": senderContent
          });
        });
        break;
      case 2:
        _sendercontroller.getText().then((value) {
          senderContent = value;
          Navigator.pop(context, {
            "messageContent": messageContent,
            "captionContent": captionContent,
            "senderContent": senderContent
          });
        });
        break;
    }
  }

  void getPrviousData() {
    setState(() {
      switch (previousIndex) {
        case 0:
          _captioncontroller.getText().then((value) {
            captionContent = value;
          });
          break;

        case 1:
          _messagecontroller.getText().then((value) {
            messageContent = value;
          });
          break;
        case 2:
          _sendercontroller.getText().then((value) {
            senderContent = value;
          });
          break;
      }
    });
  }

  setCurrentData() {
    setState(() {
      switch (currentIndex) {
        case 0:
          _captioncontroller.setText(captionContent ?? '');
          break;
        case 1:
          _messagecontroller.setText(messageContent ?? '');
          break;
        case 2:
          _sendercontroller.setText(senderContent ?? '');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          _captioncontroller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[50],
          foregroundColor: Color.fromARGB(255, 97, 8, 8),
          title: Text("Edit your HTML"),
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(
                  (currentIndex == 0
                          ? isCaptionToolBarVisible
                          : (currentIndex == 1
                              ? isMessageToolBarVisible
                              : isSenderToolBarVisible))
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                  size: 35,
                ),
                onPressed: () {
                  setState(() {
                    switch (currentIndex) {
                      case 0:
                        isCaptionToolBarVisible = !isCaptionToolBarVisible;
                        break;

                      case 1:
                        isMessageToolBarVisible = !isMessageToolBarVisible;
                        break;

                      case 2:
                        isSenderToolBarVisible = !isSenderToolBarVisible;
                        break;
                    }
                  });
                }),
            IconButton(
                icon: Icon(Icons.done_all),
                onPressed: () async {
                  getLastTabContent();
                })
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color.fromARGB(255, 97, 8, 8),
        //   foregroundColor: Colors.white,
        //   onPressed: () {
        //     switch (currentIndex) {
        //       case 0:
        //         _captioncontroller.toggleCodeView();
        //         break;

        //       case 1:
        //         _messagecontroller.toggleCodeView();
        //         break;

        //       case 2:
        //         _sendercontroller.toggleCodeView();
        //         break;
        //     }
        //   },
        //   child: Text(r'<\>',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        // ),
        body: SafeArea(
          child: DefaultTabController(
            initialIndex: initialIndex ?? 0,
            length: 3,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  onTap: (index) {
                    setState(() {
                      previousIndex = currentIndex;
                      currentIndex = index;
                    });
                    getDefaultCaptions();
                    getPrviousData();
                    setState(() {});
                    setCurrentData();
                    print('Current index' +
                        index.toString() +
                        "-" +
                        previousIndex.toString());
                  },
                  backgroundColor: Color.fromARGB(255, 97, 8, 8),
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.closed_caption),
                      text: "  Caption  ",
                    ),
                    Tab(
                      icon: Icon(Icons.message),
                      text: "  Message  ",
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      text: "  Sender  ",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      HtmlEditor(
                        controller: _captioncontroller,
                        htmlEditorOptions: HtmlEditorOptions(
                          filePath: "assets/summernote.html",
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          initialText: captionContent,
                          // autoAdjustHeight: true
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          textStyle: TextStyle(
                              color: checkIsLight(editorColor)
                                  ? Colors.white
                                  : Colors.black),
                                  dropdownBackgroundColor: editorColor,
                          buttonFillColor: Colors.white,
                          buttonColor: checkIsLight(editorColor)
                              ? Colors.white
                              : Colors.black,
                          defaultToolbarButtons: !isCaptionToolBarVisible
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

                          customToolbarButtons: !isCaptionToolBarVisible
                              ? []
                              : [
                                  Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    height: kMinInteractiveDimension,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.12))),
                                    child: CustomDropdownButtonHideUnderline(
                                      child: CustomDropdownButton<String>(
                                        menuMaxHeight:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        hint: Text(
                                          ('Select Font'.tr),
                                          style: AppStyle
                                              .txtNunitoSansRegular14Gray70001,
                                        ),
                                        menuDirection:
                                            DropdownMenuDirection.up,
                                        items: fontList.map((e) {
                                          return CustomDropdownMenuItem(
                                            value: e.text,
                                            child: Text(e.text ?? '',
                                                style: TextStyle(
                                                    fontFamily: e.value)),
                                          );
                                        }).toList(),
                                        value: selectedCaptionFont,
                                        onChanged: (String? changed) {
                                          if (changed != null) {
                                            var currentfont = fontList
                                                .firstWhere((element) =>
                                                    element.text == changed)
                                                .value;
                                            setState(() {
                                              selectedCaptionFont = changed;
                                              _captioncontroller.execCommand(
                                                  'fontName',
                                                  argument: currentfont);
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                  // add the other widgets here!!
                                ],
                          toolbarPosition:
                              ToolbarPosition.aboveEditor, //by default
                          toolbarType: ToolbarType.nativeGrid, //by default
                          onButtonPressed: (ButtonType type, bool? status,
                              Function? updateStatus) {
                            print(
                                "button '${describeEnum(type)}' pressed, the current selected status is $status");
                            return true;
                          },
                          onDropdownChanged: (DropdownType type,
                              dynamic changed,
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
                            print(file
                                .extension); //file extension (eg jpeg or mp4)
                            return true;
                          },
                        ),
                        otherOptions: OtherOptions(
                            height: 600,
                            decoration: BoxDecoration(color: editorColor)),
                        callbacks: Callbacks(
                            onBeforeCommand: (String? currentHtml) {
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
                          // if (selectedCaptionFont != null) {
                          //   var currentfont = fontList
                          //       .firstWhere((element) =>
                          //           element.text == selectedCaptionFont)
                          //       .value;
                          //   setState(() {
                          //     _captioncontroller.execCommand('fontName',
                          //         argument: currentfont);
                          //   });
                          // }
                          print('editor focused');
                        }, onBlur: () {
                          print('editor unfocused');
                        }, onBlurCodeview: () {
                          print('codeview either focused or unfocused');
                        }, onInit: () {
                          if (selectedCaptionFont != null) {
                            var currentfont = fontList
                                .firstWhere((element) =>
                                    element.text == selectedCaptionFont)
                                .value;
                            setState(() {
                              _captioncontroller.execCommand('fontName',
                                  argument: currentfont);
                            });
                          }
                          print('init');
                        },

                            //this is commented because it overrides the default Summernote handlers
                            /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                            onImageUploadError: (FileUpload? file,
                                String? base64Str, UploadError error) {
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
                              'current character count: ${_captioncontroller.characterCount}');
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
                                var mentions = <String>[
                                  'test1',
                                  'test2',
                                  'test3'
                                ];
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
                      HtmlEditor(
                        controller: _messagecontroller,
                        htmlEditorOptions: HtmlEditorOptions(
                          filePath: "assets/summernote.html",
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          initialText: messageContent,
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          textStyle: TextStyle(
                              color: checkIsLight(editorColor)
                                  ? Colors.white
                                  : Colors.black),
                                  dropdownBackgroundColor: editorColor,
                          buttonFillColor: Colors.white,
                          buttonColor: checkIsLight(editorColor)
                              ? Colors.white
                              : Colors.black,
                          defaultToolbarButtons: !isMessageToolBarVisible
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
                          customToolbarButtons: !isMessageToolBarVisible
                              ? []
                              : [
                                  Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    height: kMinInteractiveDimension,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.12))),
                                    child: CustomDropdownButtonHideUnderline(
                                      child: CustomDropdownButton<String>(
                                        menuMaxHeight:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        hint: Text(
                                          ('Select Font'.tr),
                                          style: AppStyle
                                              .txtNunitoSansRegular14Gray70001,
                                        ),
                                        menuDirection:
                                            DropdownMenuDirection.down,
                                        items: fontList.map((e) {
                                          return CustomDropdownMenuItem(
                                            value: e.text,
                                            child: Text(e.text ?? '',
                                                style: TextStyle(
                                                    fontFamily: e.value)),
                                          );
                                        }).toList(),
                                        value: selectedMessageFont,
                                        onChanged: (String? changed) {
                                          if (changed != null) {
                                            var currentfont = fontList
                                                .firstWhere((element) =>
                                                    element.text == changed)
                                                .value;
                                            setState(() {
                                              selectedMessageFont = changed;
                                              _messagecontroller.execCommand(
                                                  'fontName',
                                                  argument: currentfont);
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                  // add the other widgets here!!
                                ],
                          toolbarPosition:
                              ToolbarPosition.aboveEditor, //by default
                          toolbarType: ToolbarType.nativeGrid, //by default
                          onButtonPressed: (ButtonType type, bool? status,
                              Function? updateStatus) {
                            print(
                                "button '${describeEnum(type)}' pressed, the current selected status is $status");
                            return true;
                          },
                          onDropdownChanged: (DropdownType type,
                              dynamic changed,
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
                            print(file
                                .extension); //file extension (eg jpeg or mp4)
                            return true;
                          },
                        ),
                        otherOptions: OtherOptions(
                            height: 600,
                            decoration: BoxDecoration(color: editorColor)),
                        callbacks: Callbacks(
                            onBeforeCommand: (String? currentHtml) {
                          print('html before change is $currentHtml');
                        }, onChangeContent: (String? changed) {
                          print('content changed to $changed');
                        }, onChangeCodeview: (String? changed) {
                          print('code changed to $changed');
                        }, onChangeSelection: (EditorSettings settings) {
                          print('parent element is ${settings.parentElement}');
                          // print('font name is ${settings.fontName}');
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
                          if (selectedMessageFont != null) {
                            var currentfont = fontList
                                .firstWhere((element) =>
                                    element.text == selectedMessageFont)
                                .value;
                            setState(() {
                              _messagecontroller.execCommand('fontName',
                                  argument: currentfont);
                            });
                          }
                          print('init');
                        },

                            //this is commented because it overrides the default Summernote handlers
                            /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                            onImageUploadError: (FileUpload? file,
                                String? base64Str, UploadError error) {
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
                              'current character count: ${_messagecontroller.characterCount}');
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
                                var mentions = <String>[
                                  'test1',
                                  'test2',
                                  'test3'
                                ];
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
                      HtmlEditor(
                        controller: _sendercontroller,
                        htmlEditorOptions: HtmlEditorOptions(
                          filePath: "assets/summernote.html",
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          initialText: senderContent,
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          textStyle: TextStyle(
                              color: checkIsLight(editorColor)
                                  ? Colors.white
                                  : Colors.black),
                                  dropdownBackgroundColor: editorColor,
                          buttonFillColor: Colors.white,
                          buttonColor: checkIsLight(editorColor)
                              ? Colors.white
                              : Colors.black,
                          defaultToolbarButtons: !isSenderToolBarVisible
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
                          customToolbarButtons: !isSenderToolBarVisible
                              ? []
                              : [
                                  Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    height: kMinInteractiveDimension,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.12))),
                                    child: CustomDropdownButtonHideUnderline(
                                      child: CustomDropdownButton<String>(
                                        menuMaxHeight:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        hint: Text(
                                          ('Select Font'.tr),
                                          style: AppStyle
                                              .txtNunitoSansRegular14Gray70001,
                                        ),
                                        menuDirection:
                                            DropdownMenuDirection.down,
                                        items: fontList.map((e) {
                                          return CustomDropdownMenuItem(
                                            value: e.text,
                                            child: Text(e.text ?? '',
                                                style: TextStyle(
                                                    fontFamily: e.value)),
                                          );
                                        }).toList(),
                                        value: selectedSenderFont,
                                        onChanged: (String? changed) {
                                          if (changed != null) {
                                            var currentfont = fontList
                                                .firstWhere((element) =>
                                                    element.text == changed)
                                                .value;
                                            setState(() {
                                              selectedSenderFont = changed;
                                              _sendercontroller.execCommand(
                                                  'fontName',
                                                  argument: currentfont);
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                  // add the other widgets here!!
                                ],
                          toolbarPosition:
                              ToolbarPosition.aboveEditor, //by default
                          toolbarType: ToolbarType.nativeGrid, //by default
                          onButtonPressed: (ButtonType type, bool? status,
                              Function? updateStatus) {
                            print(
                                "button '${describeEnum(type)}' pressed, the current selected status is $status");
                            return true;
                          },
                          onDropdownChanged: (DropdownType type,
                              dynamic changed,
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
                            print(file
                                .extension); //file extension (eg jpeg or mp4)
                            return true;
                          },
                        ),
                        otherOptions: OtherOptions(
                            height: 600,
                            decoration: BoxDecoration(color: editorColor)),
                        callbacks: Callbacks(
                            onBeforeCommand: (String? currentHtml) {
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
                          // if (selectedSenderFont != null) {
                          //   var currentfont = fontList
                          //       .firstWhere((element) =>
                          //           element.text == selectedSenderFont)
                          //       .value;
                          //   setState(() {
                          //     _sendercontroller.execCommand('fontName',
                          //         argument: currentfont);
                          //   });
                          // }
                          print('editor focused');
                        }, onBlur: () {
                          print('editor unfocused');
                        }, onBlurCodeview: () {
                          print('codeview either focused or unfocused');
                        }, onInit: () {
                          if (selectedSenderFont != null) {
                            var currentfont = fontList
                                .firstWhere((element) =>
                                    element.text == selectedSenderFont)
                                .value;
                            setState(() {
                              _sendercontroller.execCommand('fontName',
                                  argument: currentfont);
                            });
                          }
                          print('init');
                        },

                            //this is commented because it overrides the default Summernote handlers
                            /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                            onImageUploadError: (FileUpload? file,
                                String? base64Str, UploadError error) {
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
                              'current character count: ${_sendercontroller.characterCount}');
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
                                var mentions = <String>[
                                  'test1',
                                  'test2',
                                  'test3'
                                ];
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                          child: CustomButton(
                            height: 40,
                            width: 40,
                            // text: logoPositionName,
                            prefixWidget: Icon(
                              Icons.edit_note_outlined,
                              color: ColorConstant.pink900,
                            ),
                            // margin: getMargin(top: 22),
                            variant: ButtonVariant.OutlineBlack9003f_1,
                            shape: ButtonShape.RoundedBorder15,
                            fontStyle: ButtonFontStyle.NunitoSansBold14,
                            onTap: () {
                              showCaptionSelection(context);
                            },
                          ),
                          visible: (currentIndex == 0 || currentIndex == 1)),

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
                          switch (currentIndex) {
                            case 0:
                              _captioncontroller.undo();
                              break;

                            case 1:
                              _messagecontroller.undo();
                              break;

                            case 2:
                              _sendercontroller.undo();
                              break;
                          }
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
                          switch (currentIndex) {
                            case 0:
                              _captioncontroller.redo();
                              break;

                            case 1:
                              _messagecontroller.redo();
                              break;

                            case 2:
                              _sendercontroller.redo();
                              break;
                          }
                        },
                      ),

                      // SizedBox(
                      //   width: 16,
                      // ),
                      // TextButton(
                      //   style: TextButton.styleFrom(
                      //     backgroundColor: Colors.deepOrange[50],
                      //   ),
                      //   onPressed: () {
                      //     switch (currentIndex) {
                      //       case 0:
                      //         _captioncontroller.clear();
                      //         break;

                      //       case 1:
                      //         _messagecontroller.clear();
                      //         break;

                      //       case 2:
                      //         _sendercontroller.clear();
                      //         break;
                      //     }
                      //   },
                      //   child: Icon(
                      //     Icons.refresh,
                      //     color: Color.fromARGB(255, 97, 8, 8),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // Container(margin: getMargin(bottom: 75)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showCaptionSelection(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: AppStyle.txtNunitoSansBold14Pink900,
      ),
      onPressed: () {},
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setPopupState) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose the " + (currentIndex == 1 ? "message" : "caption"),
                  style: AppStyle.txtNunitoSansBold16Pink900,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ],
            ),
            content: SingleChildScrollView(
                child: Container(
              height: 700,
              width: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Language',
                        style: AppStyle.txtNunitoSansBold12),
                    DropdownButtonFormField<String>(
                      // Initial Value
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      value: selectedLanguage,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: languages?.map((items) {
                        return DropdownMenuItem(
                          value: items.value,
                          child: Text(
                            items.text ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) async {
                        setPopupState(() {
                          selectedLanguage = newValue!;
                        });
                        await getDefaultCaptions();
                        setPopupState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _searchController,
                        onChanged: ((value) {
                          setPopupState(() {
                            var newgreetingTypes = allDefaultCaptions!
                                .where((element) => element.details!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                            defaultCaptions = newgreetingTypes;
                          });
                        }),
                        decoration: InputDecoration(
                          labelText: "lbl_search_details".tr,
                          labelStyle: AppStyle.txtNunitoSansRegular12.copyWith(
                              height: getVerticalSize(1.10), fontSize: 13),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 183, 183, 183),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setPopupState(() {
                                  defaultCaptions = allDefaultCaptions;
                                  _searchController.text = "";
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                                color: ColorConstant.pink900,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 183, 183, 183),
                              )),
                          // filled: true,
                          contentPadding: EdgeInsets.all(15.0),
                        )),
                    Container(
                        height: getVerticalSize(1.00),
                        width: getHorizontalSize(326.00),
                        margin: getMargin(left: 2, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(
                                getHorizontalSize(1.00)))),
                    Container(
                      padding: getPadding(bottom: 10),
                      height: 450.0, // Change as per your requirement
                      width: 300.0, // Change as per your requirement
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: defaultCaptions!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              child: Card(
                                elevation: 5,
                                child:
                                    //  Row(children: [
                                    ListTile(
                                  leading: Icon(Icons.copy),
                                  title: Text(
                                    defaultCaptions![index].details ?? "",
                                    style: AppStyle.txtOdibeeSansRegular14,
                                  ),
                                ),
                                // Icon(Icons.done),
                                // ])
                              ),
                              onTap: () {
                                // _captioncontroller.getText().then((value) {
                                // _captioncontroller.setText(value +
                                //     "" +
                                //     (defaultCaptions![index].details ?? ""));

                                Clipboard.setData(ClipboardData(
                                    text: (defaultCaptions![index].details ??
                                        "")));
                                Get.snackbar(
                                    'Success',
                                    ((currentIndex == 0
                                            ? "Caption"
                                            : "Message") +
                                        " copied to clipboard!"),
                                    backgroundColor:
                                        Color.fromARGB(255, 208, 245, 216),
                                    colorText: Colors.green[900],
                                    icon: Icon(
                                      Icons.done,
                                      color: Colors.green[900],
                                    ));
                                // Fluttertoast.showToast(
                                //   msg: (currentIndex == 0
                                //           ? "Caption"
                                //           : "Message") +
                                //       " copied to clipboard!",
                                //   toastLength: Toast.LENGTH_LONG ,
                                //   gravity: ToastGravity.TOP,
                                //   timeInSecForIosWeb: 1,
                                //   backgroundColor: Colors.red,
                                //   textColor: Colors.white,
                                //   fontSize: 16.0);

                                Navigator.pop(context);
                                // });
                              });
                        },
                      ),
                    )
                  ]),
            )),
            // actions: [
            //   cancelButton
            //   // continueButton,
            // ],
          );
        });
      },
    );
  }

  goToMainPage() {}

  getDefaultCaptions() async {
    try {
      if (currentIndex == 0 || currentIndex == 1) {
        var req = {
          "TypeId": currentIndex == 0 ? "1" : "2",
          "GreetingType": greetingTypeID.toString(),
          "LanguageId": selectedLanguage ?? "",
          "Anywhere": ""
        };
        CaptionMessageResult resp =
            await api.getDefaultCaptionMessage(queryParams: req);
        if (resp.isSuccess ?? false) {
          setState(() {
            allDefaultCaptions = defaultCaptions = resp.result;
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
      }
    } catch (e) {}
  }
}
