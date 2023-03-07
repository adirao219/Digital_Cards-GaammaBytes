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
  final HtmlEditorController controller = HtmlEditorController();
  // String htmlContent="";
  String htmlContent = "";

  @override
  void initState() {
    controller.setText(htmlContent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
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
                  // if (kIsWeb) {
                  //   controller.reloadWeb();
                  // } else {
                  //   controller.editorController!.reload();
                  // }

                  Navigator.pop(context);
                  var txt = await controller.getText();
                  htmlContent = txt;
                  if (txt.contains('src=\"data:')) {
                    txt =
                        '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                  }
                  setState(() {
                    result = txt;
                  });

                  Navigator.pop(context, {"htmlContent": htmlContent});
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 97, 8, 8),
          foregroundColor: Colors.white,
          onPressed: () {
            controller.toggleCodeView();
          },
          child: Text(r'<\>',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your text here...',
                  shouldEnsureVisible: true,

                  //initialText: "<p>text content initial, if any</p>",
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.aboveEditor, //by default
                  toolbarType: ToolbarType.nativeScrollable, //by default
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
                otherOptions: OtherOptions(height: 550),
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
                    onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
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
                      'current character count: ${controller.characterCount}');
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
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50],
                      ),
                      onPressed: () {
                        controller.undo();
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
                        controller.redo();
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
                        controller.clear();
                      },
                      child: Icon(
                        Icons.refresh,
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
                          controller.disable();
                        },
                        child: Icon(
                          Icons.disabled_by_default,
                          color: Color.fromARGB(255, 97, 8, 8),
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange[50],
                        ),
                        onPressed: () async {
                          controller.enable();
                        },
                        child: Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 97, 8, 8),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50],
                      ),
                      onPressed: () {
                        controller.insertText('Google');
                      },
                      child: Text('Insert Text',
                          style:
                              TextStyle(color: Color.fromARGB(255, 97, 8, 8))),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50],
                      ),
                      onPressed: () {
                        controller.insertHtml(
                            '''<p style="color: blue">Google in blue</p>''');
                      },
                      child: Text('Insert HTML',
                          style:
                              TextStyle(color: Color.fromARGB(255, 97, 8, 8))),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange[50]),
                      onPressed: () async {
                        controller.insertLink(
                            'Google linked', 'https://google.com', true);
                      },
                      child: Icon(
                        Icons.link,
                        color: Color.fromARGB(255, 97, 8, 8),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange[50]),
                      onPressed: () {
                        controller.insertNetworkImage(
                            'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png',
                            filename: 'Google network image');
                      },
                      child: Icon(
                        Icons.image,
                        color: Color.fromARGB(255, 97, 8, 8),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToMainPage() {}
}
