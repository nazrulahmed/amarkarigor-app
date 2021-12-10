import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:flutter/material.dart';

Widget getServices(List services) {
  CustomShimmer customShimmer = CustomShimmer();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Services'),
      ),
      Container(
          child: services.length == 0
              ? ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    // return get_shimmer(
                    //   height: 100, width: 150,
                    //   shimmerRowItems: [
                    // CustomShimmerRowItem(70, 70),
                    // CustomShimmerRowItem(15, 400,
                    //     margin: EdgeInsets.only(left:4),
                    //     items:
                    //       Column(
                    //         children: [
                    //           get_shimmer(height: 10, width: 400)

                    //         ],
                    //       )
                    //     )
                    //   ],

                    // );
                    return customShimmer.multiShimmerContainer([
                      customShimmer.getShimmerFromColor(width:60,height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customShimmer.getShimmerFromColor(width:400, height:10,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(width:380, height:8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(width:380,height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                        ],
                      ),
                    ]);
                  })
              : ListView.builder(
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
