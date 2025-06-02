final class ApiEndpoints {
  static const String baseUrl = "api.spoonacular.com";
  static const String searchRecipeByIngredients = "/recipes/findByIngredients";
  static String searchRecipeById(int id) => "recipes/$id/information";
}
