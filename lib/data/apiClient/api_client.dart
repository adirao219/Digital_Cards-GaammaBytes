import 'dart:convert';

import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/progress_dialog_utils.dart';
import 'package:digitalcardsgaammabytes/data/models/comments/get_comments_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/getCardType/get_get_card_type_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/getCardSubType/get_get_card_sub_type_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/cardDetails/get_card_details_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/checkDuplicateEmail/get_check_duplicate_email_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/checkDuplicatePhoneNo/get_check_duplicate_phone_no_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/confirmUser/post_confirm_user_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/createGreeting/post_create_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/deleteGreeting/post_delete_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/filterGreetingTemplate/get_filter_greeting_template_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/getCreateGreeting/get_get_create_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/getGreetingType/get_get_greeting_type_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/greetingDetails/get_greeting_details_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/hideGreeting/post_hide_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/login/post_login_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/myProfile/get_my_profile_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/myProfile/post_my_profile_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/previewGreetingCard/post_preview_greeting_card_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/previewGreetingTemplate/post_preview_greeting_template_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/publishGreeting/post_publish_greeting_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/registration/post_registration_resp.dart';
import 'package:digitalcardsgaammabytes/data/models/validateCouponCode/get_validate_coupon_code_resp.dart';
import 'package:flutter/material.dart';
import '../../core/environment/env_config.dart';
import '../globals/globalvariables.dart';
import '../models/createCard/post_create_card_resp.dart';
import '../models/deleteCard/get_delete_card_resp.dart';
import '../models/driveImages/drive_file_images_resp.dart';
import '../models/filterCardTheme/get_filter_card_theme_resp.dart';
import '../models/getBands/get_band_data_resp.dart';
import '../models/getBands/get_get_bands_resp.dart';
import '../models/getCardTemplate/get_get_card_template_resp.dart';
import '../models/getCreateCard/get_get_create_card_resp.dart';
import '../models/getFooter/get_get_footer_resp.dart';
import '../models/getLanguages/get_get_languages_resp.dart';
import '../models/getLinkDefinition/get_get_link_definition_resp.dart';
import '../models/getThemeDetails/post_get_theme_details_resp.dart';
import '../models/hideCard/get_hide_card_resp.dart';
import '../models/moveDown/post_move_down_resp.dart';
import '../models/moveUp/post_move_up_resp.dart';
import '../models/publish/get_publish_resp.dart';
import '../models/saveFooter/post_save_footer_resp.dart';
import '../models/saveLinkDefinition/post_save_link_definition_resp.dart';

