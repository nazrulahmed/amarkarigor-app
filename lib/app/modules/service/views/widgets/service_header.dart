import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/widget/custom_dialog.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget serviceHeader(ServiceController controller) {
  CustomShimmer customShimmer = CustomShimmer();
  if (controller.service == null) {
    return Container(
        height: 700,
        width: double.infinity,
        child: ListView(children: [
          customShimmer.getShimmerFromColor(
              height: 150, width: double.infinity, margin: EdgeInsets.all(8)),
          customShimmer.getShimmerFromColor(
              height: 50, width: double.infinity, margin: EdgeInsets.all(8)),
          customShimmer.getShimmerFromColor(
              height: 50, width: double.infinity, margin: EdgeInsets.all(8)),
          customShimmer.getShimmerFromColor(
              height: 50, width: double.infinity, margin: EdgeInsets.all(8)),
          customShimmer.getShimmerFromColor(
              height: 50, width: double.infinity, margin: EdgeInsets.all(8))
        ]));
  } else {
    return Stack(
      children: [
        Container(
            height: 200,
            width: double.infinity,
            child:
                Image.asset('assets/images/clean_bg.png', fit: BoxFit.cover)),
        Container(
          color: Colors.black45,
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(controller.service!.name,
                    style: MyTextStyle.textWhiteExtraLargeBold),
                RichText(
                  text: new TextSpan(
                      text: controller.service!.description.length > 150
                          ? controller.service!.description.substring(0, 150)
                          : controller.service!.description,
                      style: MyTextStyle.textWhiteMedium,
                      children: [
                        new TextSpan(
                          text: controller.service!.description.length > 150
                              ? '... Read more'
                              : '',
                          style: MyTextStyle.textWhiteMediumBold,
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () async => await customDialog(
                                controller.service!.name,
                                controller.service!.description),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' Start from \$${controller.service!.price}',
                    style: MyTextStyle.textWhiteMedium),
              )),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8))),
              child: InkWell(
                onTap: () => controller.servicePage == ServicePages.SERVICE_TIME
                    ? controller.prevPage()
                    : Get.back(),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
