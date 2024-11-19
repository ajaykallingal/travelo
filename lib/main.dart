import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'config/router.dart';
import 'constants/app_theme.dart';
import 'constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  ///Setting status bar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.statusBarColor,
      statusBarBrightness: Brightness.light));

  ///Setting device orientation as portrait, then calling the runApp method
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_) {
    runApp(
       const App(),
    );
  });
}



