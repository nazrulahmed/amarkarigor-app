import 'package:amar_karigor/app/modules/auth/bindings/auth_binding.dart';
import 'package:amar_karigor/app/modules/auth/views/auth_view.dart';
import 'package:amar_karigor/app/modules/home/bindings/home_binding.dart';
import 'package:amar_karigor/app/modules/home/views/home_view.dart';
import 'package:amar_karigor/app/modules/landing_page/bindings/landing_page_binding.dart';
import 'package:amar_karigor/app/modules/landing_page/views/landing_page_view.dart';
import 'package:amar_karigor/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:amar_karigor/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
