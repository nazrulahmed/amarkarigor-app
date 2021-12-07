import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget get_shimmer({required double height,required double width,double radius=0}) {
  return Container(
    margin: EdgeInsets.only(left: 12),
    height: height,
    width: width,
    child: Column(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.start,
      children: <Widget>[
        Shimmer.fromColors(
            baseColor: Color(0xffe5e5e5),
            highlightColor: Color(0xffeeeeee),
            enabled: true,
            child: Container(
              width: width,
              height:height,
              decoration:BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(radius)),
            )),
      ],
    ),
  );
}
