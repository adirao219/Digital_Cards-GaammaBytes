import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/models/confirmUser/post_confirm_user_resp.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/deleteGreeting/post_delete_greeting_resp.dart';
import '../../data/models/myProfile/get_my_profile_resp.dart';
import '../../widgets/app_bar/appbar_title.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MakePaymentScreen createState() => _MakePaymentScreen();
}

class _MakePaymentScreen extends State<MakePaymentScreen> {
  ApiClient api = new ApiClient();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _razorpay = Razorpay();
  TextEditingController _email_id4_Controller = new TextEditingController();
  TextEditingController _amount_Controller = new TextEditingController();
  TextEditingController _gstin_Controller = new TextEditingController();
  TextEditingController _name_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _credits_Controller = new TextEditingController();
  TextEditingController _registered_on_Controller = new TextEditingController();
  String razorPayAPIKey = "";
  String razorPayAPISecret = "";
  String currentOrderID = "";
  String currentPaymentID = "";
  String currentTransactiontID = "";
  double amount= 0.0;
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getRazorPayAPIKey();
    getProfileDetails();
    super.initState();
  }

  getProfileDetails() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
      };
      GetMyProfileResp resp = await api.fetchMyProfile(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          _name_Controller.text = resp.result!.displayName ?? '';
          _email_id4_Controller.text = resp.result!.email ?? '';
          _phone_number_Controller.text = resp.result!.phoneNumber ?? '';
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

  getRazorPayAPIKey() async {
    try {
      var req = {
        "AuthKey":"jxXqsF2vOufdsBaApiffyA==",
      };
      APIResponse resp = await api.fetchRazorPayAPIKey(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          razorPayAPIKey = resp.result['Key'];
          razorPayAPISecret = resp.result['Secret'];
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    try {
      setState(() {
        currentTransactiontID = response.paymentId ?? '';
        updatePaymentSuccess();
      });
      print("Payment-Success:" + response.toString());
    } catch (e) {}
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    try {
      setState(() {
        // currentPaymentID = response.paymentId??'';
        updatePaymentFailure(response.message??'');
      });
      print("Payment-Error:" + response.toString());
    } catch (e) {}
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    try {
      print("Payment-ExternalWallet:" + response.toString());
    } catch (e) {}
  }

  makePaymentInitiation() async {
    try {
      var req = {
        "UserIdString": GlobalVariables.userID,
        "Buyer_Name": _name_Controller.text,
        "Buyer_Email": _email_id4_Controller.text,
        "Buyer_Phone": _phone_number_Controller.text,
        "Buyer_GST": _gstin_Controller.text,
        "PaymentOption": 5,
        "PaymentAmount": amount,
        "Purpose": "Digital Cards",
        "RequestId": "",
        "RequestDate": "",
        "NoOfCredits": _credits_Controller.text
      };
      CommonGenericResp resp =
          await api.makePaymentInitiation(requestData: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          currentOrderID=resp.result?['RequestId'];
          currentPaymentID=(resp.result?['PayId']??0).toString();
          buildreq();
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

  updatePaymentSuccess() async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "PayId": currentPaymentID,
        "OrderId": currentOrderID,
        "PaymentId": currentTransactiontID,
        "Status": "Completed"
      };
      APIResponse resp =
          await api.updatePaymentSuccess(queryParams: req, requestData: {});
      if (resp.isSuccess ?? false) {
        setState(() {
         Get.snackbar('Success', _credits_Controller.text+" credit"+(int.parse(_credits_Controller.text)>1?"s":"") +" purchased successfully!",
            backgroundColor: Color.fromARGB(255, 208, 245, 216),
            colorText: Colors.green[900],
            icon: Icon(
              Icons.done,
              color: Colors.green[900],
            ));
            Navigator.pop(context);
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
 updatePaymentFailure(String reason) async {
    try {
      var req = {
        "UserId": GlobalVariables.userID,
        "PayId": currentPaymentID,
        "OrderId": currentOrderID,
        "Status": "Failed",
        "Remarks": reason
      };
      APIResponse resp =
          await api.updatePaymentFailure(queryParams: req, requestData: {});
      if (resp.isSuccess ?? false) {
        setState(() {
              Get.snackbar('Error', reason,
            backgroundColor: Color.fromARGB(255, 255, 230, 230),
            colorText: Colors.red[900],
            icon: Icon(
              Icons.error,
              color: Colors.red[900],
            ));
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

  buildreq() async {
    if (amount!=0) {
      var options = {
        'key': razorPayAPIKey,
        'amount': amount, //in the smallest currency sub-unit.
        'name': 'Gaamma Cards',
        'order_id': currentOrderID, // Generate order_id using Orders API
        'description':
            'Buying ' + _credits_Controller.text + ' Credits for usage',
        'timeout': 300, // in seconds
        'prefill': {
          'contact': _phone_number_Controller.text,
          'email': _email_id4_Controller.text
        }
      };
      _razorpay.open(options);
    }
  }

  getCreditAmount() async {
    try {
      var query = {
        "NoCredits": _credits_Controller.text,
      };
      APIResponse resp = await api.getCreditAmount(queryParams: query);
      if (resp.isSuccess ?? false) {
        setState(() {
          amount =double.parse(resp.result.toString());
          _amount_Controller.text = resp.result.toString()+" INR";
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
                                text: "lbl_make_payment".tr.toUpperCase(),
                                margin: getMargin(left: 40, top: 0))
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_name".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  focusNode: FocusNode(),
                  controller: _name_Controller,
                  hintText: "Enter your name",
                  margin: getMargin(
                    top: 5,
                  ),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_email_id4".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  controller: _email_id4_Controller,
                  hintText: "Enter your email".tr,
                  margin: getMargin(
                    top: 5,
                  ),
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_phone_number".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  controller: _phone_number_Controller,
                  hintText: "Enter your phone number".tr,
                  margin: getMargin(
                    top: 5,
                  ),
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "Please enter valid phone number";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_gstin".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  controller: _gstin_Controller,
                  hintText: "Enter your GSTIN Number".tr,
                  margin: getMargin(
                    top: 5,
                  ),
                ),
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_credits".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  onChanged: (value) {
                    getCreditAmount();
                  },
                  width: 326,
                  textInputType: TextInputType.number,
                  controller: _credits_Controller,
                  hintText: "Enter no. of credits you want to purchase".tr,
                  margin: getMargin(
                    top: 5,
                  ),
                ),
                Container(
                  margin: getMargin(
                    top: 20,
                  ),
                  child: Text("lbl_payment_amount".tr,
                      style: AppStyle.txtNunitoSansBold14Pink900),
                ),
                CustomTextFormField(
                  width: 326,
                  isEnabled: false,
                  controller: _amount_Controller,
                  hintText:
                      "Amount will be calculated based on credits entered".tr,
                  margin: getMargin(
                    top: 5,
                  ),
                  textInputAction: TextInputAction.done,
                ),
                CustomButton(
                  height: 40,
                  width: 250,
                  text: "lbl_pay_now".tr,
                  margin: getMargin(
                    top: 30,
                    bottom: 5,
                  ),
                  alignment: Alignment.center,
                  onTap: () {
                    makePaymentInitiation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
