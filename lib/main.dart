import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/global/config/app_style.dart';
import 'app/routes/app_pages.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';


void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "Amar Karigor",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: MyColors.colorPrimary,
              secondary: MyColors.colorPrimary,
            ),
      ),
    ),
  );
}
