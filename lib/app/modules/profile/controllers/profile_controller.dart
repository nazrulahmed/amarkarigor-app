import 'dart:convert';

import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/global/data/providers/profile_provider.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileProvider _profileProvider = ProfileProvider();

  var isLoading = false.obs;
  TextEditingController nameInputFieldController = TextEditingController();
  TextEditingController addressInputFieldController = TextEditingController();
  TextEditingController emailInputFieldController = TextEditingController();
  TextEditingController phoneInputFieldController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    User user = LocalData.user!;
    print('user address is : ${user.address}');
    nameInputFieldController.text = user.firstName ?? '';
    addressInputFieldController.text = user.address ?? '';
    emailInputFieldController.text = user.email ?? '';
    phoneInputFieldController.text = user.phone ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String generateErrorMsg(String msg) {
    return "          $msg\n";
  }

  void updateInfo() async {
    Map<String, dynamic> userInfo = {
      'uid': LocalData.user!.uid,
      'token': LocalData.user!.token,
      'name': nameInputFieldController.text,
      'address': addressInputFieldController.text,
      'email': emailInputFieldController.text
    };
    http.Response response = await _profileProvider.updateProfile(userInfo);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true && data['response'] == 'success') {
        print("IF");
        await Get.showSnackbar(GetBar(
            isDismissible: true,
            duration: Duration(seconds: 2),
            message: "successfully updated."));
        Get.back();

      } else {
        print("else");

        await Get.showSnackbar(GetBar(
            isDismissible: true,
            duration: Duration(seconds: 2),
            message: data['response']));
      }
    }
  }
}
