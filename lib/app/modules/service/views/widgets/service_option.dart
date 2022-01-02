import 'dart:convert';

import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

Widget serviceOption(ServiceController controller) {
  controller.optionControllers.clear();
  controller.optionValues.clear();
  final option = controller.service.option;
  List<Widget> optionWidgets = [];
  var optionValues;
  if (option != null) {
    optionValues = jsonDecode(option);

    for (var value in optionValues) {
      optionWidgets.add(SizedBox(
        height: 8,
      ));
      optionWidgets.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          value['label'],
          style: MyTextStyle.textBlackLargeBold,
        ),
      ));
      if (value['field_type'] == FILED_SLIDER) {
        int extraCostApplicableFrom = value['extra_cost_applicable_from'];
        double extraCostPerUnit = value['extra_cost_per_unit'].toDouble();
        List<String> fieldValues = value['value'].toString().split(',');
        List<int> numberValues = fieldValues.map(int.parse).toList();
        numberValues.sort();
        if(extraCostApplicableFrom==numberValues[0]){
         controller.totalPrice.value = controller.service.price +
                        extraCostPerUnit;
        }
        controller.optionControllers.add(RxInt(numberValues[0]));
        controller.optionValues.add({value['label']: numberValues[0]});
        int sliderValueIndex = controller.optionControllers.length - 1;
        RxInt sliderCurrentValue =
            controller.optionControllers[sliderValueIndex];

        optionWidgets.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () {
              return SfSlider(
                min: numberValues[0],
                max: numberValues[numberValues.length - 1],
                value: sliderCurrentValue.value,
                interval: (numberValues[1]-numberValues[0]).toDouble(),
                showLabels: true,
                enableTooltip: true,
                onChangeEnd: (sliderValue) {
                  int currentValue = sliderValue.toInt();
                  controller.optionControllers[sliderValueIndex].value =
                      currentValue;
                  controller.optionValues[sliderValueIndex][value['label']] =
                      currentValue;

                  if (currentValue >= extraCostApplicableFrom) {
                    controller.totalPrice.value = controller.service.price +
                        ((currentValue-extraCostApplicableFrom+1) * extraCostPerUnit);
                  } else {
                    controller.totalPrice.value = controller.service.price;
                  }
                },
                onChanged: (sliderValue) {int currentValue = sliderValue.toInt();
                  controller.optionControllers[sliderValueIndex].value =
                      currentValue;},
              );
            },
          ),
        ));
        optionWidgets.add(Divider());
      } else if (value['field_type'] == FILED_RADIO) {
        List<String> fieldValues = value['value'].toString().split(',');
        controller.optionControllers.add(RxString(fieldValues[0]));
        int radioIndex = controller.optionControllers.length - 1;
        controller.optionValues.add({value['label']: fieldValues[0]});

        for (String radioValue in fieldValues) {
          optionWidgets.add(
            Obx(
              () => ListTile(
                title: Text(radioValue),
                leading: Radio(
                  value: radioValue,
                  groupValue: controller.optionControllers[radioIndex].value,
                  onChanged: (radioValue) {
                    controller.optionControllers[radioIndex].value = radioValue;
                    controller.optionValues[radioIndex][value['label']] =
                        radioValue;
                  },
                  activeColor: Colors.green,
                ),
              ),
            ),
          );
        }

        optionWidgets.add(Divider());
      } else if (value['field_type'] == FILED_DROPDOWN) {
        List<String> fieldValues = value['value'].toString().split(',');
        controller.optionControllers.add(RxString(fieldValues[0]));
        int dropDownIndex = controller.optionControllers.length - 1;
        controller.optionValues.add({value['label']: fieldValues[0]});

        optionWidgets.add(
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                    underline: DropdownButtonHideUnderline(child: Container()),
                    value: controller.optionControllers[dropDownIndex].value,
                    isExpanded: true,
                    items: fieldValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      controller.optionControllers[dropDownIndex].value = val;
                      controller.optionValues[dropDownIndex][value['label']] =
                          val;
                    },
                  ),
                ),
              )),
        );

        optionWidgets.add(Divider());
      } else {
        controller.optionControllers.add(RxString(""));
        controller.optionValues.add({value['label']: ""});
        int textFiledControllerIndex = controller.optionControllers.length - 1;

        optionWidgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffeeeeee)),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    onChanged: (val) {
                      controller.optionControllers[textFiledControllerIndex]
                          .value = val;
                      controller.optionValues[textFiledControllerIndex]
                          [value['label']] = val;
                    },
                    decoration: InputDecoration(
                      hintText: value['value'],
                      border: InputBorder.none,
                    ),
                  ),
                )),
          ),
        );

        optionWidgets.add(Divider());
      }
    }
  }
  return optionValues == null
      ? Container()
      : Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: optionWidgets,
          ),
        );
}
