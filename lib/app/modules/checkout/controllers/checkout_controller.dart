import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/model/my_booking_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CheckoutController extends GetxController {
  late Box bookingBox;
  List<MyBookingData> bookings = [];
  int consumerType = 1;
  var isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    bookingBox = await Hive.openBox(BOOKING_BOX_NAME);

    for (int i = 0; i < bookingBox.length; i++) {
      MyBookingData bookingData = bookingBox.getAt(i);
      bookings.add(bookingData);
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void updateProfile() {
    Get.toNamed(Routes.UPDATE_PROFILE);
  }

  void removeBooking(int index) {
    bookingBox.deleteAt(index);
    bookings.removeAt(index);
    update();
  }

  void setConsumerType(int value) {
    consumerType = value;
    update();
  }
}
