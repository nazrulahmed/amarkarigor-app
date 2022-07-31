import 'dart:convert';

import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  final amount;
  final bookingId;
  final categoryId;
  final serviceName;

  CustomWebView(this.bookingId, this.amount, this.serviceName, this.categoryId);

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  bool isLoaded = false;

  final User user = LocalData.user!;

  final DatabaseReference bookingRef = FirebaseDatabase.instance.ref('booking');

  @override
  Widget build(BuildContext context) {
    String payload = "{\"token\":\"80535d79-b11a-447e-b9b4-1b941c2a3a6f\","
        "\"booking_id\":${widget.bookingId},\"uid\":${user.uid},"
        "\"amount\":${widget.amount},\"cus_name\":\"${user.firstName}\","
        "\"cus_email\":\"${user.email}\",\"cus_phone\":\"${user.phone}\","
        "\"cus_address\":\"${user.address}\",\"service_name\":\"${widget.serviceName}\"}";

    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(payload);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: "${Api.ssl_payment_url}payment/ssl_commerz?payload=" +
                  encoded,
              onPageStarted: (String url) {
                if (url.contains('api/v1/payment/cancel')) {
                  Get.back();
                }
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoaded = true;
                });
                if (url.contains('api/v1/payment/ssl_payment_success')) {
                  sendToWorkerApp();
                  Get.toNamed(Routes.PAYMENT_COMPLETE);
                } else if (url.contains("cancel")) {
                  Get.back();
                }
              },
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {},
              onProgress: (int progress) {},
            ),
            isLoaded
                ? SizedBox()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: Text(
                          'Please wait...',
                          style: MyTextStyle.textBlackLargeBold,
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void sendToWorkerApp() {
    bookingRef
        .child("cid-${widget.categoryId}")
        .child("bid-${widget.bookingId}")
        .set({
      "bid": widget.bookingId.toString(),
      "current_status": 1,
      "receiver_id": "-1",
      "uid": int.parse(LocalData.user!.uid)
    });
  }
}
