import 'package:amar_karigor/app/modules/category/views/widget/tags.dart';
import 'package:amar_karigor/app/modules/home/views/widget/mobile/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(controller.categoryName.value);
        }),
      ),
      body: GetBuilder(builder: (CategoryController controller) {
          return ListView(
            children: [
              tags(controller.subCategories),
              getServices(controller.servicesInCategory,context),
              
            ],
          );
        }),
    );
  }
}
