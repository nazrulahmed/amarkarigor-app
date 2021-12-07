import 'package:flutter/material.dart';

Widget getServices(List services) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Services'),
      ),
      Container(
          child: ListView.builder(
              itemCount: services.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return service(services[index]);
              })),
    ],
  );
}

Widget service(String category) {
  return Container(
    child: Card(
      child: Row(
        
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          color: Colors.green[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://www.bajajallianz.com/content/dam/bagic/home-insurance/My-Home-Insurance.png',
              height: 40,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    ),
  );
}
