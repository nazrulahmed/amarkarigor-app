import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget phoneNumber(AuthController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/ak_vertical.png', height: 250),
      SizedBox(height: 8),
      Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            controller: controller.phoneInputFieldController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: InputBorder.none,
                hintText: 'Phone',
                prefix: Text('+880')),
            keyboardType: TextInputType.phone,
            onChanged: (num) {
              controller.isValidPhoneNumber.value = GetUtils.isPhoneNumber(num);
            },
          )),
      SizedBox(height: 20),
      Container(
        width: double.infinity,
        child: controller.isWaitingForOTP.value
            ? Center(
                child: CircularProgressIndicator(
                color: MyColors.colorPrimary,
              ))
            : ElevatedButton(
                onPressed: controller.isValidPhoneNumber.value
                    ? () {
                        controller.toggleOTPIndicator();
                      
                          controller.phoneSignIn("+880" +
                              controller.phoneInputFieldController.text);
                        
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: MyColors.colorPrimary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                child: Text('Register')),
      ),
      SizedBox(
        height: 12,
      ),
      Center(child: Text('or')),
      SizedBox(
        height: 12,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?'),
          SizedBox(width: 2),
          InkWell(
              onTap: () {
                controller.switchPage(AuthPages.LOGIN);
              },
              child: Text('Login')),
        ],
      )
    ],
  );
}
