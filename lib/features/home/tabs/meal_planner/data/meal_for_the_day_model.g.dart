// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_for_the_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealForTheDayModelAdapter extends TypeAdapter<MealForTheDayModel> {
  @override
  final int typeId = 2;

  @override
  MealForTheDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealForTheDayModel(
      meal: fields[1] as RecipeDetailModel?,
      day: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealForTheDayModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.meal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealForTheDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
