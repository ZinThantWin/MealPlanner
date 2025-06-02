import '../domain/search_receipe_entity.dart';

final class SearchRecipeModel {
  final int id;
  final String title;
  final String image;

  SearchRecipeModel({
    required this.title,
    required this.id,
    required this.image,
  });

  factory SearchRecipeModel.fromJson({required Map<String, dynamic> json}) {
    return SearchRecipeModel(
      title: json["title"] ?? "",
      id: json["id"] ?? 0,
      image: json["image"] ?? "",
    );
  }

  SearchRecipeEntity toEntity() {
    return SearchRecipeEntity(title: title, id: id, image: image);
  }
}
