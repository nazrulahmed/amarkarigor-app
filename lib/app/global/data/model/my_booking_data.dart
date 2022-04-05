import 'package:hive/hive.dart';
part 'my_booking_data.g.dart';

@HiveType(typeId: 0)
class MyBookingData extends HiveObject {
  @HiveField(0)
  Map<String, dynamic>  service;
  @HiveField(1)
  String selectedOptions;
  @HiveField(2)
  double totalPrice;
  @HiveField(3)
  String bookingDate;
  @HiveField(4)
  String bookingTime;

  MyBookingData(this.service, this.selectedOptions, this.totalPrice,
      this.bookingDate, this.bookingTime);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'service_id': service['id'],
      'service_name': service['name'],
      'service_icon': service['icon'],
      'selected_attributes': selectedOptions.toString(),
      'total_price': totalPrice,
      'booking_date': bookingDate,
      'booking_time': bookingTime
    };
  }
}
