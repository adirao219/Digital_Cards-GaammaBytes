
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_iconbutton.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcards_gaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CardPreviewScreen extends StatefulWidget {
  const CardPreviewScreen({ super.key});

                @override
                // ignore: library_private_types_in_public_api
                _CardPreviewScreen createState() => _CardPreviewScreen();
            }

class _CardPreviewScreen extends State<CardPreviewScreen> {
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
            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child:MoreOptionMenu()),
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
                              left: 40, top: 35, right: 61, bottom: 6),
                          child: Row(children: [
                            AppbarIconbutton(
                                svgPath: ImageConstant.imgArrowleft,
                                margin: getMargin(top: 9, bottom: 6),
                                onTap: onTapArrowleft4),
                            AppbarSubtitle(
                                text: "lbl_card_preview".tr,
                                margin:
                                    getMargin(left: 15, top: 16, bottom: 11)),
                            AppbarImage(
                                height: getVerticalSize(53.00),
                                width: getHorizontalSize(55.00),
                                svgPath: ImageConstant.imgEye,
                                margin: getMargin(left: 14))
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
                          height: getVerticalSize(529.00),
                          width: getHorizontalSize(335.00),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgMinimize,
                                height: getVerticalSize(39.00),
                                width: getHorizontalSize(41.00),
                                alignment: Alignment.bottomLeft),
                            CustomImageView(
                                svgPath: ImageConstant.imgClock,
                                height: getVerticalSize(46.00),
                                width: getHorizontalSize(42.00),
                                alignment: Alignment.topRight),
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
                          ])),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_ok".tr,
                          margin: getMargin(top: 34, bottom: 5),
                          fontStyle: ButtonFontStyle.NunitoSansBlack16,
                          onTap: onTapOk)
                    ]))));
  }

  onTapOk() {
    Navigator.of(context).pop();
  }

  onTapArrowleft4() {
    Get.back();
  }
}
