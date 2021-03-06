import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/booking/controllers/booking_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../global/util/platform_helper.dart';
import '../controllers/payment_controller.dart';

class PaymentDecline extends GetView<PaymentController> {
  final BookingController bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: isDesktopView(context)?MediaQuery.of(context).size.width*.5:double.infinity,
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              SvgPicture.asset(
                'assets/icons/booking_cancel.svg',
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
             
              Center(
                child: Text(
                  'Your booking has been cancelled',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Sorry, your booking has been cancelled. However you can find this booking in your booking incomplete section.',
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
                  child: ElevatedButton(
                    onPressed: () async{
                      await bookingController.getBookings(1);
                      await bookingController.getBookings(2);
                      
                      Get.offAllNamed(Routes.HOME);
                    },
                    child: Text('Home'),
                    style: MyButtonStyle.submitButton,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
