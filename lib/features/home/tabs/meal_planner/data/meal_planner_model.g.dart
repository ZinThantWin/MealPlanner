// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_planner_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealPlannerModelAdapter extends TypeAdapter<MealPlannerModel> {
  @override
  final int typeId = 4;

  @override
  MealPlannerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealPlannerModel(
      mealPlanner: (fields[0] as List).cast<WeeklyMealModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealPlannerModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.mealPlanner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealPlannerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
