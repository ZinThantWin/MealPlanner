// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeDetailModelAdapter extends TypeAdapter<RecipeDetailModel> {
  @override
  final int typeId = 0;

  @override
  RecipeDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeDetailModel(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String,
      readyInMinutes: fields[3] as int,
      servings: fields[4] as int,
      sourceUrl: fields[5] as String,
      ingredients: (fields[6] as List).cast<String>(),
      instructions: (fields[7] as List).cast<String>(),
      isFavourite: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeDetailModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.readyInMinutes)
      ..writeByte(4)
      ..write(obj.servings)
      ..writeByte(5)
      ..write(obj.sourceUrl)
      ..writeByte(6)
      ..write(obj.ingredients)
      ..writeByte(7)
      ..write(obj.instructions)
      ..writeByte(8)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
