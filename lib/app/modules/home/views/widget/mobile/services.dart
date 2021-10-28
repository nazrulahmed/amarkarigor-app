import 'package:flutter/material.dart';

Widget getServices(List services,constraints) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Services'),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
          height: 200.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return service(services[index]);
              })),
    ],
  );
}

Widget service(String category) {
  return Container(
    width: 100,
    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
    child: Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Container(
          color: Colors.green[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
            'https://www.bajajallianz.com/content/dam/bagic/home-insurance/My-Home-Insurance.png',
            height: 80,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      )
    ]),
  );
}
