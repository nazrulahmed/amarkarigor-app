import 'package:hive/hive.dart';
part 'my_booking_data.g.dart';

@HiveType(typeId: 0)
class MyBookingData extends HiveObject {
  @HiveField(0)
  Map<String, dynamic> bookedService;
  @HiveField(1)
  String bookingDate;
  @HiveField(2)
  String bookingTime;

  MyBookingData(this.bookedService, this.bookingDate, this.bookingTime);
}
