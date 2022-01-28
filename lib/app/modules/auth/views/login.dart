import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/modules/auth/controllers/auth_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Scaffold login(AuthController controller) {
  return Scaffold(
      body: ListView(
    children: [
      Container(
        margin: EdgeInsets.all(32),
        child: Column(
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
                ),
                keyboardType: TextInputType.phone,
                onChanged: (num) {
                  controller.isValidPhoneNumber.value =
                      GetUtils.isPhoneNumber(num);
                },
              ),
            ),
            SizedBox(height: 8),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  obscureText: controller.obscurePassword.value,
                  controller: controller.passwordFieldController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.obscurePassword.value =
                            !controller.obscurePassword.value;
                      },
                      icon: Icon(controller.obscurePassword.value
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined),
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (num) {},
                )),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                     controller.switchPage(AuthPages.FORGOT_PASSWORD);
                  },
                  child: Text('forgot password?')),
              ],
            ),
            SizedBox(height: 20),
            Obx(() {
              return Container(
                width: double.infinity,
                child: controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        color: MyColors.colorPrimary,
                      ))
                    : ElevatedButton(
                        onPressed: () async {
                          controller.isLoading.value =
                              !controller.isLoading.value;
                          String response = await controller.login();
                          if (response == SUCCESS_MSG) {
                            Get.offAndToNamed(Routes.HOME);
                          } else {
                            controller.isLoading.value =
                                !controller.isLoading.value;
                            Get.showSnackbar(GetBar(
                                isDismissible: true,
                                duration: Duration(seconds: 2),
                                message: response));
                          }
                        },
                        style: MyButtonStyle.submitButton,
                        child: Text('Login')),
              );
            }),
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
                Text('Don\'t have an account?'),
                SizedBox(width: 2),
                InkWell(
                    onTap: () {
                      controller.switchPage(controller.lastPage.value);
                    },
                    child: Text('Register')),
              ],
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    ],
  ));
}
