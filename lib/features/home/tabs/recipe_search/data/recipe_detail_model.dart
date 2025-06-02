import 'package:hive/hive.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';

import '../../../../../core/constants/hive_constants.dart';

part 'recipe_detail_model.g.dart';

@HiveType(typeId: HiveConstants.favouriteRecipeTypeId)
class RecipeDetailModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final int readyInMinutes;

  @HiveField(4)
  final int servings;

  @HiveField(5)
  final String sourceUrl;

  @HiveField(6)
  final List<String> ingredients;

  @HiveField(7)
  final List<String> instructions;

  @HiveField(8)
  bool isFavourite;

  RecipeDetailModel({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.ingredients,
    required this.instructions,
    this.isFavourite = false,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (var r in json['extendedIngredients']) {
      ingredients.add(r["name"] ?? "");
    }
    return RecipeDetailModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
      sourceUrl: json['sourceUrl'],
      ingredients: ingredients,
      instructions:
          (json['analyzedInstructions'] as List)
              .expand(
                (instruction) => (instruction['steps'] as List).map(
                  (step) => step['step'] as String,
                ),
              )
              .toList(),
    );
  }

  RecipeDetailEntity toEntity() => RecipeDetailEntity(
    id: id,
    title: title,
    image: image,
    readyInMinutes: readyInMinutes,
    servings: servings,
    sourceUrl: sourceUrl,
    ingredients: ingredients,
    instructions: instructions,
  );
}
