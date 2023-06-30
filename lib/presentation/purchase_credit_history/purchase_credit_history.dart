import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/myProfile/get_my_profile_resp.dart';
import '../../data/models/myProfile/post_my_profile_resp.dart';
import '../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../widgets/app_bar/appbar_title.dart';

class PurchaseCreditHistory extends StatefulWidget {
  const PurchaseCreditHistory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PurchaseCreditHistory createState() => _PurchaseCreditHistory();
}

class _PurchaseCreditHistory extends State<PurchaseCreditHistory> {
  ApiClient api = new ApiClient();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<CreditHistoryData> creditList = [];
  @override
  void initState() {
    getPurchaseCreditHistory();
    super.initState();
  }

  getPurchaseCreditHistory() async {
    try {
      var query = {
        "UserId": GlobalVariables.userID,
      };
      CreditResponse resp = await api.getCreditHistory(queryParams: query);
      if (resp.isSuccess ?? false) {
        setState(() {
          creditList = resp.result ?? [];
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
        resizeToAvoidBottomInset: false,
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
                                      ),
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
                                text: "lbl_payment_history".tr.toUpperCase(),
                                margin: getMargin(left: 30, top: 0))
                          ])))
                ])),
            styleType: Style.bgStyle_22),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            padding: getPadding(
              left: 22,
              top: 0,
              right: 22,
              bottom: 28,
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      height: 40,
                      width: 200,
                      text: (' Show Overall Usage'),
                      prefixWidget: Icon(
                        Icons.data_usage_rounded,
                        color: ColorConstant.pink900,
                      ),
                      // margin: getMargin(top: 22),
                      variant: ButtonVariant.OutlineBlack9003f_1,
                      shape: ButtonShape.RoundedBorder15,
                      fontStyle: ButtonFontStyle.NunitoSansBold14,
                      onTap: () {
                        openPurchaseHistoryDetails(0);
                      },
                    ),
                  ],
                ),

                // CustomExpansionPanelList(
                //   elevation: 8,
                //   radius: 20,
                //   animationDuration: Duration(milliseconds: 800),
                //   expandedHeaderPadding:
                //       EdgeInsets.only(left: 5, bottom: 0, right: 0, top: 0),
                //   expansionCallback: (int index, bool isExpanded) {
                //     setState(() {
                //       creditList[index].isExpanded = !isExpanded;
                //     });
                //   },
                //   children: creditList
                //       .map<ExpansionPanel>((CreditHistoryData element) {
                //     return ExpansionPanel(
                //       headerBuilder: (BuildContext context, bool isExpanded) {
                //         return ListTile(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20)),
                //           tileColor: ColorConstant.pink900,
                //           textColor: Colors.white,
                //           iconColor: Colors.white,
                //           // leading: const Icon(Icons.work_history_outlined),
                //           // contentPadding: getPadding(rop: 0),
                //           title: Text(
                //               'Purchased On - ' + (element.billDate ?? ''),
                //               style: AppStyle.txtNunitoSansBold14white),
                //         );
                //       },
                //       body: purchasehistoryItem(context, element),
                //       isExpanded: element.isExpanded,
                //     );
                //   }).toList(),
                // ),
                Accordion(
                    maxOpenSections: 1,
                    contentBorderColor: ColorConstant.pink900,
                    flipRightIconIfOpen: true,
                    headerBackgroundColor: ColorConstant.pink900,
                    leftIcon:
                        Icon(Icons.history, size: 20, color: Colors.white),
                    children: creditList.map((element) {
                      return AccordionSection(
                        isOpen: true,
                        header:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text(
                            'Purchased On - ' + (element.billDate ?? ''),
                            style: AppStyle.txtNunitoSansBold14white),
                            Text(
                            'Expiry On - ' + (element.expiresOn ?? ''),
                            style: AppStyle.txtNunitoSansBold12white)]),
                        content: purchasehistoryItem(context, element),
                      );
                    }).toList())
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget purchasehistoryItem(BuildContext context, CreditHistoryData data) {
    return GestureDetector(
        child: Column(
              children: [
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("No. of Credits Purcahsed: ".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Row(children: [
                          Text((data.noOfCredits ?? 0).toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.pink900,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Colors.transparent,
                          )
                        ]),
                      ])),
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("No. of Credits Utilized: ".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Row(children: [
                          Text((data.noOfCreditsUtilised ?? 0).toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.pink900,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: ColorConstant.pink900,
                          )
                        ]),
                      ])),
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("No. of Credits Available: ".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Row(children: [
                          Text((data.noOfCreditsPending ?? 0).toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.pink900,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Colors.transparent,
                          )
                        ]),
                      ])),
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text("No. of Credits Lapsed: ".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoSansRegular16.copyWith(
                                    letterSpacing: getHorizontalSize(0.36),
                                    height: getVerticalSize(1.26)))),
                        SizedBox(
                          width: 40,
                        ),
                        Row(children: [
                          Text((data.noOfCreditsLapsed ?? 0).toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.pink900,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Colors.transparent,
                          )
                        ]),
                      ])),
              // Divider(),
              // Padding(
              //     padding: getPadding(left: 0, top: 7, bottom: 7),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Padding(
              //               padding: getPadding(bottom: 0),
              //               child: Text("Expires On: ".tr,
              //                   overflow: TextOverflow.ellipsis,
              //                   textAlign: TextAlign.left,
              //                   style: AppStyle.txtNunitoSansRegular16.copyWith(
              //                       letterSpacing: getHorizontalSize(0.36),
              //                       height: getVerticalSize(1.26)))),
              //           SizedBox(
              //             width: 40,
              //           ),
              //           Padding(
              //               padding: getPadding(bottom: 0),
              //               child: Text((data.expiresOn ?? '').toString(),
              //                   overflow: TextOverflow.ellipsis,
              //                   textAlign: TextAlign.left,
              //                   style: TextStyle(
              //                     color: ColorConstant.pink900,
              //                     fontSize: getFontSize(
              //                       15,
              //                     ),
              //                     fontFamily: 'Nunito Sans',
              //                     fontWeight: FontWeight.w700,
              //                   ))),
              //         ])),
               Divider(),
              Padding(
                  padding: getPadding(left: 0, top: 7, bottom: 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Padding(
                              padding: getPadding(bottom: 0),
                              child: Text("Remarks: ".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: ColorConstant.pink900,
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w700,
                                  ))),
                        ]),
                        Padding(
                            padding: getPadding(bottom: 0),
                            child: Text((data.remarks ?? '').toString(),
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.pink900,
                                      fontSize: getFontSize(
                                        15,
                                      ),
                                      fontFamily: 'Nunito Sans',
                                    ))),
                      ]))
            ]),
        onTap: () {
          openPurchaseHistoryDetails(data.slNo ?? 0);
        });
  }

  void openPurchaseHistoryDetails(int slNo) {
    Navigator.of(context)
        .pushNamed(AppRoutes.purchasecredithistoryDetails, arguments: {
      "slNo": slNo,
    }).then((value) {});
  }
}
