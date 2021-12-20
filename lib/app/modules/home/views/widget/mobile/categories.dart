import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:amar_karigor/app/global/model/category.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../../../global/config/api.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

Widget getCategories(List<Category> categories) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Categories'),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
          height: 100.0,
          child: categories.length == 0
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CustomShimmer().getShimmerFromColor(
                        width: 150,
                        height: 150,
                        radius: 12,
                        margin: EdgeInsets.only(left: 8));
                  })
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return category(categories[index]);
                  })),
    ],
  );
}

Widget category(Category category) {
  return InkWell(
    onTap: () {
      Get.toNamed(Routes.CATEGORY,
          arguments: {"id": category.id, "name": category.name});
    },
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: MyColors.colorPrimary, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 120,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: kIsWeb
                ? ci.CustomImage(
                    category.name,
                    '${Api.assets_url}${Api.categories_icon}${category.icon}',
                    40,
                    40)
                : Image.network(
                    '${Api.assets_url}${Api.categories_icon}${category.icon}',
                    height: 40,
                    color: MyColors.colorPrimary,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MyColors.colorPrimary),
            ),
          )
        ])),
  );
}
