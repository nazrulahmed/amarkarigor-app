import 'dart:io';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/global/config/app_style.dart';
import 'app/routes/app_pages.dart';
import 'app/global/config/configure_nonweb.dart'
if (dart.library.html) 'app/global/config/configure_web.dart';
    
void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  Hive.initFlutter();
  Hive.registerAdapter(MyBookingDataAdapter());
  Hive.registerAdapter(ServiceAdapter());
  

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
          appBarTheme: AppBarTheme(
            color: MyColors.colorPrimary,
          )),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}



