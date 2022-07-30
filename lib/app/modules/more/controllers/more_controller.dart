import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/modules/more/provider/feedback_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MoreController extends GetxController {

  final FeedBackProvider _feedBackProvider = FeedBackProvider();
  final RxBool isSubmittingFeedBack = false.obs;
  final TextEditingController feedbackController = TextEditingController();

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

  Future<String> writeFeedback()async {
    try {
      http.Response response = await _feedBackProvider.writeFeedback(
          feedbackController.text);
      if (response.statusCode == 200) {

      }
    }catch(e){
      return FAILED_MSG;
    }
    return FAILED_MSG;  }
}
