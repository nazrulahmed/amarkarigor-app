import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../home/views/mobile.dart';
import '../../home/views/desktop.dart';
import 'widget/mobile/appbar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: !kIsWeb
            ? MyAppbar()
            : AppBar(
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
        drawer: Drawer(
          child: ListView(
            children: [Text('hi')],
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constrains) {
            return kIsWeb
                ? getMobileView(controller, constrains)
                : getMobileView(controller, constrains);
          }),
        ));
  }
}
