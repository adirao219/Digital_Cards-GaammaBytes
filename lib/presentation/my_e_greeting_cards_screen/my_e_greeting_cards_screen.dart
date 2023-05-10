import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:digitalcardsgaammabytes/presentation/my_e_greeting_cards_screen/widgets/greeting_item_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../../data/models/getGreetingType/get_get_greeting_type_resp.dart';
import '../../data/models/greetingDetails/get_greeting_details_resp.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'models/my_e_greeting_cards_model.dart';

class MyEGreetingCardsScreen extends StatefulWidget {
  const MyEGreetingCardsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyEGreetingCardsScreen createState() => _MyEGreetingCardsScreen();
}

class _MyEGreetingCardsScreen extends State<MyEGreetingCardsScreen> {
  Rx<MyEGreetingCardsModel> myEGreetingCardsModelObj =
      MyEGreetingCardsModel().obs;
  ApiClient api = new ApiClient();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController _innerrefreshController =
      RefreshController(initialRefresh: false);
  TextEditingController _anywhere_Controller = new TextEditingController();
  int? selectedGreetingTypeID;
  List<Result> greetingTypes = [];
  String? sortbyOption = "latestcreated";
  bool? showHidden;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      initialLoad();
    });

    super.initState();
  }

  void initialLoad() {
    setState(() {
      sortbyOption = "latestcreated";
    });
    getGreetingTypes();
    getGreetingList();
  }

  getGreetingList() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID.toString(),
        "GreetingType": (selectedGreetingTypeID ?? "").toString(),
        "Hidden": (showHidden == null
            ? ""
            : (((showHidden ?? false) == false) ? "No" : "Yes")),
        "Anywhere": _anywhere_Controller.text,
        "SortBy":
            (sortbyOption == "latestcreated" || sortbyOption == "oldestcreated")
                ? "C"
                : "S",
        "OrderBy": (sortbyOption == "latestpublished" ||
                sortbyOption == "latestcreated")
            ? "D"
            : "A",
        "OnlyGreetingList": true.toString()
      };
      GetGreetingDetailsResp resp =
          await api.fetchGreetingDetails(queryParams: req);
      if ((resp.isSuccess ?? false)) {
        setState(() {
          myEGreetingCardsModelObj.value.gridchristmasthumbnailItemList =
              resp.result?.greetingDetailsList ?? [];
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

  getGreetingTypes() async {
    try {
      GetGetGreetingTypeResp resp = await api.fetchGetGreetingType();
      if ((resp.isSuccess ?? false)) {
        setState(() {
          greetingTypes.addAll(resp.result!.toList());
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

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()

    await getGreetingList();
    _refreshController.refreshCompleted();
    _innerrefreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    // setState(() {

    // });
    _refreshController.loadComplete();
    _innerrefreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: Container(
                    width: size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(ImageConstant
                                          .imgVectorDeepOrangeA100),
                                      fit: BoxFit.cover)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomAppBar(
                                        height: getVerticalSize(94.00),
                                        leadingWidth: 150,
                                        leading: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                                height: getVerticalSize(36.00),
                                                width: getHorizontalSize(38.00),
                                                margin: getMargin(
                                                    left: 38,
                                                    top: 44,
                                                    bottom: 14),
                                                child: Row(
                                                  children: [
                                                    Stack(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        children: [
                                                          AppbarImage(
                                                              height:
                                                                  getVerticalSize(
                                                                      36.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      38.00),
                                                              svgPath: ImageConstant
                                                                  .imgContrast),
                                                          AppbarImage(
                                                              height:
                                                                  getVerticalSize(
                                                                      10.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      5.00),
                                                              svgPath: ImageConstant
                                                                  .imgVectorstroke,
                                                              onTap: onTapBack,
                                                              margin: getMargin(
                                                                  left: 15,
                                                                  top: 13,
                                                                  right: 18,
                                                                  bottom: 13)),
                                                        ]),
                                                    AppbarSubtitle(
                                                        text:
                                                            "lbl_my_egreetings"
                                                                .tr,
                                                        margin: getMargin(
                                                            left: 40, top: 10)),
                                                  ],
                                                ))),
                                        actions: [
                                          Card(
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 0,
                                              margin: getMargin(
                                                  left: 35,
                                                  top: 50,
                                                  right: 35,
                                                  bottom: 15),
                                              color: ColorConstant.gray50,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              5.00))),
                                              child: Container(
                                                  height:
                                                      getVerticalSize(29.00),
                                                  width:
                                                      getHorizontalSize(31.00),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.gray50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  5.00))),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      children: [
                                                        CustomImageView(
                                                            onTap: () =>
                                                                showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  builder:
                                                                      (context) {
                                                                    return StatefulBuilder(builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            setModalState) {
                                                                      return Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.80,
                                                                        decoration:
                                                                            new BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              new BorderRadius.only(
                                                                            topLeft:
                                                                                const Radius.circular(25.0),
                                                                            topRight:
                                                                                const Radius.circular(25.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              filterModalContent(setModalState),
                                                                        ),
                                                                      );
                                                                    });
                                                                  },
                                                                ),
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSearch,
                                                            height:
                                                                getVerticalSize(
                                                                    17.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    16.00),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            margin: getMargin(
                                                                left: 7,
                                                                top: 6,
                                                                right: 8,
                                                                bottom: 6))
                                                      ])))
                                        ],
                                        styleType: Style.bgStyle_7)
                                  ])),
                          Expanded(
                              child: SmartRefresher(
                                  enablePullDown: true,
                                  enablePullUp: true,
                                  header: WaterDropHeader(),
                                  controller: _innerrefreshController,
                                  onRefresh: _onRefresh,
                                  onLoading: _onLoading,
                                  child: SingleChildScrollView(
                                      child: Padding(
                                          padding: getPadding(
                                              left: 40, top: 0, right: 33),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CustomButton(
                                                    height: 57,
                                                    width: 237,
                                                    text:
                                                        "msg_create_e_greeting"
                                                            .tr,
                                                    variant: ButtonVariant
                                                        .OutlineBlack9003f,
                                                    shape: ButtonShape
                                                        .RoundedBorder28,
                                                    padding: ButtonPadding
                                                        .PaddingAll18,
                                                    fontStyle: ButtonFontStyle
                                                        .NunitoSansBlack14,
                                                    onTap:
                                                        onTapCreateegreetingcard),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Visibility(
                                                    visible:
                                                        myEGreetingCardsModelObj
                                                                .value
                                                                .gridchristmasthumbnailItemList
                                                                .length >
                                                            0,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          ('Total No. of Greetings  '),
                                                          style: AppStyle
                                                              .txtNunitoSansBold14,
                                                        ),
                                                        Container(
                                                          padding: getPadding(
                                                              left: 5,
                                                              right: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    width: 2,
                                                                    color: ColorConstant
                                                                        .pink900,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              50))),
                                                          child: Text(
                                                            (myEGreetingCardsModelObj
                                                                .value
                                                                .gridchristmasthumbnailItemList
                                                                .length
                                                                .toString()),
                                                            style: AppStyle
                                                                .txtNunitoSansBold14,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Padding(
                                                    padding: getPadding(top: 0),
                                                    child: Obx(() =>
                                                        GridView.builder(
                                                            shrinkWrap: true,
                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                mainAxisExtent:
                                                                    getVerticalSize(
                                                                        160.00),
                                                                crossAxisCount:
                                                                    2,
                                                                mainAxisSpacing:
                                                                    getHorizontalSize(
                                                                        15.00),
                                                                crossAxisSpacing:
                                                                    getHorizontalSize(
                                                                        15.00)),
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                myEGreetingCardsModelObj
                                                                    .value
                                                                    .gridchristmasthumbnailItemList
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              GreetingListDetail
                                                                  model =
                                                                  myEGreetingCardsModelObj
                                                                          .value
                                                                          .gridchristmasthumbnailItemList[
                                                                      index];
                                                              return GreetingItemWidget(
                                                                  model,
                                                                  (showHidden ??
                                                                      false),
                                                                  actionPerformed);
                                                            }))),
                                              ])))))
                        ])))));
  }

  actionPerformed() async {
    Navigator.pop(context);
    await getGreetingList();
    Navigator.pop(context);
  }

  Widget filterModalContent(StateSetter setModalState) {
    return 
    SingleChildScrollView(child:
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                setModalState(() {
                  _anywhere_Controller.text = "";
                  selectedGreetingTypeID = null;
                  showHidden = null;
                  sortbyOption = "latestcreated";
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "lbl_search_details".tr,
                  style: AppStyle.txtNunitoBold18.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
              padding: getPadding(top: 10, left: 25, right: 20),
              child: Text("lbl_anywhere".tr,
                  style: AppStyle.txtNunitoSansRegular14Pink900)),
          Container(
              padding: getPadding(top: 5, left: 20, right: 20, bottom: 5),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _anywhere_Controller,
                  decoration: InputDecoration(
                    labelText: "lbl_anywhere".tr,
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
          Container(
              padding: getPadding(top: 10, left: 25, right: 20),
              child: Text("msg_card_type".tr,
                  style: AppStyle.txtNunitoSansRegular14Pink900)),
          Container(
            padding: getPadding(top: 0, left: 20, right: 20, bottom: 0),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 194, 194, 194),
                      style: BorderStyle.solid,
                      width: 0.80),
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                  isExpanded: true,
                  // Initial Value
                  value: selectedGreetingTypeID,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                    'Select Type',
                    style: AppStyle.txtNunitoSansRegular14Gray70001,
                  ),
                  // Array list of items
                  items: greetingTypes.map((items) {
                    return DropdownMenuItem(
                      value: items.typeID,
                      child: Text(
                        items.typeName ?? '',
                        style: AppStyle.txtNunitoSansRegular14Gray70001,
                      ),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setModalState(() {
                      selectedGreetingTypeID = newValue!;
                    });
                    //  getTemplate(newValue ?? "");
                  },
                ))),
          ),
          CheckboxListTile(
            title: Container(
                padding: getPadding(top: 0, left: 10, right: 20),
                child: Text(
                  "lbl_hidden_check".tr,
                  style: AppStyle.txtNunitoSansRegular14Pink900,
                )), //    <-- label
            value: showHidden ?? false,
            onChanged: (newValue) {
              setModalState(() {
                showHidden = newValue ?? false;
              });
            },
          ),
          Divider(
            color: ColorConstant.black9003f,
          ),
          Container(
              padding: getPadding(top: 10, left: 25, right: 20),
              child: Text(
                "lbl_sort_by".tr,
                style: AppStyle.txtNunitoSansRegular14Pink900,
              )),
          Container(
              padding: getPadding(top: 0, left: 25, right: 20, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RadioListTile(
                    contentPadding: getPadding(all: 0),
                    title: Text(
                      "lbl_created_date_latest".tr,
                      style: AppStyle.txtNunitoSansRegular14Gray70001,
                    ),
                    value: "latestcreated",
                    groupValue: sortbyOption,
                    selected: sortbyOption == "latestcreated",
                    onChanged: (value) {
                      setModalState(() {
                        sortbyOption = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: getPadding(all: 0),
                    title: Text(
                      "lbl_created_date_oldest".tr,
                      style: AppStyle.txtNunitoSansRegular14Gray70001,
                    ),
                    value: "oldestcreated",
                    groupValue: sortbyOption,
                    selected: sortbyOption == "oldestcreated",
                    onChanged: (value) {
                      setModalState(() {
                        sortbyOption = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: getPadding(all: 0),
                    title: Text(
                      "lbl_published_date_latest".tr,
                      style: AppStyle.txtNunitoSansRegular14Gray70001,
                    ),
                    value: "latestpublished",
                    groupValue: sortbyOption,
                    selected: sortbyOption == "latestpublished",
                    onChanged: (value) {
                      setModalState(() {
                        sortbyOption = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: getPadding(all: 0),
                    title: Text(
                      "lbl_published_date_oldest".tr,
                      style: AppStyle.txtNunitoSansRegular14Gray70001,
                    ),
                    value: "oldestpublished",
                    groupValue: sortbyOption,
                    selected: sortbyOption == "oldestpublished",
                    onChanged: (value) {
                      setModalState(() {
                        sortbyOption = value.toString();
                      });
                    },
                  ),
                ],
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                padding: getPadding(top: 0, left: 0, bottom: 0),
                child: CustomButton(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: "lbl_apply".tr,
                    margin: getMargin(top: 0, bottom: 5),
                    fontStyle: ButtonFontStyle.NunitoSansBlack16,
                    onTap: onTapOk)),
            Container(
                padding: getPadding(top: 0, left: 15, bottom: 0),
                child: CustomButton(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: "lbl_close".tr,
                    margin: getMargin(top: 0, bottom: 5),
                    fontStyle: ButtonFontStyle.NunitoSansBlack16,
                    onTap: () {
                      Navigator.pop(context);
                    })),
          ])
        ],
      ),
    ));
  }

  onTapCreateegreetingcard() {
    Navigator.of(context)
        .pushNamed(AppRoutes.eGreetingCardOptionsScreen)
        .then((value) {
      getGreetingList();
    });
  }

  onTapBack() {
    Navigator.of(context).pop();
  }

  onTapOk() {
    Navigator.of(context).pop();
    getGreetingList();
  }

  onTapImgSearch() {
    Navigator.of(context).pushNamed(AppRoutes.searchPopuptwoScreen);
  }
}
