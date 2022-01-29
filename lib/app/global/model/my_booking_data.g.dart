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
      (fields[0] as Map).cast<String, dynamic>(),
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyBookingData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bookedService)
      ..writeByte(1)
      ..write(obj.bookingDate)
      ..writeByte(2)
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