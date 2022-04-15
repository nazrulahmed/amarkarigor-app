import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:get/get.dart';
import '../../../../../global/config/api.dart';
import '../../../controllers/home_controller.dart';

class Services extends StatelessWidget {
   final CustomShimmer customShimmer = CustomShimmer();
  final HomeController homeController = Get.find();


  @override
  Widget build(BuildContext context) {
      return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Services'),
      ),
      Container(
          child: homeController.services.length == 0
              ? ListView.builder(
                  
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return customShimmer.multiShimmerContainer([
                      customShimmer.getShimmerFromColor(width: 60, height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customShimmer.getShimmerFromColor(
                              width: 20,
                              height: 10,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: 20,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: 20,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                        ],
                      ),
                    ]);
                  })
              : ListView.builder(
                  itemCount: homeController.services.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return service(homeController.services[index]);
                  })),
    ],
  );

  }
}


Widget service(Service service) {
  return InkWell(     
    onTap: ()=> Get.toNamed(Routes.SERVICE,arguments: service) ,
    child: Container(
      child: Card(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.green[50],
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: kIsWeb
                            ? ci.CustomImage(
                                service.name,
                                '${Api.assets_url}${Api.services_icon}${service.icon}',
                                40,
                                40)
                            : Image.network(
                                '${Api.assets_url}${Api.services_icon}${service.icon}',
                                height: 40,
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '৳ ${service.price}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ]),
          ],
        ),
      ),
    ),
  );
}
