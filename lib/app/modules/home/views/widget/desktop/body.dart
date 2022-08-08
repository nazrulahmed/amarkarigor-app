import 'package:amar_karigor/app/modules/home/views/widget/mobile/imports.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Container(
          width: 1200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Offers(),
              Categories(),
              Services(),
            ],
          ),
        ),
      ),
    );
  }
}
