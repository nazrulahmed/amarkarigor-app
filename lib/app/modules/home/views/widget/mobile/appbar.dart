import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/home/views/widget/mobile/imports.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appBar() {
  return SliverAppBar(
    expandedHeight: 175,
    floating: false,
    pinned: true,
    backgroundColor: MyColors.colorPrimary,
    title: Text('Amar Karigor'),
    actions: [
      InkWell(
        onTap:(){
          Get.toNamed(Routes.NOTIFICATION);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Icon(
                Icons.notifications,
                size: 32,
              ),
              1==2?Positioned(
                  right: 3,
                  bottom:12,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )):SizedBox(),
            ],
          ),
        ),
      )
    ],
    elevation: 0,
  flexibleSpace: getHeader());
}
