part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const LANDING_PAGE = _Paths.LANDING_PAGE;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const LOCATION = _Paths.LOCATION;
  static const CATEGORY = _Paths.CATEGORY;
  static const BOOKING = _Paths.BOOKING;
}

abstract class _Paths {
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const LANDING_PAGE = '/landing-page';
  static const SPLASH_SCREEN = '/splash-screen';
  static const LOCATION = '/location';
  static const CATEGORY = '/category';
  static const BOOKING = '/booking';
}
