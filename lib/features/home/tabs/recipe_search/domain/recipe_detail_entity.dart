import 'package:equatable/equatable.dart';

class RecipeDetailEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;
  final List<String> ingredients;
  final List<String> instructions;

  const RecipeDetailEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.ingredients,
    required this.instructions,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    readyInMinutes,
    servings,
    sourceUrl,
    ingredients,
    instructions,
  ];
}
