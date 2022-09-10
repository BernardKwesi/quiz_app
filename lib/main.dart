import 'package:flutter/material.dart';
import 'package:quiz_app/bindings/initial_binding.dart';
import 'package:quiz_app/data_uploader_screen.dart';
import 'package:quiz_app/routes/app_routes.dart';

import 'config/themes/app_light_theme.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      home: DataUploaderScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
} */

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      debugShowCheckedModeBanner: true,
      getPages: AppRoutes.routes(),
    );
  }
}
