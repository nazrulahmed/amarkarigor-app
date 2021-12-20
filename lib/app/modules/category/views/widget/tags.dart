import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/model/sub_category.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/category_controller.dart';

Widget tags(List<SubCategory> subCategories) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
      height: 40.0,
      child: subCategories.length == 0
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return CustomShimmer().getShimmerFromColor(
                    width: index == 0 ? 50 : 100,
                    height: 30,
                    radius: 8,
                    margin: EdgeInsets.only(left: 8));
              })
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subCategories.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      chip(SubCategory(0, 'All', null)),
                      chip(subCategories[index])
                    ],
                  );
                }
                return chip(subCategories[index]);
              }));
}

Widget chip(SubCategory subCategory) {
  CategoryController categoryController = Get.find();
  return GestureDetector(
      onTap: () {
        categoryController.changeSelectedSubCategory(subCategory.id);
      },
      child: Container(
          decoration: BoxDecoration(
            color: categoryController.selectedSubCategoryId == subCategory.id
                ? MyColors.colorPrimary
                : Colors.white,
            border: Border.all(
                color: MyColors.colorPrimary, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Center(
              child: Padding(
            padding: subCategory.id == 0
                ? const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 8.0, bottom: 8.0)
                : const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
            child: Text(subCategory.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      categoryController.selectedSubCategoryId == subCategory.id
                          ? Colors.white
                          : Colors.black,
                )),
          ))));
}