class ApiClient extends GetConnect {
  var url = EnvConfig.config.bASEURL;

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  Future<List<GetCommentsResp>> fetchComments(BuildContext appcontext) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/posts/1/comments');
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return (response.body as List)
            .map((e) => GetCommentsResp.fromJson(e))
            .toList();
      } else {
        throw response.hasError
            ? response.statusText!
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostMyProfileResp> createMyProfile(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/MyProfile', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostMyProfileResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostMyProfileResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetMyProfileResp> fetchMyProfile(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/API/MyProfile', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetMyProfileResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetMyProfileResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> fetchRazorPayAPIKey(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/API/GetRazorPayKey', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonGenericResp> makePaymentInitiation(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/MakePayment', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> updatePaymentSuccess(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    // ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();

      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/API/SuccessCreateCredit',
          query: queryParams, body: requestData);
      // ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      // ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> updatePaymentFailure(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();

      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/API/PaymentFailure',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonGenericResp> createConfirmUser(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ConfirmUser', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonGenericResp> changePassword(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ChangePassword', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonGenericResp> forgotPassword(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ForgotPassword', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonGenericResp> resetPassword(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ResetPassword', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostRegistrationResp> createRegistration(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/Registration', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostRegistrationResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostRegistrationResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetCheckDuplicatePhoneNoResp> fetchCheckDuplicatePhoneNo(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/API/CheckDuplicatePhoneNo',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetCheckDuplicatePhoneNoResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetCheckDuplicatePhoneNoResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetCheckDuplicateEmailResp> fetchCheckDuplicateEmail(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/API/CheckDuplicateEmail',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetCheckDuplicateEmailResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetCheckDuplicateEmailResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostLoginResp> createLogin(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/Login', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostLoginResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostLoginResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostLoginResp> checkGoogleUser(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/API/GetUserDataGmail', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostLoginResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostLoginResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostRegistrationResp> createGoogleUser(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/API/RegistrationGmail',
          body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostRegistrationResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostRegistrationResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetValidateCouponCodeResp> fetchValidateCouponCode(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/API/ValidateCouponCode',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetValidateCouponCodeResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetValidateCouponCodeResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostPreviewGreetingTemplateResp> createPreviewGreetingCard(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();

      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/APIG/PreviewGreetingCard',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostPreviewGreetingTemplateResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPreviewGreetingTemplateResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostPreviewGreetingTemplateResp> previewGreetingTemplate(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
          '$url/APIG/PreviewGreetingTemplate',
          query: queryParams,
          body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostPreviewGreetingTemplateResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPreviewGreetingTemplateResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostPublishGreetingResp> createPublishGreeting(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/PublishGreeting',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostPublishGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPublishGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> createDeleteGreeting(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/DeleteGreeting',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostHideGreetingResp> createHideGreeting(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/HideGreeting',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostHideGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostHideGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CaptionMessageResult> getDefaultCaptionMessage(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient
          .get('$url/APIG/DefaultCaptionMessage', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CaptionMessageResult.fromJson(response.body);
      } else {
        throw response.body != null
            ? CaptionMessageResult.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> fetchFilterGreetingTemplate(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient
          .get('$url/APIG/FilterGreetingTemplate', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> getLanguages(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APIG/GetLanguages', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> getLanguageCaptionData(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient
          .get('$url/API/GetLanguageCaptionData', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetDriveFileImagesResp> getUserImages(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APIG/GetUserImages', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetDriveFileImagesResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetDriveFileImagesResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostCreateGreetingResp> createCreateGreeting(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.post('$url/APIG/CreateGreeting', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostCreateGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostCreateGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> removeImage(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/APIG/RemoveImage',
          body: requestData, query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetCreateGreetingResp> fetchGetCreateGreeting(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();

      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.get('$url/APIG/GetCreateGreeting',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetCreateGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetCreateGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGreetingDetailsResp> fetchGreetingDetails(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APIG/GreetingDetails', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGreetingDetailsResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGreetingDetailsResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetGreetingTypeResp> fetchGetGreetingType(BuildContext appcontext) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APIG/GetGreetingType?LanguageId='+GlobalVariables.currentLanguage);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetGreetingTypeResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetGreetingTypeResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<dynamic> getImageFile(String imageUrl,BuildContext appcontext) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();

      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.get(imageUrl);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return response.bodyBytes;
      } else {
        throw 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> getCreditAmount(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/API/GetCreditAmount', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> getCreditStorage(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.get('$url/API/GetCreditStorageSpace',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> getCreditsAvailable(BuildContext appcontext,
      {bool showProgress = true,
      Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    if (showProgress) {
      ProgressDialogUtils.showProgressDialog(appcontext);
    }
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/API/GetCreditsAvailable',
          query: queryParams, body: requestData);
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<StorageResponse> getStorageAvailable(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/API/GetStorageAvailable',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return StorageResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? StorageResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> addStorage(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.post('$url/API/AddStorage', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CreditDetailsResponse> getCreditDetails(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/API/GetCreditDetails', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CreditDetailsResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? CreditDetailsResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CreditResponse> getCreditHistory(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/API/GetCreditHistory', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CreditResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? CreditResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<dynamic> generateAuth(BuildContext appcontext,String baseURL,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();

      httpClient.timeout = Duration(seconds: 120);
      var key = {"s": ""};
      // var token = base64Encode(bytes)
      Response response = await httpClient.post(baseURL,
          body: requestData, headers: {"Authorization": "Bearer "});
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return response.bodyBytes;
      } else {
        throw 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> createSaveLinkDefinition(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/APID/SaveLinkDefinition',
          body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetLinkDefinitionResp> fetchGetLinkDefinition(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APID/GetLinkDefinition',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetLinkDefinitionResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetLinkDefinitionResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> createMoveDown(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APID/MoveDown',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> createMoveUp(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APID/MoveUp',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetBandsResp> fetchGetBands(BuildContext appcontext,bool showProgress,
      {Map<String, dynamic> queryParams = const {}}) async {
    if (showProgress) ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/GetBandsList', query: queryParams);
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetBandsResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetBandsResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> createSaveFooter(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/APID/SaveFooter', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIBooleanResponse> createSaveBands(BuildContext appcontext,
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.post('$url/APID/SaveBand', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIBooleanResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIBooleanResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetFooterResp> fetchGetFooter(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    // ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/GetFooter', query: queryParams);
      // ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetFooterResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetFooterResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> fetchPublish(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/Publish', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetDeleteCardResp> fetchDeleteCard(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/DeleteCard', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetDeleteCardResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetDeleteCardResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetBandDataResp> fetchGetBandData(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/GetBandData', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetBandDataResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetBandDataResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetDeleteCardResp> fetchDeleteBand(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/APID/DeleteBand', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetDeleteCardResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetDeleteCardResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetHideCardResp> fetchHideCard(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/HideCard', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetHideCardResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetHideCardResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostGetThemeDetailsResp> getThemeDetails(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APID/GetThemeDetails',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostGetThemeDetailsResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostGetThemeDetailsResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostSaveResp> saveCardMain(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.post('$url/APID/SaveCardMain', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostSaveResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostSaveResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostSaveResp> saveCardAdvance(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/APID/SaveCardAdvanced',
          body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostSaveResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostSaveResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostSaveResp> saveCardOtherData(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.post('$url/APID/SaveCardOtherData',
          body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostSaveResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostSaveResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostSaveResp> saveCardDetails(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.post('$url/APID/SaveCardDetails', body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return PostSaveResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostSaveResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetCreateCardResp> fetchGetCreateCard(BuildContext appcontext,
      {bool showProgress = true,
      Map<String, dynamic> queryParams = const {}}) async {
    if (showProgress) {
      
      ProgressDialogUtils.showProgressDialog(appcontext);
    }
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/APID/GetCreateCard', query: queryParams);
      if (showProgress) {
        ProgressDialogUtils.hideProgressDialog(appcontext);
      }
      if (_isSuccessCall(response)) {
        return GetGetCreateCardResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetCreateCardResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> getBackgroundType(BuildContext appcontext,
      {bool showProgress = true,
      Map<String, dynamic> queryParams = const {}}) async {
    if (showProgress) ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response = await httpClient.get('$url/APID/GetBackGroundType',
          query: queryParams);
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> getCreditType(BuildContext appcontext,
      {bool showProgress = true,
      Map<String, dynamic> queryParams = const {}}) async {
    if (showProgress) ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/API/GetCreditType', query: queryParams);
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> checkCardEditExpiry(BuildContext appcontext,{Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/API/CheckCardEditExpiry',
          body: requestData);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<APIResponse> assignCardEditCredits(BuildContext appcontext,
      {Map requestData = const {}}) async {
    // ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient
          .post('$url/API/assignCardEditCredits', body: requestData);
      // ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return APIResponse.fromJson(response.body);
      } else {
        throw response.body != null
            ? APIResponse.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> getFontList(BuildContext appcontext,
      {bool showProgress = true,
      Map<String, dynamic> queryParams = const {}}) async {
    if (showProgress) ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/API/GetFontList', query: queryParams);
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      if (showProgress) ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetCreateCardResp> previewCard(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      httpClient.timeout = Duration(seconds: 120);
      Response response =
          await httpClient.get('$url/APID/PreviewCard', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetCreateCardResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetCreateCardResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetCardTemplateResp> fetchGetCardTemplate(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/GetCardTemplate', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetCardTemplateResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetCardTemplateResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> fetchGetLanguages(BuildContext appcontext) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APID/GetLanguages');
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> fetchGetBandLinkList(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    // ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/GetBandLinkList', query: queryParams);
      // ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      // ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> fetchAfterExpiryList(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APID/GetAfterExpiryList',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonDropdownResp> fetchFilterCardTheme(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/FilterCardTheme', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return CommonDropdownResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonDropdownResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetCardDetailsResp> fetchCardDetails(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/CardDetails', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetCardDetailsResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetCardDetailsResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetCardSubTypeResp> fetchGetCardSubType(BuildContext appcontext,
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APID/GetCardSubType', query: queryParams);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetCardSubTypeResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetCardSubTypeResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetCardTypeResp> fetchGetCardType(BuildContext appcontext) async {
    ProgressDialogUtils.showProgressDialog(appcontext);
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APID/GetCardType?LanguageId='+GlobalVariables.currentLanguage);
      ProgressDialogUtils.hideProgressDialog(appcontext);
      if (_isSuccessCall(response)) {
        return GetGetCardTypeResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetCardTypeResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog(appcontext);
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
