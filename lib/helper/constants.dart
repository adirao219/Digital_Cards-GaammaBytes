import 'dart:io' show Platform;
import 'dart:ui';

const REFRESH_TOKEN_KEY = 'refresh_token';
const BACKEND_TOKEN_KEY = 'backend_token';
const GOOGLE_ISSUER = 'https://accounts.google.com';
const GOOGLE_CLIENT_ID_IOS = '<IOS-CLIENT-ID>';
const GOOGLE_REDIRECT_URI_IOS = 'com.googleusercontent.apps.<IOS-CLIENT-ID>:/oauthredirect';
const GOOGLE_CLIENT_ID_ANDROID = '278783358961-hqur6kiemlnd2nnnmdabr5riljfhc3pp.apps.googleusercontent.com';
// const GOOGLE_CLIENT_ID_ANDROID = '278783358961-hqur6kiemlnd2nnnmdabr5riljfhc3pp';
const GOOGLE_REDIRECT_URI_ANDROID = 'com.googleusercontent.apps.278783358961-hqur6kiemlnd2nnnmdabr5riljfhc3pp:/oauth2redirect';

String clientID() {
  if(Platform.isAndroid) {
    return GOOGLE_CLIENT_ID_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_CLIENT_ID_IOS;
  }
  return '';
}

String redirectUrl() {
  if(Platform.isAndroid) {
    return GOOGLE_REDIRECT_URI_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_REDIRECT_URI_IOS;
  }
  return '';
}
  Color fromHex(String hexString) {
    if(hexString.isEmpty)
    {
      hexString = "#000000";
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
    
  }