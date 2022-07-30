import 'package:flutter/material.dart';

const desktopWindowIdealSize = 768;
bool isDesktopView(BuildContext context) {
  return MediaQuery.of(context).size.width >= desktopWindowIdealSize;
}
