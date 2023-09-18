import 'dart:convert';
import 'dart:io';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/progress_dialog_utils.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

// // Import for Android features.
import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// // Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// import 'package:webcontent_converter/webcontent_converter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../../data/apiClient/api_client.dart';
import '../../data/models/getCreateCard/get_get_create_card_resp.dart';
import '../../data/models/previewGreetingCard/post_preview_greeting_card_resp.dart';
import '../../data/models/previewGreetingTemplate/post_preview_greeting_template_resp.dart';

class CardPreviewScreen extends StatefulWidget {
  const CardPreviewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardPreviewScreen createState() => _CardPreviewScreen();
}

class _CardPreviewScreen extends State<CardPreviewScreen> {
  var cardID = Get.arguments["CardID"] as int?;
  var isDigitalCard = (Get.arguments["isDigitalCard"] as bool?) ?? false;

  WidgetsToImageController _controller = WidgetsToImageController();
  var backgroundImageURL = "";
  bool? isBackgroundImage = false;
  var customColor = "";
  var htmlContent =
      '''
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color:#ffffff;">

<div style="margin-top:50px;">
<center>

  <img src='data:image/png;base64,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'/>
<h2 style="margin-top:10px;">Card Preview</h2>
<div class="card" style="box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
  border-radius: 5px;">
  <div class="container" style=" padding: 2px 16px;">
    <h4><b>Your card will be previewed here.</b></h4> 
    <p>Please wait....</p> 
  </div>
</div>

  </center>
  </div>
</body>
</html> 

  ''';

  var newhtml =
      '''

        
<div class="page-wrapper" style="box-shadow: 1px 2px 15px #48484833;position: relative;padding-top: 1px;background: url('https://digitalcard.gaamma.cards/images/AkshayaTritiya_squarecenter.png');background-repeat: no-repeat;background-size: 100%;height: 600px;width: 600px">        <style>.uppergreeting{&nbsp; &nbsp; }p {margin:5px !important;}</style><div class="uppergreeting" style="margin: 15px"><p class="MsoListParagraph" style="margin: 5px;margin-left: 1in;text-indent: -0.25in;text-align: center"><span style="font-size: 24pt; color: rgb(230, 126, 35); font-family: 'comic sans ms', sans-serif;"><strong><span lang="EN-IN" style="line-height: 107%;">&nbsp;</span></strong></span></p><p class="MsoListParagraph" style="margin: 5px;margin-left: 1in;text-indent: -0.25in;text-align: center"><span style="font-size: 24pt; color: rgb(230, 126, 35); font-family: 'comic sans ms', sans-serif;"><strong><span lang="EN-IN" style="line-height: 107%;">&nbsp;</span></strong></span></p><p class="MsoListParagraph" style="margin: 5px;margin-left: 1in;text-indent: -0.25in;text-align: center"><span style="font-size: 24pt; color: rgb(230, 126, 35); font-family: 'comic sans ms', sans-serif;"><strong><span lang="EN-IN" style="line-height: 107%;">&nbsp;</span></strong></span></p><p class="MsoListParagraph" style="margin: 5px;margin-left: 1in;text-indent: -0.25in;text-align: center"><span style="font-size: 24pt; color: rgb(230, 126, 35); font-family: 'comic sans ms', sans-serif;"><strong><span lang="EN-IN" style="line-height: 107%;">&nbsp; &nbsp;Happy Akshaya Tritiya&nbsp;</span></strong></span></p><p class="MsoListParagraph" style="margin: 5px;margin-left: 1in;text-indent: -0.25in;text-align: center"><span style="font-size: 8pt; color: rgb(230, 126, 35); font-family: 'comic sans ms', sans-serif;"><strong><span lang="EN-IN" style="line-height: 107%;">&nbsp;</span></strong></span></p><div class="col-md-12" style="margin-top:12px;"></div><p style="margin: 5px;text-align: center"><span lang="EN-IN" style="font-size: 14pt; line-height: 107%; font-family: 'book antiqua', palatino, serif; color: rgb(14, 84, 47);">May Akshaya Tritiya bring </span></p><p style="margin: 5px;text-align: center"><span lang="EN-IN" style="font-size: 14pt; line-height: 107%; font-family: 'book antiqua', palatino, serif; color: rgb(14, 84, 47);">prosperity, wealth and success in all your endeavours. </span></p><p style="margin: 5px;text-align: center"><span lang="EN-IN" style="font-size: 14pt; line-height: 107%; font-family: 'book antiqua', palatino, serif; color: rgb(14, 84, 47);">Wishing you a happy and blessed Akshaya Tritiya.</span></p><div class="col-md-12" style="margin-top:12px;"></div><p style="margin: 5px;text-align: center"><span style="font-size: 18pt; color: rgb(230, 126, 35); font-family: 'book antiqua', palatino, serif;"><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-Sneha</em></span></p><p style="margin: 5px;text-align: center"><span style="font-size: 18pt; color: rgb(230, 126, 35); font-family: 'book antiqua', palatino, serif;"><em>&nbsp;</em></span></p><p style="margin: 5px;text-align: center"><span style="font-size: 18pt; color: rgb(230, 126, 35); font-family: 'book antiqua', palatino, serif;"><em>&nbsp;</em></span></p><p style="margin: 5px;text-align: center"><span style="font-size: 18pt; color: rgb(230, 126, 35); font-family: 'book antiqua', palatino, serif;"><em>&nbsp;</em></span></p><p style="margin: 5px;text-align: center"><span style="font-size: 18pt; color: rgb(230, 126, 35); font-family: 'book antiqua', palatino, serif;"><em>&nbsp;</em></span></p></div><div style=" text-align: center; padding: 5px; position: absolute;bottom:0;left: 0; right: 0;"><img src="https://digitalcard.gaamma.cards/images/defaultlogo.png"></div>        <!--COPYRIGHT-->    </div>

''';
  // late final WebViewController webViewController;
  ApiClient api = new ApiClient();
  late final WebViewController _webViewcontroller;
  @override
  void initState() {
    ProgressDialogUtils.hideProgressDialog(context);
    // if (isGreeting) getGreetingTemplates();
    getCardOrGreetingPreview();
    super.initState();
  }

