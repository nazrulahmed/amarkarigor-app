import 'package:amarkarigor/app/global/config/app_color.dart';
import 'package:flutter/material.dart';

Widget getTags(List tags,constraints) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      height: 36.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            return tagItem(tags[index]);
          }));
}

Container tagItem(String tag) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: colorPrimary,
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
