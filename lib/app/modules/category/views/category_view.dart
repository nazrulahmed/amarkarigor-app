import 'package:amar_karigor/app/modules/category/views/widget/tags.dart';
import 'package:amar_karigor/app/modules/home/views/widget/mobile/category_services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/util/platform_helper.dart';
import '../../home/views/widget/desktop/appbar.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isDesktopView(context)
          ? null
          : AppBar(
              title: Obx(() {
                return Text(controller.categoryName.value);
              }),
            ),
      body: GetBuilder(builder: (CategoryController controller) {
        return Center(
          child: Container(
            decoration: kIsWeb
                ? BoxDecoration(
                    border: Border.all(color: Color(0xffeeeeee), width: 1),
                  )
                : null,
            width: kIsWeb
                ? MediaQuery.of(context).size.width * .6
                : double.infinity,
            height: kIsWeb ? 900 : double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  isDesktopView(context)?CustomAppBar():SizedBox(),
                  isDesktopView(context)
                      ? Obx(() => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.categoryName.value,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24),
                            ),
                          ))
                      : SizedBox(),
                  tags(controller.subCategories),
                  CategoryServices(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
