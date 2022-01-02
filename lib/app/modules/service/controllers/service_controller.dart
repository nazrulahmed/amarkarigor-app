import 'package:amar_karigor/app/global/model/service.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  late final Service service;
  List optionControllers = [];
  List<Map<String, dynamic>> optionValues = [];
  var totalPrice = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    service = Get.arguments;
    totalPrice.value = service.price;
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
