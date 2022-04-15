import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:flutter/material.dart';

import 'menu_item.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/ak_horizontal.png",
            height: 50,
            alignment: Alignment.topCenter,
          ),

          Spacer(),
          MenuItem(
            title: "Home",
            press: () {},
          ),
          MenuItem(
            title: "about",
            press: () {},
          ),
          MenuItem(
            title: "Pricing",
            press: () {},
          ),
          MenuItem(
            title: "Contact",
            press: () {},
          ),
          MenuItem(
            title: "Login",
            press: () {},
          ),
          // ElevatedButton(
          //   child: Text('Book a service'),
          //   onPressed: () {},
          //   style: MyButtonStyle.submitButton,
          // ),
        ],
      ),
    );
  }
}
