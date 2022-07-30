import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class MoreView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('More'),
        ),
        body: Container(

          child: ListView(
            children: [

              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffeeeeee), width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.person,size: 36,),
                          SizedBox(
                            width: 16,
                          ),
                          Text('Profile', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: (){
                    Get.toNamed(Routes.FEEDBACK);
                },
                child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffeeeeee), width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.chat),
                          SizedBox(
                            width: 16,
                          ),
                          Text('Feedback', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    )),
              ),
             GestureDetector(
                onTap: ()async {
                  if(await controller.logout()){
                    Get.offAndToNamed(Routes.AUTH);
                  }

                },
                child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffeeeeee), width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.subdirectory_arrow_left_sharp),
                          SizedBox(
                            width: 16,
                          ),
                          Text('Logout', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    )),
              ),

            ],
          ),
        ));
  }
}
