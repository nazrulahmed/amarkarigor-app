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
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffeeeeee), width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Profile', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffeeeeee), width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.chat),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Feedback', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )),
          ],
        ));
  }
}
