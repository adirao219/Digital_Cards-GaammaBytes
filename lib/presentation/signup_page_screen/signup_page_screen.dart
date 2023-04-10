import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/data/apiClient/api_client.dart';
import 'package:digitalcardsgaammabytes/data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_image.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/appbar_subtitle.dart';
import 'package:digitalcardsgaammabytes/widgets/app_bar/custom_app_bar.dart';
import 'package:digitalcardsgaammabytes/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:digitalcardsgaammabytes/domain/googleauth/google_auth_helper.dart';

import '../../core/service/authenticationservice.dart';
import '../../data/globals/globalvariables.dart';
import '../../data/models/login/post_login_resp.dart';

class SignupPageScreen extends StatefulWidget {
  const SignupPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageScreen createState() => _SignupPageScreen();
}

TextEditingController _phoneController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _SignupPageScreen extends State<SignupPageScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      // clientId: "278783358961-uvc5m9nm9sdusq045fsr4ft8oif1u1sk.apps.googleusercontent.com",

      // scopes: <String>[
      //   'email',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  String googleUseremail = "";
  String googleDiaplayName = "";
  String googleUserName = "";
  String googleUserToken = "";
  String googleUserPhoneNumber = "";
  String googleUserPhotoURL = "";

  ApiClient api = new ApiClient();
  @override
  void initState() {
    AuthService.instance.initAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(108.00),
                centerTitle: true,
                title: Container(
                    height: getVerticalSize(98.15),
                    width: size.width,
                    child: Stack(alignment: Alignment.centerRight, children: [
                      AppbarImage(
                          height: getVerticalSize(94.00),
                          width: getHorizontalSize(375.00),
                          imagePath: ImageConstant.imgVectorDeepOrangeA100,
                          margin: getMargin(bottom: 4)),
                      Container(
                        alignment: Alignment.center,
                        child: AppbarSubtitle(
                            text: "msg_sign_in_to_gaamma_cards".tr,
                            margin: getMargin(left: 0, top: 50, bottom: 5)),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 0, top: 83, right: 0),
                              child: Text("msg_use_your_credentials".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold12)))
                    ])),
                styleType: Style.bgStyle_3),
            body: SingleChildScrollView(
                padding: getPadding(left: 38, top: 61, right: 38),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: googleAuthSignin,
                          child: Container(
                              alignment: Alignment.center,
                              padding: getPadding(
                                  left: 19, top: 7, right: 19, bottom: 7),
                              decoration: AppDecoration.outlineBlack9003f2
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgGooglelogo1,
                                        height: getVerticalSize(25.00),
                                        width: getHorizontalSize(26.00)),
                                    Padding(
                                        padding: getPadding(
                                            left: 15,
                                            top: 2,
                                            right: 1,
                                            bottom: 1),
                                        child: Text(
                                            "msg_continue_with_google".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtNunitoSansBlack16))
                                  ]))),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          child: Column(children: [
                            TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (text) {
                                //   if (_emailController.text == null ||
                                //       _emailController.text.trim().isEmpty) {
                                //     return 'Please enter your email address';
                                //   }
                                //   // Check if the entered email has the right format
                                //   if (!RegExp(r'\S+@\S+\.\S+')
                                //       .hasMatch(_emailController.text)) {
                                //     return 'Please enter a valid email address';
                                //   }
                                //   if (_emailController.text.trim().length >
                                //       35) {
                                //     return 'Email should not be more than 35 characters in length';
                                //   }
                                //   return null;
                                // },
                                // onChanged: (text) =>
                                //     setState(() => _name = text),

                                controller: _phoneController,
                                decoration: InputDecoration(
                                  labelText: "lbl_phone_email_id".tr,
                                  labelStyle: AppStyle.txtNunitoSansRegular12
                                      .copyWith(
                                          height: getVerticalSize(1.10),
                                          fontSize: 13),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 183, 183, 183),
                                      )),
                                  // filled: true,
                                  contentPadding: EdgeInsets.all(15.0),
                                )),
                            const SizedBox(height: 35),
                            TextFormField(
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (text) {
                                //   if (_emailController.text == null ||
                                //       _emailController.text.trim().isEmpty) {
                                //     return 'Please enter your email address';
                                //   }
                                //   // Check if the entered email has the right format
                                //   if (!RegExp(r'\S+@\S+\.\S+')
                                //       .hasMatch(_emailController.text)) {
                                //     return 'Please enter a valid email address';
                                //   }
                                //   if (_emailController.text.trim().length >
                                //       35) {
                                //     return 'Email should not be more than 35 characters in length';
                                //   }
                                //   return null;
                                // },
                                // onChanged: (text) =>
                                //     setState(() => _name = text),

                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: "lbl_password3".tr,
                                  labelStyle: AppStyle.txtNunitoSansRegular12
                                      .copyWith(
                                          height: getVerticalSize(1.10),
                                          fontSize: 13),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 183, 183, 183),
                                      )),
                                  // filled: true,
                                  contentPadding: EdgeInsets.all(15.0),
                                )),
                          ])),
                      GestureDetector(
                          onTap: () {
                            onTapTxtForgotpassword2();
                          },
                          child: Padding(
                              padding: getPadding(top: 8, right: 3),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_forgot_password".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90002,
                                            fontSize: getFontSize(15),
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.gray90002,
                                            fontSize: getFontSize(15),
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline))
                                  ]),
                                  textAlign: TextAlign.left))),
                      CustomButton(
                          height: 40,
                          width: 250,
                          text: "lbl_sign_in2".tr,
                          margin: getMargin(top: 36),
                          fontStyle: ButtonFontStyle.InterSemiBold14,
                          onTap: onTapSignin,
                          // onTap: () {
                          //   Navigator.of(context)
                          //       .pushNamed(AppRoutes.homePageScreen);
                          // },
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount();
                              },
                              child: Container(
                                  width: getHorizontalSize(155.00),
                                  margin:
                                      getMargin(left: 64, top: 25, bottom: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray90002,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(
                                            text: "lbl_create_account".tr,
                                            style: TextStyle(
                                                color:
                                                    ColorConstant.deepOrange300,
                                                fontSize: getFontSize(15),
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline))
                                      ]),
                                      textAlign: TextAlign.center))))
                    ]))));
  }

  googleAuthSignin() async {
    try {
      final authResult = await AuthService.instance.login();
      if (authResult.isAuthSuccess) {
        signInWithGoogleTokens(
            authResult.accessToken ?? '', authResult.idToken ?? '');
      } else {
         Get.snackbar('Failed',"Authorization un-successfull",
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
        // widget.setUnauthenticatedState();
      }
    } catch (er) {
      Get.snackbar('Error', er.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }

  signInWithGoogleTokens(String accessToken, String idToken) async {
    try {
      User? _user;
      // model.state =ViewState.Busy;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      UserCredential authResult = await _auth.signInWithCredential(credential);
      _user = authResult.user;
      assert(!_user!.isAnonymous);
      assert(await _user!.getIdToken() != null);
      User? currentUser = _auth.currentUser;
      assert(_user!.uid == currentUser!.uid);
      // model.state =ViewState.Idle;
      checkGoogleSigninRegistered(_user);
    } catch (ex) {
      Get.snackbar('Error', ex.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }

  signInWithGoogle() async {
    try {
      User? _user;
      // model.state =ViewState.Busy;
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential authResult = await _auth.signInWithCredential(credential);
      _user = authResult.user;
      assert(!_user!.isAnonymous);
      assert(await _user!.getIdToken() != null);
      User? currentUser = _auth.currentUser;
      assert(_user!.uid == currentUser!.uid);
      // model.state =ViewState.Idle;
      setState(() {
        googleDiaplayName = _user!.displayName ?? '';
        googleUseremail = _user.email ?? '';
        googleUserToken = _user.uid;
        googleUserName = _user.email ?? '';
        googleUserPhoneNumber = _user.phoneNumber ?? '';
        googleUserPhotoURL = _user.photoURL ?? '';

        GlobalVariables.setUserID(googleUserToken);
        GlobalVariables.setLogin(true);
        GlobalVariables.setGoogleLoggedIn(true);
        GlobalVariables.setDisplayname(googleDiaplayName);
        GlobalVariables.setUserName(googleUseremail);

        GlobalVariables.setUserPhotoUrl(googleUserPhotoURL);
      });
      print("User Name: ${_user!.displayName}");
      print("User Email ${_user.email}");
    } catch (ex) {
      Get.snackbar('Error', ex.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }

  onTapTxtForgotpassword2() {
    Navigator.of(context).pushNamed(AppRoutes.forgotPasswordoneScreen);
  }

  onTapSignin() async {
    bool isEmail = false;
    try {
      isEmail = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_phoneController.text);
    } catch (e) {}

    var req = {
      "TypeOfLogin": isEmail ? 1 : 2,
      "Email": _phoneController.text,
      "Password": _passwordController.text,
      "RememberMe": false
    };
    PostLoginResp resp = await api.createLogin(requestData: req);
    if (resp.isSuccess ?? false) {
      var res = resp.result;
      var userID = res['UserId'];
      var displayName = res['DisplayName'] ?? "";
      var userPhoto = res['UserPhoto'] ?? '';
      GlobalVariables.setUserID(userID);
      GlobalVariables.setLogin(true);

      GlobalVariables.setGoogleLoggedIn(false);
      GlobalVariables.setDisplayname(displayName);
      GlobalVariables.setUserName(_phoneController.text);
      GlobalVariables.setUserPhotoUrl(userPhoto);

      Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.homePageScreen, (Route<dynamic> route) => false);
    } else {
      Get.snackbar('Error', resp.errorMessage.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }

  checkGoogleSigninRegistered(User? _user) async {
    String userID = "";

    try {
      var req = {
        "Email": _user!.providerData[0].email ?? '',
        "Key": _user.providerData[0].uid,
      };
//Call api and Check Already Registerd, if already registed, then excute below
      PostLoginResp resp = await api.checkGoogleUser(queryParams: req);
      if (resp.isSuccess ?? false) {
        setState(() {
          googleUserName = _user.providerData[0].displayName ?? '';
          googleUseremail = _user.providerData[0].email ?? '';
          googleUserToken = _user.providerData[0].uid ?? '';
          googleUserName = _user.providerData[0].email ?? '';
          googleUserPhoneNumber = _user.providerData[0].phoneNumber ?? '';
          googleUserPhotoURL = _user.providerData[0].photoURL ?? '';

          GlobalVariables.setUserID(userID);
          GlobalVariables.setLogin(true);
          GlobalVariables.setGoogleLoggedIn(true);
          GlobalVariables.setDisplayname(googleUserName);
          GlobalVariables.setUserName(googleUseremail);

          GlobalVariables.setUserPhotoUrl(googleUserPhotoURL);
          Get.snackbar('Success', "Welcome to Gaamma Cards",
              backgroundColor: Color.fromARGB(255, 208, 245, 216),
              colorText: Colors.green[900],
              icon: Icon(
                Icons.done,
                color: Colors.green[900],
              ));
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.homePageScreen, (Route<dynamic> route) => false);
        });
      } else {
        Navigator.of(context).pushNamed(AppRoutes.googlesigninOneScreen,
            arguments: {"userInfo": _user});
      }
    } catch (e) {
        Get.snackbar('Error', e.toString(),
          backgroundColor: Color.fromARGB(255, 255, 230, 230),
          colorText: Colors.red[900],
          icon: Icon(
            Icons.error,
            color: Colors.red[900],
          ));
    }
  }

  onTapTxtDonthaveanaccount() {
    Navigator.of(context).pushNamed(AppRoutes.regiterPageScreen);
  }
}
