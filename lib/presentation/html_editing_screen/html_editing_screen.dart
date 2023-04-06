import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

class HtmlEditorScreen extends StatefulWidget {
  HtmlEditorScreen({Key? key}) : super(key: key);

  @override
  _HtmlEditorScreenState createState() => _HtmlEditorScreenState();
}

class _HtmlEditorScreenState extends State<HtmlEditorScreen> {
  String result = '';

  int currentIndex = 0;
  int previousIndex = 0;
  final HtmlEditorController _captioncontroller = HtmlEditorController();
  final HtmlEditorController _messagecontroller = HtmlEditorController();
  final HtmlEditorController _sendercontroller = HtmlEditorController();
  // String htmlContent="";
  var initialIndex = Get.arguments["initialIndex"] as int?;
  var captionContent = Get.arguments["captionContent"] as String?;
  var messageContent = Get.arguments["messageContent"] as String?;
  var senderContent = Get.arguments["senderContent"] as String?;

  @override
  void initState() {
    // captionContent =GlobalVariables.tempCaptionContent;
    // senderContent =GlobalVariables.tempMessageContent;
    // messageContent =GlobalVariables.tempSenderContent;
currentIndex = initialIndex??0;
    super.initState();
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
                icon: Icon(Icons.done_all),
                onPressed: () async {
                  getLastTabContent();
                  // if (kIsWeb) {
                  //   controller.reloadWeb();
                  // } else {
                  //   controller.editorController!.reload();
                  // }

                  // Navigator.pop(context);

                  // var txt = "";
                  // var txt2 = "";
                  // var txt3 = "";
                  // switch (currentIndex) {
                  //   case 0:
                  //     txt = await _captioncontroller.getText();
                  //     break;

                  //   case 1:
                  //     txt2 = await _messagecontroller.getText();
                  //     break;

                  //   case 2:
                  //     txt3 = await _sendercontroller.getText();
                  //     break;
                  // }
                  // messageContent = txt;
                  // if (txt.contains('src=\"data:')) {
                  //   txt =
                  //       '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                  // } if (txt2.contains('src=\"data:')) {
                  //   txt2 =
                  //       '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                  // }
                  //  if (txt.contains('src=\"data:')) {
                  //   txt =
                  //       '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                  // }
                  // setState(() {
                  //   result = txt;
                  // });
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 97, 8, 8),
          foregroundColor: Colors.white,
          onPressed: () {
            switch (currentIndex) {
              case 0:
                _captioncontroller.toggleCodeView();
                break;

              case 1:
                _messagecontroller.toggleCodeView();
                break;

              case 2:
                _sendercontroller.toggleCodeView();
                break;
            }
          },
          child: Text(r'<\>',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
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
                    children: <Widget>[
                      HtmlEditor(
                        controller: _captioncontroller,
                        htmlEditorOptions: HtmlEditorOptions(
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          initialText: captionContent,
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          toolbarPosition:
                              ToolbarPosition.belowEditor, //by default
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
                        otherOptions: OtherOptions(height: 600),
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
                          print('editor focused');
                        }, onBlur: () {
                          print('editor unfocused');
                        }, onBlurCodeview: () {
                          print('codeview either focused or unfocused');
                        }, onInit: () {
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
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          initialText: messageContent,
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          toolbarPosition:
                              ToolbarPosition.belowEditor, //by default
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
                        otherOptions: OtherOptions(height: 600),
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
                          print('editor focused');
                        }, onBlur: () {
                          print('editor unfocused');
                        }, onBlurCodeview: () {
                          print('codeview either focused or unfocused');
                        }, onInit: () {
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
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          initialText: senderContent,
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          toolbarPosition:
                              ToolbarPosition.belowEditor, //by default
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
                        otherOptions: OtherOptions(height: 600),
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
                          print('editor focused');
                        }, onBlur: () {
                          print('editor unfocused');
                        }, onBlurCodeview: () {
                          print('codeview either focused or unfocused');
                        }, onInit: () {
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
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange[50],
                        ),
                        onPressed: () {
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
                        child: Icon(
                          Icons.undo,
                          color: Color.fromARGB(255, 97, 8, 8),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange[50],
                        ),
                        onPressed: () {
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
                        child: Icon(
                          Icons.redo,
                          color: Color.fromARGB(255, 97, 8, 8),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange[50],
                        ),
                        onPressed: () {
                          switch (currentIndex) {
                            case 0:
                              _captioncontroller.clear();
                              break;

                            case 1:
                              _messagecontroller.clear();
                              break;

                            case 2:
                              _sendercontroller.clear();
                              break;
                          }
                        },
                        child: Icon(
                          Icons.refresh,
                          color: Color.fromARGB(255, 97, 8, 8),
                        ),
                      ),
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

  goToMainPage() {}
}
