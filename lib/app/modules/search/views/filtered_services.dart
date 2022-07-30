import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:amar_karigor/app/modules/search/controllers/search_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:get/get.dart';

class FilteredServices extends GetView<SearchController> {
   final CustomShimmer customShimmer = CustomShimmer();


  @override
  Widget build(BuildContext context) {
      return Container(
          child: controller.isLoadingServices.value
              ? ListView.builder(

                  itemCount: 8,
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
                              width: 200,
                              height: 10,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: 180,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: 130,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                        ],
                      ),
                    ]);
                  })
              :  controller.services.length==0?
              Center(child: Column(
                children: [
                  SizedBox(height: 30,),
                  Icon(Icons.search,size: 90,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        'No data found!',
                        style: MyTextStyle.textBlackLargeBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),


                ],
              ))
              :ListView.builder(
                  itemCount: controller.services.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return service(controller.services[index]);
                  }));

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
