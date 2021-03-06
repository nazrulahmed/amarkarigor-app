import 'package:amar_karigor/app/modules/more/views/feedback.dart';
import 'package:amar_karigor/app/modules/payment/views/payment_decline.dart';
import 'package:get/get.dart';

import 'package:amar_karigor/app/modules/auth/bindings/auth_binding.dart';
import 'package:amar_karigor/app/modules/auth/views/auth_view.dart';
import 'package:amar_karigor/app/modules/booking/bindings/booking_binding.dart';
import 'package:amar_karigor/app/modules/booking/views/booking_details.dart';
import 'package:amar_karigor/app/modules/booking/views/booking_view.dart';
import 'package:amar_karigor/app/modules/category/bindings/category_binding.dart';
import 'package:amar_karigor/app/modules/category/views/category_view.dart';
import 'package:amar_karigor/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:amar_karigor/app/modules/checkout/views/booking_preview.dart';
import 'package:amar_karigor/app/modules/checkout/views/checkout_view.dart';
import 'package:amar_karigor/app/modules/home/bindings/home_binding.dart';
import 'package:amar_karigor/app/modules/home/views/home_view.dart';
import 'package:amar_karigor/app/modules/location/bindings/location_binding.dart';
import 'package:amar_karigor/app/modules/location/views/location_view.dart';
import 'package:amar_karigor/app/modules/more/bindings/more_binding.dart';
import 'package:amar_karigor/app/modules/more/views/more_view.dart';
import 'package:amar_karigor/app/modules/notifications/bindings/notification_binding.dart';
import 'package:amar_karigor/app/modules/notifications/views/notification_view.dart';
import 'package:amar_karigor/app/modules/payment/bindings/payment_binding.dart';
import 'package:amar_karigor/app/modules/payment/views/payment_complete.dart';
import 'package:amar_karigor/app/modules/payment/views/payment_view.dart';
import 'package:amar_karigor/app/modules/profile/bindings/profile_binding.dart';
import 'package:amar_karigor/app/modules/profile/views/profile_view.dart';
import 'package:amar_karigor/app/modules/profile/views/update_profile.dart';
import 'package:amar_karigor/app/modules/search/bindings/search_binding.dart';
import 'package:amar_karigor/app/modules/search/views/search_view.dart';
import 'package:amar_karigor/app/modules/service/bindings/service_binding.dart';
import 'package:amar_karigor/app/modules/service/views/service_view.dart';
import 'package:amar_karigor/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:amar_karigor/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:amar_karigor/app/modules/support/bindings/support_binding.dart';
import 'package:amar_karigor/app/modules/support/views/support_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE,
      page: () => ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_BOOKING_PREVIEW,
      page: () => BookingPreview(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_DETAILS,
      page: () => BookingDetails(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_COMPLETE,
      page: () => PaymentComplete(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DECLINE,
      page: () => PaymentDecline(),
      binding: PaymentBinding(),
    ),
  
    GetPage(
      name: _Paths.SUPPORT,
      page: () => SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => FeedBackView(),
      binding: MoreBinding(),
    ),
  ];
}
