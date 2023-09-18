import 'dart:math';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../data/apiClient/api_client.dart';
import '../../data/models/getCardType/get_get_card_type_resp.dart';
import '../../widgets/app_bar/appbar_title.dart';

class DigitalCardOptionsScreen extends StatefulWidget {
  const DigitalCardOptionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DigitalCardOptionsScreen createState() => _DigitalCardOptionsScreen();
}

class _DigitalCardOptionsScreen extends State<DigitalCardOptionsScreen> {
  ApiClient api = new ApiClient();
  List<DigitalCardTypeResult> allDigitalCardTypes = [];
  List<DigitalCardTypeResult> digitalCardTypes = [];

  Random random = new Random();
  TextEditingController _searchController = new TextEditingController();

  bool showSearchOption = false;
  @override
  void initState() {
    getDigitalCardTypes();
    super.initState();
  }

  getDigitalCardTypes() async {
    try {
      GetGetCardTypeResp resp = await api.fetchGetCardType(context);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          allDigitalCardTypes.addAll(resp.result!.toList());
          digitalCardTypes = allDigitalCardTypes;
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
                  child: Stack(children: [
                    AppbarImage(
                        height: getVerticalSize(94.00),
                        width: getHorizontalSize(375.00),
                        imagePath: ImageConstant.imgVectorDeepOrangeA100),
                    Padding(
                        padding:
                            getPadding(left: 38, top: 44, right: 99, bottom: 7),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(children: [
                              Container(
                                  height: getVerticalSize(36.00),
                                  width: getHorizontalSize(38.00),
                                  margin: getMargin(bottom: 6),
                                  child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        AppbarImage(
                                            height: getVerticalSize(36.00),
                                            width: getHorizontalSize(38.00),
                                            svgPath: ImageConstant.imgContrast,
                                            onTap: onTapContrast5),
                                        AppbarImage(
                                            height: getVerticalSize(10.00),
                                            width: getHorizontalSize(5.00),
                                            svgPath:
                                                ImageConstant.imgVectorstroke,
                                            margin: getMargin(
                                                left: 15,
                                                top: 13,
                                                right: 18,
                                                bottom: 13))
                                      ])),
                              AppbarTitle(
                                  text: "msg_card_type".tr.toUpperCase(),
                                  margin: getMargin(left: 60, top: 0))
                            ])))
                  ])),
              // actions: [
              //   AppbarImage(
              //       height: getVerticalSize(35.00),
              //       width: getHorizontalSize(43.00),
              //       svgPath: ImageConstant.imgOverflowmenu,
              //       margin: getMargin(left: 3, top: 47, right: 3, bottom: 26))
              // ],
              styleType: Style.bgStyle_22),
          body: Container(
            width: size.width,
            padding: getPadding(left: 15, top: 10, right: 15, bottom: 39),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: getPadding(left: 24),
                          child: Text("msg_choose_card".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoBold20)),
                      CustomImageView(
                          onTap: () {
                            setState(() {
                              showSearchOption = !showSearchOption;
                            });
                          },
                          svgPath: showSearchOption
                              ? ImageConstant.imgArrowdown
                              : ImageConstant.imgSearch,
                          height: getVerticalSize(17.00),
                          width: getHorizontalSize(16.00),
                          alignment: Alignment.centerLeft,
                          margin:
                              getMargin(left: 7, top: 6, right: 8, bottom: 6)),
                    ],
                  ),
                  Visibility(
                      visible: showSearchOption,
                      child: Card(
                          margin: getMargin(bottom: 10),
                          elevation: 7,
                          child: Container(
                            margin: getMargin(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _searchController,
                                        onChanged: ((value) {
                                          setState(() {
                                            var newdigitalCardTypes =
                                                allDigitalCardTypes
                                                    .where((element) => element
                                                        .cardTypeName!
                                                        .toLowerCase()
                                                        .contains(value
                                                            .toLowerCase()))
                                                    .toList();
                                            digitalCardTypes =
                                                newdigitalCardTypes;
                                          });
                                        }),
                                        decoration: InputDecoration(
                                          labelText: "lbl_search_cards".tr,
                                          labelStyle: AppStyle
                                              .txtNunitoSansRegular12
                                              .copyWith(
                                                  height: getVerticalSize(1.10),
                                                  fontSize: 13),

                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 183, 183, 183),
                                            ),
                                          ),
                                          suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  digitalCardTypes =
                                                      allDigitalCardTypes;
                                                  _searchController.text = "";
                                                });
                                              },
                                              child: Icon(
                                                Icons.cancel,
                                                color: ColorConstant.pink900,
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 183, 183, 183),
                                              )),
                                          // filled: true,
                                          contentPadding: EdgeInsets.all(15.0),
                                        ))),
                              ],
                            ),
                          ))),
                  Column(children: gerAllDigitalCards(context))
                ])),
          ),
        ));
  }

  List<Widget> gerAllDigitalCards(BuildContext context) {
    List<Widget> allWidgets = [];

    for (int i = 0; i < digitalCardTypes.length; i++) {
      if (i % 2 == 0) {
        allWidgets.add(Row(
          children: [
            greetingTypeWidget(i, context),
            if ((i + 1) < digitalCardTypes.length)
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
          onTapDigitalCardType(index);
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
                      child: Text(digitalCardTypes[index].cardTypeName ?? '',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoBold14.copyWith(
                              letterSpacing: getHorizontalSize(0.15)))),
                  CustomImageView(
                      url: digitalCardTypes[index].thumbnailImage,
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

  Widget filterModalContent(StateSetter setModalState) {
    return Card(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                setModalState(() {
                  digitalCardTypes = allDigitalCardTypes;
                  _searchController.text = "";
                  Navigator.pop(context);
                });
              },
              child: Container(
                  padding: getPadding(right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          'Clear Filters',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ))),
          Padding(
              padding: getPadding(left: 20, right: 20, top: 10, bottom: 10),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _searchController,
                  onChanged: ((value) {
                    setState(() {
                      var newdigitalCardTypes = allDigitalCardTypes
                          .where((element) => element.cardTypeName!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      digitalCardTypes = newdigitalCardTypes;
                    });
                  }),
                  decoration: InputDecoration(
                    labelText: "lbl_search_details".tr,
                    labelStyle: AppStyle.txtNunitoSansRegular12
                        .copyWith(height: getVerticalSize(1.10), fontSize: 13),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 183, 183, 183),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 183, 183, 183),
                        )),
                    // filled: true,
                    contentPadding: EdgeInsets.all(15.0),
                  ))),
        ],
      ),
    ));
  }

  onTapDigitalCardType(int index) {
    var typeID = digitalCardTypes[index].cardType;
    var typeName = digitalCardTypes[index].cardTypeName;
    Navigator.of(context).pushNamed(AppRoutes.basicCardEntryOneScreen,
        arguments: {
          "Type": typeID,
          "TypeName": typeName,
          "SelectedCardID": 0,
          "SubTypeName": ""
        });
  }

  onTapContrast5() {
    Navigator.pop(context);
  }
}
