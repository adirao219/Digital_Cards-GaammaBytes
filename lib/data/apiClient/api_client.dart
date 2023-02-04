import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/core/utils/progress_dialog_utils.dart';
import 'package:digitalcards_gaammabytes/data/models/comments/get_comments_resp.dart';

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
}
