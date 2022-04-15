import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/home/views/widget/mobile/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.colorPrimary,
          title: TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: " Search...",
              border: InputBorder.none,
            ),
            onChanged: (String query) {
              controller.performSearch(query);
            },
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
          centerTitle: true,
        ),
        body: GetBuilder(
            builder: (SearchController controller) => SingleChildScrollView(
                child: Services())));
  }
}
