import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/validation_functions.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../widgets/app_bar/appbar_title.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MakePaymentScreen createState() => _MakePaymentScreen();
}

class _MakePaymentScreen extends State<MakePaymentScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _razorpay = Razorpay();
  TextEditingController _email_id4_Controller = new TextEditingController();
  TextEditingController _amount_Controller = new TextEditingController();
  TextEditingController _gstin_Controller = new TextEditingController();
  TextEditingController _name_Controller = new TextEditingController();
  TextEditingController _phone_number_Controller = new TextEditingController();
  TextEditingController _credits_Controller = new TextEditingController();
  TextEditingController _registered_on_Controller = new TextEditingController();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    try {

      print("Payment-Success:"+response.toString());
    } catch (e) {}
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    try {
      
      print("Payment-Error:"+response.toString());
    } catch (e) {}
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    try {
      
      print("Payment-ExternalWallet:"+response.toString());
    } catch (e) {}
  }

  buildreq() async {
    var options = {
      'key': 'rzp_test_6spCI8RH7MtYCd',
      'amount': 24900, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': 'order_Ko8Ybnf88j65XC', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 300, // in seconds
      'prefill': {'contact': '8498568889', 'email': 'adirao219@gmail.com'}
    };
    _razorpay.open(options);
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                  width: 326,
                  focusNode: FocusNode(),
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
                  focusNode: FocusNode(),
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
                    buildreq();
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
