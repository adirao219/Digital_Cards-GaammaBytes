import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../core/utils/progress_dialog_utils.dart';

class SelectTemplateScreen extends StatefulWidget {
  const SelectTemplateScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectTemplateScreen createState() => _SelectTemplateScreen();
}

class _SelectTemplateScreen extends State<SelectTemplateScreen> {
  var htmlContent = '''
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color:#ffffff;">

<h2>Round Card</h2>

<div class="card" style="box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
  border-radius: 5px;">
  <img src="https://www.w3schools.com/howto/img_avatar2.png" style="border-radius: 5px 5px 0 0;" alt="Avatar" style="width:100%">
  <div class="container" style=" padding: 2px 16px;">
    <h4><b>Jane Doe</b></h4> 
    <p>Interior Designer</p> 
  </div>
</div>

</body>
</html> 

  ''';
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomDropDown(
                                  width: 257,
                                  focusNode: FocusNode(),
                                  icon: Container(
                                      margin: getMargin(left: 30, right: 9),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowdownPink900)),
                                  hintText: "lbl_select".tr,
                                  margin: getMargin(right: 30),
                                  variant: DropDownVariant.OutlineBlack900,
                                  fontStyle: DropDownFontStyle.NunitoSansBold16,
                                  items: [],
                                  onChanged: (value) {}),
                              Container(
                                  width: getHorizontalSize(257.00),
                                  margin: getMargin(top: 1, right: 30),
                                  padding: getPadding(top: 4, bottom: 4),
                                  decoration: AppDecoration.outlineBlack9003f1
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL15),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(257.00),
                                            padding:
                                                getPadding(left: 10, right: 10),
                                            decoration: AppDecoration
                                                .fillDeeporange100
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Text(
                                                          "msg_sample_template"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtNunitoSansBold16Pink900
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.36))))
                                                ])),
                                        Padding(
                                            padding: getPadding(left: 10),
                                            child: Text(
                                                "msg_sample_template2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansBold16Pink900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36)))),
                                        Padding(
                                            padding: getPadding(
                                                left: 10, top: 1, bottom: 1),
                                            child: Text(
                                                "msg_sample_template3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNunitoSansBold16Pink900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.36))))
                                      ])),
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
                                                        .deepOrangeA100A3,
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
                                              padding: getPadding(top: 5,left: 5,bottom: 5,right: 5),
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
                                                    ])
                                                    
                                                    ))
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
    
    Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen);
  }

  onTapArrowleft() {
    Get.back();
  }
}
