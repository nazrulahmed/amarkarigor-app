import 'dart:collection';

import 'package:amar_karigor/app/global/data/providers/profile_provider.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileProvider _profileProvider = ProfileProvider();

  var isLoading = false.obs;
  TextEditingController nameInputFieldController = TextEditingController();
  TextEditingController addressInputFieldController = TextEditingController();
  TextEditingController emailInputFieldController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
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

  void updateInfo() {
    Map<String, dynamic> userInfo = {
      'token': LocalData.user!.token,
      'name': nameInputFieldController,
      'address': addressInputFieldController,
      'email': emailInputFieldController
    };
    _profileProvider.updateProfile(userInfo);
  }
}
