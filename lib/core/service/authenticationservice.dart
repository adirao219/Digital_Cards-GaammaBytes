import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:digitalcardsgaammabytes/helper/constants.dart';

class AuthService {
  static final AuthService instance = AuthService._();
  factory AuthService() => instance;
  AuthService._();

  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<bool> initAuth() async {
    final storedRefreshToken =
        await _secureStorage.read(key: REFRESH_TOKEN_KEY);
    final TokenResponse? result;

    if (storedRefreshToken == null) {
      return false;
    }

    try {
      // Obtaining token response from refresh token
      result = await _appAuth.token(
        TokenRequest(
          clientID(),
          redirectUrl(),
          issuer: GOOGLE_ISSUER,
          refreshToken: storedRefreshToken,
        ),
      );

      var output = await _handleAuthResult(result);
      final bool setResult = output.isAuthSuccess;
      return setResult;
    } catch (e, s) {
      print('error on Refresh Token: $e - stack: $s');
      // logOut() possibly
      return false;
    }
  }

  Future<GoogleAuthResult> login() async {
    final AuthorizationTokenRequest authorizationTokenRequest;

    try {
      authorizationTokenRequest = AuthorizationTokenRequest(
        clientID(),
        redirectUrl(),
        issuer: GOOGLE_ISSUER,
        scopes: ['email', 'profile'],
      );

      // Requesting the auth token and waiting for the response
      final AuthorizationTokenResponse? result =
          await _appAuth.authorizeAndExchangeCode(
        authorizationTokenRequest,
      );

      // Taking the obtained result and processing it
      return await _handleAuthResult(result);
    } catch (e) {
      print(e);
      return new GoogleAuthResult(false, "","");
    }
  }

  Future<bool> logout() async {
    await _secureStorage.delete(key: REFRESH_TOKEN_KEY);
    return true;
  }

  Future<GoogleAuthResult> _handleAuthResult(result) async {
    GoogleAuthResult authResult = new GoogleAuthResult(false,"","");
    final bool isValidResult =
        result != null && result.accessToken != null && result.idToken != null;
    if (isValidResult) {
      authResult.accessToken = result.accessToken;
      authResult.idToken = result.idToken;
      // Storing refresh token to renew login on app restart
      if (result.refreshToken != null) {
        await _secureStorage.write(
          key: REFRESH_TOKEN_KEY,
          value: result.refreshToken,
        );
      }

      final String googleAccessToken = result.accessToken;

      // Send request to backend with access token
      // final url = Uri.https(
      //   'api.your-server.com',
      //   '/v1/social-authentication',
      //   {
      //     'access_token': googleAccessToken,
      //   },
      // );
      // final response = await http.get(url);
      // final backendToken = response.token

      // Let's assume it has been successful and a valid token has been returned
      const String backendToken = 'TOKEN';
      if (backendToken != null) {
        await _secureStorage.write(
          key: BACKEND_TOKEN_KEY,
          value: backendToken,
        );
      }
      authResult.isAuthSuccess =true;
      return authResult;
    } else {
      return authResult;
    }
  }


}
class GoogleAuthResult{
  bool isAuthSuccess;
  String? accessToken;
  String? idToken;
  GoogleAuthResult(
    this.isAuthSuccess,
    this.accessToken,
    this.idToken
  );
}
