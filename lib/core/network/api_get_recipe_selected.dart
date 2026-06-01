import 'package:dio/dio.dart';
import 'package:recetastao/core/config/app_config.dart';
import 'package:recetastao/models/recipe.dart';

class ApiGetRecipeSelected {

  ApiGetRecipeSelected();

  var dio = Dio();

  Future<Recipe> searchRecipes(int idRecipe) async {
    try {
      final response = await dio.get("${AppConfig.baseUrl}v1/get-recipe-details/$idRecipe");
      if(response.statusCode == 200) {

        final Map<String, dynamic> recipeJson =
            response.data['data'] as Map<String, dynamic>;
        
        final recipes = Recipe.fromMap(recipeJson);
        return recipes;
      } else {
        throw Exception("Failed to load recipes: ${response.statusCode}");
      }

    } catch (e) {
      throw Exception("Failed to load recipes: $e");
    }
  }


}