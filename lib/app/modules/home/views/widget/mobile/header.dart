import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/location/controllers/location_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getHeader() {
  print("GET HEADER CALLED");
  LocationController locationController = Get.find();
  
  
  return FlexibleSpaceBar(
      background: Container(
          color: MyColors.colorPrimary,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Location for service',
                      style: MyTextStyle.textWhiteMedium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white),
                        Obx(() {
                          return Text(locationController.currentLocation.value,
                              style: MyTextStyle.textWhiteLargeBold);
                        }),
                        SizedBox(width: 14),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.LOCATION);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                'change',
                                style: MyTextStyle.textWhiteSmall,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      transform: Matrix4.translationValues(0.0, 25.0, 0.0),
                      color: Colors.grey[50],
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            border: Border.all(color: Color(0xffeeeeee)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search Here',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ],
          )));
}
