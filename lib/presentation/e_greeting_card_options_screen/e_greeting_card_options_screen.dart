import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../data/models/getGreetingType/get_get_greeting_type_resp.dart';

class EGreetingCardOptionsScreen extends StatefulWidget {
  const EGreetingCardOptionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EGreetingCardOptionsScreen createState() => _EGreetingCardOptionsScreen();
}

class _EGreetingCardOptionsScreen extends State<EGreetingCardOptionsScreen> {
  ApiClient api = new ApiClient();
  List<Result> greetingTypes = [];

  Random random = new Random();
  @override
  void initState() {
    getGreetingTypes();
    super.initState();
  }

  getGreetingTypes() async {
    try {
      GetGetGreetingTypeResp resp = await api.fetchGetGreetingType();
      if ((resp.isSuccess ?? false)) {
        setState(() {
          greetingTypes.addAll(resp.result!.toList());
        });
      } else {
        Get.snackbar('Error', resp.errorMessage.toString());
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
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
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Stack(children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100),
                      Container(
                          height: getVerticalSize(36.00),
                          width: getHorizontalSize(38.00),
                          margin: getMargin(
                              left: 38, top: 44, right: 299, bottom: 14),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            AppbarImage(
                                height: getVerticalSize(36.00),
                                width: getHorizontalSize(38.00),
                                svgPath: ImageConstant.imgContrast,
                                onTap: onTapContrast5),
                            AppbarImage(
                                height: getVerticalSize(10.00),
                                width: getHorizontalSize(5.00),
                                svgPath: ImageConstant.imgVectorstroke,
                                margin: getMargin(
                                    left: 15, top: 13, right: 18, bottom: 13))
                          ]))
                    ])),
              ),
              // actions: [
              //   AppbarImage(
              //       height: getVerticalSize(35.00),
              //       width: getHorizontalSize(43.00),
              //       svgPath: ImageConstant.imgOverflowmenu,
              //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
              // ],
              styleType: Style.bgStyle_18),
          body: Container(
            width: size.width,
            padding: getPadding(left: 15, top: 10, right: 15, bottom: 39),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Padding(
                      padding: getPadding(left: 24),
                      child: Text("msg_choose_greeting".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold20)),
                  Column(children: gerAllGreetings(context))

                  // Padding(
                  //     padding: getPadding(top: 0),
                  //     child: GridView(
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount:2,
                  //       ),
                  //       children: [
                  //         Image.network('https://picsum.photos/250?image=1'),
                  //         Image.network('https://picsum.photos/250?image=2'),
                  //         Image.network('https://picsum.photos/250?image=3'),
                  //         Image.network('https://picsum.photos/250?image=4'),
                  //       ],
                  //     )),
                ])),
          ),
        ));
  }

  List<Widget> gerAllGreetings(BuildContext context) {
    List<Widget> allWidgets = [];

    for (int i = 0; i < greetingTypes.length; i++) {
      if (i % 2 == 0) {
        allWidgets.add(Row(
          children: [
            greetingTypeWidget(i, context),
            if ((i + 1) < greetingTypes.length)
              greetingTypeWidget(i + 1, context),
          ],
        ));
      }
    }
    return allWidgets;
  }

  Widget greetingTypeWidget(int index, BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapGreetingType(index);
        },
        child: Container(
            width: getHorizontalSize(148.00),
            margin: getMargin(left: 15, top: 4, bottom: 5),
            padding: getPadding(left: 5, top: 5, right: 5, bottom: 5),
            decoration: getDecorationBox(random.nextInt(6)),
            child: Column(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: getPadding(left: 0),
                      child: Text(greetingTypes[index].typeName ?? '',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold14.copyWith(
                              letterSpacing: getHorizontalSize(0.15)))),
                  CustomImageView(
                      url: greetingTypes[index].thumbnailURL,
                      radius: BorderRadius.circular(15),
                      // height: getVerticalSize(49.00),
                      // width: getHorizontalSize(129.00),
                      margin: getMargin(
                        top: 5,
                      ))
                ])));
  }

  BoxDecoration getDecorationBox(int index) {
    switch (index) {
      case 1:
        return AppDecoration.fillPurple50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 2:
        return AppDecoration.fillDeeppurple50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 3:
        return AppDecoration.fillRed10001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 4:
        return AppDecoration.fillYellow100
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      case 5:
        return AppDecoration.fillDeeporangeA100a3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);

      default:
        return AppDecoration.fillLightblue50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5);
    }
  }

  onTapGreetingType(int index) {
    var typeID = greetingTypes[index].typeID;
    var typeName = greetingTypes[index].typeName;
    Navigator.of(context).pushNamed(AppRoutes.basicGreetingEntryScreen,
        arguments: {"Type": typeID, "TypeName": typeName, "SelectedCardID": 0});
  }

  onTapContrast5() {
    Navigator.of(context).pushNamed(AppRoutes.myEGreetingCardsScreen);
  }
}
