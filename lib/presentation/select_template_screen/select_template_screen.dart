import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../core/utils/progress_dialog_utils.dart';
import '../../data/apiClient/api_client.dart';
import '../../data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import '../../data/models/previewGreetingTemplate/post_preview_greeting_template_resp.dart';

class SelectTemplateScreen extends StatefulWidget {
  const SelectTemplateScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectTemplateScreen createState() => _SelectTemplateScreen();
}

class _SelectTemplateScreen extends State<SelectTemplateScreen> {
  PreviewResult? previewResult;
  List<Result>? templates;
  bool isUserDefinedBackground= false;
  var htmlContent = '''
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color:#ffffff;">

<div style="margin-top:50px;">
<center>

  <img src='data:image/png;base64,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'/>
<h2 style="margin-top:10px;">Temaplate Preview</h2>
<div class="card" style="box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
  border-radius: 5px;">
  <div class="container" style=" padding: 2px 16px;">
    <h4><b>Selected template will be previewed here.</b></h4> 
    <p>Please select the template that you want to preview....</p> 
  </div>
</div>

  </center>
  </div>
</body>
</html> 

  ''';

  ApiClient api = new ApiClient();
  var greetingType = Get.arguments["type"] as int;
  var isGreeting = Get.arguments["isGreeting"] as bool;
  String? selectedTemplate;
  @override
  void initState() {
    if (isGreeting) getGreetingTemplates();
    super.initState();
  }

