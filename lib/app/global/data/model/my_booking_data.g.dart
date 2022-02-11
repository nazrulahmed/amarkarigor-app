// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyBookingDataAdapter extends TypeAdapter<MyBookingData> {
  @override
  final int typeId = 0;

  @override
  MyBookingData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyBookingData(
      fields[0] as Service,
      (fields[1] as Map).cast<String, dynamic>(),
      fields[2] as double,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyBookingData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.service)
      ..writeByte(1)
      ..write(obj.bookedService)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.bookingDate)
      ..writeByte(4)
      ..write(obj.bookingTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyBookingDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
