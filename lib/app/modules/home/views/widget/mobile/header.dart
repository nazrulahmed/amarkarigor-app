import 'package:amarkarigor/app/global/config/app_style.dart';
import 'package:flutter/material.dart';

Widget getHeader(BoxConstraints constraints) {
  return Container(
     
      color: MyColors.colorPrimary,
      height: constraints.maxHeight*.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [Text('Location for service',style:MyTextStyle.textWhiteMedium,),
          SizedBox(height: 4,),
          Row(children: [
            Icon(Icons.location_on,color:Colors.white), SizedBox(width:8),
            Text('Sylhet, Bangladesh',style:MyTextStyle.textWhiteLargeBold)
          ],)],
        ),
      ));
}

Container tagItem(String tag) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: MyColors.colorPrimary,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
        child: Center(
          child: Text(
            tag,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )),
  );
}
