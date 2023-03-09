import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:digitalcardsgaammabytes/core/utils/progress_dialog_utils.dart';
import 'package:digitalcardsgaammabytes/data/models/comments/get_comments_resp.dart';

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
import '../../core/environment/env_config.dart';

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

  Future<List<GetCommentsResp>> fetchComments() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/posts/1/comments');
      ProgressDialogUtils.hideProgressDialog();
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
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  
  Future<PostMyProfileResp> createMyProfile(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/MyProfile', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostMyProfileResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostMyProfileResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetMyProfileResp> fetchMyProfile(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/API/MyProfile', query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetMyProfileResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetMyProfileResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<CommonGenericResp> createConfirmUser(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ConfirmUser', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }


  Future<CommonGenericResp> changePassword(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ChangePassword', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
  
  Future<CommonGenericResp> forgotPassword(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ForgotPassword', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
  
  Future<CommonGenericResp> resetPassword(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/ResetPassword', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return CommonGenericResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? CommonGenericResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
  Future<PostRegistrationResp> createRegistration(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/Registration', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRegistrationResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostRegistrationResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetCheckDuplicatePhoneNoResp> fetchCheckDuplicatePhoneNo(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/API/CheckDuplicatePhoneNo',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetCheckDuplicatePhoneNoResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetCheckDuplicatePhoneNoResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetCheckDuplicateEmailResp> fetchCheckDuplicateEmail(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/API/CheckDuplicateEmail',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetCheckDuplicateEmailResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetCheckDuplicateEmailResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostLoginResp> createLogin({Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/API/Login', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostLoginResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostLoginResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetValidateCouponCodeResp> fetchValidateCouponCode(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/API/ValidateCouponCode',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetValidateCouponCodeResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetValidateCouponCodeResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostPreviewGreetingCardResp> createPreviewGreetingCard(
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/PreviewGreetingCard',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPreviewGreetingCardResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPreviewGreetingCardResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostPreviewGreetingTemplateResp> previewGreetingTemplate(
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
          '$url/APIG/PreviewGreetingTemplate',
          query: queryParams,
          body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPreviewGreetingTemplateResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPreviewGreetingTemplateResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostPublishGreetingResp> createPublishGreeting(
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/PublishGreeting',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPublishGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPublishGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostDeleteGreetingResp> createDeleteGreeting(
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/DeleteGreeting',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostDeleteGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostDeleteGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostHideGreetingResp> createHideGreeting(
      {Map<String, dynamic> queryParams = const {},
      Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('$url/APIG/HideGreeting',
          query: queryParams, body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostHideGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostHideGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetFilterGreetingTemplateResp> fetchFilterGreetingTemplate(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient
          .get('$url/APIG/FilterGreetingTemplate', query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetFilterGreetingTemplateResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetFilterGreetingTemplateResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PostCreateGreetingResp> createCreateGreeting(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.post('$url/APIG/CreateGreeting', body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostCreateGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostCreateGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetCreateGreetingResp> fetchGetCreateGreeting(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APIG/GetCreateGreeting',
          query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGetCreateGreetingResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetCreateGreetingResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGreetingDetailsResp> fetchGreetingDetails(
      {Map<String, dynamic> queryParams = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response =
          await httpClient.get('$url/APIG/GreetingDetails', query: queryParams);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGreetingDetailsResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGreetingDetailsResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<GetGetGreetingTypeResp> fetchGetGreetingType() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.get('$url/APIG/GetGreetingType');
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGetGreetingTypeResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? GetGetGreetingTypeResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
