// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyMealModelAdapter extends TypeAdapter<WeeklyMealModel> {
  @override
  final int typeId = 3;

  @override
  WeeklyMealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyMealModel(
      meals: (fields[1] as List).cast<MealForTheDayEntity>(),
      date: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyMealModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.meals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyMealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
