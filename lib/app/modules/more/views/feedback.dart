import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/appbar.dart';
import 'package:amar_karigor/app/modules/more/controllers/more_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackView extends GetView<MoreController> {
  const FeedBackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text('Feedback'),
            ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: kIsWeb
                ? MediaQuery.of(context).size.width * .6
                : double.infinity,
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                kIsWeb ? CustomAppBar() : SizedBox(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Share your thoughts and feelings with us!',
                  style: MyTextStyle.textBlackLargerBold,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!)),
                  child: TextFormField(
                    controller: controller.feedbackController,
                    maxLines: 50,
                    minLines: 8,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write your feedback here",
                        contentPadding: EdgeInsets.all(16)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  height: 50,
                  child: Obx(() => controller.isSubmittingFeedBack.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (controller.feedbackController.text
                                .trim()
                                .isEmpty) {
                              Get.showSnackbar(GetBar(
                                message: "Please write your feedback!",
                                duration: Duration(seconds: 2),
                              ));
                              return;
                            }
                            controller.isSubmittingFeedBack(true);
                            String response = await controller.writeFeedback();
                            controller.isSubmittingFeedBack(false);
                            Get.showSnackbar(GetBar(
                              message: response,
                              duration: Duration(seconds: 2),
                            ));
                          },
                          child: Text('Submit'),
                        )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
