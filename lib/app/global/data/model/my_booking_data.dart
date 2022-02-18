import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:hive/hive.dart';
part 'my_booking_data.g.dart';

@HiveType(typeId: 0)
class MyBookingData extends HiveObject {
  @HiveField(0)
  Map<String, dynamic>  service;
  @HiveField(1)
  Map<String, dynamic> bookedService;
  @HiveField(2)
  double totalPrice;
  @HiveField(3)
  String bookingDate;
  @HiveField(4)
  String bookingTime;

  MyBookingData(this.service, this.bookedService, this.totalPrice,
      this.bookingDate, this.bookingTime);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'service_id': service['id'],
      'selected_attributes': bookedService.toString(),
      'total_price': totalPrice,
      'booking_date': bookingDate,
      'booking_time': bookingTime
    };
  }
}
