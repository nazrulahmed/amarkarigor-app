import 'package:flutter/material.dart';

const double desktopWindowIdealSize = 1200;
bool isDesktopView(BuildContext context) {
  return MediaQuery.of(context).size.width >= desktopWindowIdealSize;
}
