import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('More'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,8.0,8,0),
              child: Text('Profile', style: TextStyle(fontSize: 16)),
            ),
            Divider(),
          ],
        ));
  }
}
