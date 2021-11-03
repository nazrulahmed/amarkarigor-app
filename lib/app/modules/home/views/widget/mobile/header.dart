import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:flutter/material.dart';

Widget getHeader() {
  return Container(
      color: MyColors.colorPrimary,
      height: 112,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location for service',
              style: MyTextStyle.textWhiteMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white),
                Text('Sylhet, Bangladesh',
                    style: MyTextStyle.textWhiteLargeBold),
                       SizedBox(width:16),
                Container(
                  decoration:BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:4,horizontal:8),
                     child: Text(
                      'change',
                      style: MyTextStyle.textWhiteSmall,
                      
                    ),
                  ),
                ),
              
              ],
            ),
            Container(
                transform: Matrix4.translationValues(0.0, 27, 0.0),
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(color:Color(0xffeeeeee)),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right:8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Here',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyColors.colorPrimary,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/search_icon.png',height: 20,width: 20,),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ));
}
