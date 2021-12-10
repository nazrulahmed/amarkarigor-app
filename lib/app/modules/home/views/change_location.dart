import 'package:amar_karigor/app/modules/home/model/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ChangeLocationView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return SizedBox();
          } else {
            if (controller.countries.length > 1) {
              return selectCountry(controller.countries);
            } else {
              List cities = controller.countries[0].cities;
              if (cities.length > 0) {
                return selectCity(cities);
              } else {
                List areas = cities[0].areas;
              }
            }
          }
        },
      ),
    );
  }

  selectArea(List area){
     return Column(
      children: [
        searchBar(),
        Container(
            child: Expanded(
          child: ListView.builder(
              itemCount: area.length,
              itemBuilder: (context, index) {
                return locationItem(area[index]);
              }),
        )),
      ],
    );

  }
  selectCity(List city){
    return Column(
      children: [
        searchBar(),
        Container(
            child: Expanded(
          child: ListView.builder(
              itemCount: city.length,
              itemBuilder: (context, index) {
                return locationItem(city[index]);
              }),
        )),
      ],
    );

  }
  selectCountry(List countries) {
    return Column(
      children: [
        searchBar(),
        Container(
            child: Expanded(
          child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return locationItem(countries[index]);
              }),
        )),
      ],
    );
  }

  locationItem(Country country) {
    return ListTile(
        leading: Icon(Icons.location_on), title: Text(country.name));
  }

  Widget searchBar() {
    return Container(child: TextFormField());
  }
}
