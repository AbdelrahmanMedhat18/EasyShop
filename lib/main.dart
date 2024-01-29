import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:handling/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:handling/utils/my_string.dart';
import 'firebase_options.dart';
import 'language/localization.dart';


  void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      translations: LocaliztionApp(),
      title: 'Easy Shop',
      initialRoute: AppRoutes.splashScreen,
      // initialRoute: FirebaseAuth.instance.currentUser != null ||
      //     GetStorage().read<bool>('auth') == true
      //     ? AppRoutes.mainScreen
      //     : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}