  void getTemplate(String templateID) async {
    try {
      var req = {
        "TemplateID": templateID.toString(),
      };
      PostPreviewGreetingTemplateResp resp =
          await api.previewGreetingTemplate(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          previewResult = resp.result;
          setState(() {
            htmlContent = previewResult?.htmldata ?? '';
isUserDefinedBackground=previewResult?.userPicture??false;
          });
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

  void getGreetingTemplates() async {
    try {
      var req = {
        "GreetingType": greetingType.toString(),
        "LanguageId": GlobalVariables.currentLanguage,
      };
      GetFilterGreetingTemplateResp resp =
          await api.fetchFilterGreetingTemplate(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          templates = resp.result;
          selectedTemplate = templates?.first.value;
        });
        if (selectedTemplate != null && selectedTemplate!.isNotEmpty)
          getTemplate(selectedTemplate ?? '');
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
                              left: 40, top: 44, right: 112, bottom: 6),
                          child: Row(children: [
                            AppbarIconbutton(
                                svgPath: ImageConstant.imgArrowleft,
                                margin: getMargin(bottom: 5),
                                onTap: onTapArrowleft),
                            AppbarSubtitle(
                                text: "lbl_template_view".tr,
                                margin: getMargin(left: 25, top: 5))
                          ]))
                    ])),
                actions: [
                  // Container(
                  //     height: getVerticalSize(46.00),
                  //     width: getHorizontalSize(86.00),
                  //     margin:
                  //         getMargin(left: 286, top: 44, right: 3, bottom: 18),
                  //     child: Stack(alignment: Alignment.topRight, children: [
                  //       AppbarStack(margin: getMargin(right: 29)),
                  //       AppbarImage(
                  //           height: getVerticalSize(35.00),
                  //           width: getHorizontalSize(43.00),
                  //           svgPath: ImageConstant.imgOverflowmenu,
                  //           margin: getMargin(left: 43, top: 3, bottom: 8))
                  //     ]))
                ],
                styleType: Style.bgStyle),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 19, top: 28, right: 19, bottom: 5),
                        child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Select Template',
                              ),
                              DropdownButton<String>(
                                // Initial Value
                                value: selectedTemplate,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: templates?.map((items) {
                                  return DropdownMenuItem(
                                    value: items.value,
                                    child: Text(
                                      items.text ?? '',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedTemplate = newValue!;
                                  });
                                  getTemplate(newValue ?? "");
                                },
                              ),
                              // DropDown(
                              //     width: 257,
                              //     focusNode: FocusNode(),
                              //     icon: Container(
                              //         margin: getMargin(left: 30, right: 9),
                              //         child: CustomImageView(
                              //             svgPath: ImageConstant
                              //                 .imgArrowdownPink900)),
                              //     hintText: "lbl_select".tr,
                              //     margin: getMargin(right: 30),
                              //     variant: DropDownVariant.OutlineBlack900,
                              //     fontStyle: DropDownFontStyle.NunitoSansBold16,
                              //     items: templates?.map((e) => new SelectionPopupModel(title: e.text??'',id: int.parse(e.value??'0'),value: e.value)).toList(),
                              //     onChanged: (value) {}),

                              Container(
                                  height: getVerticalSize(529.00),
                                  width: getHorizontalSize(335.00),
                                  margin: getMargin(top: 17),
                                  child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                height: getVerticalSize(478.00),
                                                width:
                                                    getHorizontalSize(296.00),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .whiteA700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                10.00))))),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgClock,
                                            height: getVerticalSize(46.00),
                                            width: getHorizontalSize(42.00),
                                            alignment: Alignment.topRight),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgMinimize,
                                            height: getVerticalSize(39.00),
                                            width: getHorizontalSize(41.00),
                                            alignment: Alignment.bottomLeft),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                padding: getPadding(
                                                    top: 5,
                                                    left: 5,
                                                    bottom: 5,
                                                    right: 5),
                                                child: HtmlWidget(
                                                  htmlContent,
                                                  customStylesBuilder:
                                                      (element) {
                                                    if (element.classes
                                                        .contains('foo')) {
                                                      return {'color': 'red'};
                                                    }

                                                    return null;
                                                  },

                                                  // render a custom widget
                                                  customWidgetBuilder:
                                                      (element) {},

                                                  // these callbacks are called when a complicated element is loading
                                                  // or failed to render allowing the app to render progress indicator
                                                  // and fallback widget
                                                  onErrorBuilder: (context,
                                                          element, error) =>
                                                      Text(
                                                          '$element error: $error'),
                                                  onLoadingBuilder: (context,
                                                          element,
                                                          loadingProgress) =>
                                                      CircularProgressIndicator(),

                                                  // this callback will be triggered when user taps a link
                                                  // onTapUrl: (url) => print('tapped $url'),

                                                  // select the render mode for HTML body
                                                  // by default, a simple `Column` is rendered
                                                  // consider using `ListView` or `SliverList` for better performance
                                                  renderMode: RenderMode.column,

                                                  // set the default styling for text
                                                  textStyle:
                                                      TextStyle(fontSize: 14),

                                                  // turn on `webView` if you need IFRAME support (it's disabled by default)
                                                  // webView: true,
                                                ),
                                                height: getVerticalSize(456.00),
                                                width:
                                                    getHorizontalSize(273.00),
                                                decoration: BoxDecoration(
                                                    //  color: Colors.white,
                                                    border: Border.all(
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        width:
                                                            getHorizontalSize(
                                                                2.00)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: ColorConstant
                                                              .black9003f,
                                                          spreadRadius:
                                                              getHorizontalSize(
                                                                  2.00),
                                                          blurRadius:
                                                              getHorizontalSize(
                                                                  2.00),
                                                          offset: Offset(0, 4))
                                                    ])))
                                      ])),
                              CustomButton(
                                  height: 40,
                                  width: 250,
                                  text: "lbl_select".tr,
                                  margin: getMargin(top: 13),
                                  fontStyle: ButtonFontStyle.NunitoSansBlack16,
                                  onTap: onTapSelect,
                                  alignment: Alignment.center)
                            ]))))));
  }

  onTapSelect() {
    Get.back(result: {
      "selectedTemplateID": selectedTemplate,
      "selectedTemplateName": templates!
          .firstWhere((element) => element.value == selectedTemplate)
          .text,
          
      "isUserBackground": isUserDefinedBackground
    });
  }

  onTapArrowleft() {
    Get.back();
  }
}
