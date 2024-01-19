import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'core/app_export.dart';
import 'core/environment/env_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    EnvConfig.initConfig(
        environment: (true ? Environment.prod : Environment.dev));
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    Firebase.initializeApp().then((val) {
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
            child: Lottie.asset(
              'assets/lottieFiles/custom_loader.json',
              height: 250,
              width: 250,
            ),
          ),
      // overlayColor: Colors.black,
      overlayOpacity: 1.8,
        child: ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(

      //   visualDensity: VisualDensity.standard,
      // ),

      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Gaamma Cards',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      // routes: AppRoutes.initpages,
      getPages: AppRoutes.pages,
   );} ));
  }
}
