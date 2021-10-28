import 'package:flutter/material.dart';

Widget getCategories(List categories,constraints) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Categories'),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
          height: 120.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return category(categories[index]);
              })),
    ],
  );
}

Widget category(String category) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 150,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
          'https://www.bajajallianz.com/content/dam/bagic/home-insurance/My-Home-Insurance.png',height: 40,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        )
      ]));
}