  getCardOrGreetingPreview() {
    if (isDigitalCard) {
      getCardPreview();
    } else {
      getGreetingCardPreview();
    }
  }

  void getGreetingCardPreview() async {
    try {
      var req = {"ID": cardID.toString(), "IsDownloadImage": false.toString()};
      PostPreviewGreetingTemplateResp resp =
          await api.createPreviewGreetingCard(context,queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          // htmlContent = resp.result!.htmldata ?? ''; //newhtml
          _webViewcontroller.loadUrl(resp.result!.htmldata ?? '');
          // _webViewcontroller.loadUrl("https://gaamma.cards/happy-birthday/testvijay2.html");
          // _webViewcontroller
          //     .loadUrl("https://gaamma.cards/wedding/weddinginvitation.html");
          // _webViewcontroller.loadUrl("https://gaamma.cards/wedding/haldiceremony.html");
          // _webViewcontroller.loadUrl("https://gaamma.cards/event/upanayanainvitation.html");
          backgroundImageURL = resp.result!.background ?? '';
          isBackgroundImage = resp.result!.isBackgroundImage;
          customColor = (resp.result!.editorColorHex ?? '');
        });
        ProgressDialogUtils.hideProgressDialog(context);
      } else {
        Get.snackbar('Error', resp.errorMessage.toString());

        ProgressDialogUtils.hideProgressDialog(context);
      }
    } catch (e) {
      var s = 1;
      ProgressDialogUtils.hideProgressDialog(context);
    }
  }

  void getCardPreview() async {
    try {
      var req = {"UserId": GlobalVariables.userID, "CardId": cardID.toString()};
      GetGetCreateCardResp resp = await api.previewCard(context,queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          // htmlContent = resp.result!.htmlData ?? ''; //newhtml
          _webViewcontroller.loadUrl(resp.result!.htmlData ?? '');
          backgroundImageURL = resp.result!.picture1 ?? '';
          isBackgroundImage = true; //resp.result!.isBackgroundImage;
          customColor = (resp.result!.backgroundColorHex ?? '');
        });
        ProgressDialogUtils.hideProgressDialog(context);
      } else {
        Get.snackbar('Error', resp.errorMessage.toString());

        ProgressDialogUtils.hideProgressDialog(context);
      }
    } catch (e) {
      var s = 1;
      ProgressDialogUtils.hideProgressDialog(context);
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
                              left: 15, top: 35, right: 61, bottom: 6),
                          child: Row(children: [
                            AppbarIconbutton(
                                svgPath: ImageConstant.imgArrowleft,
                                margin: getMargin(top: 9, bottom: 6),
                                onTap: onTapArrowleft4),
                            AppbarSubtitle(
                                text: isDigitalCard
                                    ? "lbl_card_preview2".tr
                                    : "lbl_card_preview".tr,
                                margin: getMargin(
                                    left:60 ,
                                    top: 16,
                                    bottom: 11)),
                            SizedBox(
                              width: 10,
                            ),
                            // AppbarImage(
                            //     height: getVerticalSize(53.00),
                            //     width: getHorizontalSize(55.00),
                            //     svgPath: ImageConstant.imgEye,
                            //     margin: getMargin(left: 14))
                            Visibility(
                              child: GestureDetector(
                                  child: Icon(
                                    Icons.download,
                                    size: 30,
                                    color: ColorConstant.pink900,
                                  ),
                                  onTap: () {
                                    onTapDownload(isShare: false);
                                  }),
                              visible: false,
                            ),
                            Visibility(
                              child: SizedBox(
                                width: 15,
                              ),
                              visible: !isDigitalCard,
                            ),
                            Visibility(
                              child: GestureDetector(
                                  child: Icon(
                                    Icons.share,
                                    size: 25,
                                    color: ColorConstant.pink900,
                                  ),
                                  onTap: () {
                                    onTapDownload(isShare: true);
                                  }),
                              visible: false,
                            ),
                          ]))
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getVerticalSize(35.00),
                //       width: getHorizontalSize(43.00),
                //       svgPath: ImageConstant.imgOverflowmenu,
                //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
                // ],
                styleType: Style.bgStyle_23),
            body: Container(
                width: size.width,
                padding: getPadding(left: 19, top: 24, right: 19, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(550.00),
                          width: getHorizontalSize(350.00),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Container(
                                height: getVerticalSize(750.00),
                                width: getHorizontalSize(350.00),
                                margin: getMargin(top: 0),
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      WidgetsToImage(
                                        controller: _controller,
                                        child:
                                            //  Align(
                                            //     alignment: Alignment.center,
                                            //     child: SingleChildScrollView(
                                            //         scrollDirection:
                                            //             Axis.vertical,
                                            //         child: Container(
                                            //             padding: getPadding(
                                            //                 top: 5,
                                            //                 left: 5,
                                            //                 bottom: 5,
                                            //                 right: 5),
                                            //             child:
                                            WebView(
                                          navigationDelegate:
                                              (NavigationRequest request) {
                                            if (!isDigitalCard) {
                                              var content = request.url
                                                  .replaceAll(
                                                      "data:image/png;base64,",
                                                      "");

                                              onTapDownloadFromWebView(content);
                                            }
                                            return NavigationDecision.prevent;
                                          },
                                          javascriptMode:
                                              JavascriptMode.unrestricted,
                                          onWebViewCreated: (controller) {
                                            // We are getting an instance of the controller in the callback
                                            // So we take it assign it our late variable value
                                            _webViewcontroller = controller;

                                            setState(() {});
                                          },
                                        ),
                                        // HtmlWidget(
                                        //   htmlContent,
                                        //   customStylesBuilder:
                                        //       (element) {
                                        //     if (element.classes
                                        //         .contains(
                                        //             'foo')) {
                                        //       return {
                                        //         'color': 'red'
                                        //       };
                                        //     }

                                        //     return null;
                                        //   },

                                        //   // render a custom widget
                                        //   customWidgetBuilder:
                                        //       (element) {},

                                        //   // these callbacks are called when a complicated element is loading
                                        //   // or failed to render allowing the app to render progress indicator
                                        //   // and fallback widget
                                        //   onErrorBuilder: (context,
                                        //           element,
                                        //           error) =>
                                        //       Text(
                                        //           '$element error: $error'),
                                        //   onLoadingBuilder: (context,
                                        //           element,
                                        //           loadingProgress) =>
                                        //       CircularProgressIndicator(),

                                        //   // this callback will be triggered when user taps a link
                                        //   // onTapUrl: (url) => print('tapped $url'),

                                        //   // select the render mode for HTML body
                                        //   // by default, a simple `Column` is rendered
                                        //   // consider using `ListView` or `SliverList` for better performance
                                        //   renderMode:
                                        //       RenderMode.column,

                                        //   // set the default styling for text
                                        //   textStyle: TextStyle(
                                        //       fontSize: 14),

                                        //   // turn on `webView` if you need IFRAME support (it's disabled by default)
                                        //   // webView: true,
                                        // ),
                                        // height: getVerticalSize(
                                        //     900.00),
                                        // width: getHorizontalSize(
                                        //     400.00),
                                        // decoration: BoxDecoration(
                                        //     image:
                                        //         DecorationImage(
                                        //       image: NetworkImage(
                                        //           (isBackgroundImage ??
                                        //                   false)
                                        //               ? backgroundImageURL
                                        //               : ""),
                                        //       fit: BoxFit.fill,
                                        //     ),
                                        //     //  color: Colors.white,
                                        //     border: Border.all(
                                        //         color:
                                        //             ColorConstant
                                        //                 .whiteA700,
                                        //         width:
                                        //             getHorizontalSize(
                                        //                 2.00)),
                                        //     boxShadow: [
                                        //       BoxShadow(
                                        //           color: ColorConstant
                                        //               .black9003f,
                                        //           spreadRadius:
                                        //               getHorizontalSize(
                                        //                   2.00),
                                        //           blurRadius:
                                        //               getHorizontalSize(
                                        //                   2.00),
                                        //           offset: Offset(
                                        //               0, 4))
                                        //     ]))))
                                      ),
                                    ])),
                          ])),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          child: Container(
                              child: Text(
                            "Note: Few icons will work only after publishing card",
                            style: AppStyle.txtNunitoSansBold12,
                          )),
                          visible: isDigitalCard),
                    ]))));
  }

  onTapOk() {
    Navigator.of(context).pop();
  }

  onTapDownload({bool isShare = false}) async {
    ProgressDialogUtils.showProgressDialog(context);

    // var bytes = await WebcontentConverter.contentToImage(content: htmlContent,);
    var bytes = await _controller.capture() ?? new Uint8List(0);
    if (bytes.length > 0) {
      _saveFile(bytes, isShare);
    }
  }

  onTapDownloadFromWebView(String content) async {
    var isShare = await _webViewcontroller
        .runJavascriptReturningResult('\$("#ShareImage").val()');

    var bytes = base64.decode(content);
    if (bytes.length > 0) {
      _saveFile(bytes, (isShare == '"true"'));
    }
  }

  _saveFile(Uint8List bytes, bool isShare) async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyyMMdd-hhmmss').format(now);

      var filename = (isDigitalCard ? "digitalcard_" : "greeting_") +
          formattedDate +
          ".jpg";
      try {
        filename = await _webViewcontroller
            .runJavascriptReturningResult('\$("#ImageName").val()');
      } catch (e) {
        var s = 1;
      }
      if (isShare) {
        // ProgressDialogUtils.showSmallProgressDialog(context);
        var file = await writeToFile(bytes);
        await Share.shareFiles([file.path], text: '', subject: '');
      } else {
        ProgressDialogUtils.showSmallProgressDialog(context);
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(bytes),
            quality: 100,
            name: filename);

        if (result['isSuccess'] == true) {
          ProgressDialogUtils.hideProgressDialog(context);
          Get.snackbar("Success",
              "Image downloaded successfully. Please check your gallery",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));
        } else {
          ProgressDialogUtils.hideProgressDialog(context);
        }
      }
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog(context);
    }
  }

  Future<File> writeToFile(Uint8List data) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMdd-hhmmss').format(now);
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath +
        '/existingFile' +
        formattedDate +
        '.png'; // file_01.tmp is dump file, can be anything
    File(filePath).writeAsBytesSync(data);
    return File(filePath);
  }

  onTapArrowleft4() {
    Navigator.of(context).pop();
  }
}
