import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/home/views/widget/mobile/header.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSize{
  const MyAppbar({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color:MyColors.colorPrimary,
      child:   Column(
        children: [
          AppBar(
                    title: Text('Amar Karigor'),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 32,
                            ),
                            Positioned(
                                right: 0,
                                child: new Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: new BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 12,
                                  ),
                                  child: new Text(
                                    '5',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                    elevation: 0,
                  ),
       getHeader(),
        ],
      ),
       
    );
  }

  @override
  
  Widget get child => Text('');

  @override
  Size get preferredSize =>  Size(double.infinity,170);
}
