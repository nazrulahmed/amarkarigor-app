import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/booking/controllers/booking_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../global/util/platform_helper.dart';
import '../controllers/payment_controller.dart';

class PaymentComplete extends GetView<PaymentController> {
  final BookingController bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: isDesktopView(context)
              ? MediaQuery.of(context).size.width * .5
              : double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              SvgPicture.asset(
                'assets/icons/booking_success.svg',
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Booking confirmed',
                  style: TextStyle(
                      color: MyColors.colorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Booking ref. AK-000${controller.bookingId}',
                  style: TextStyle(
                      color: MyColors.colorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'You will receive an confirmation email along with your booking details.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              controller.isLoading(true);
                              Get.put(BookingController());

                              Get.offAllNamed(Routes.HOME);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text('Home'),
                            ),
                            style: MyButtonStyle.submitButton,
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
