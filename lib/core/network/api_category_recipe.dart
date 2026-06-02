import 'package:dio/dio.dart';
import 'package:recetao/core/config/app_config.dart';
import 'package:recetao/models/recipe.dart';

class ApiCategoryRecipe {

  ApiCategoryRecipe();

  var dio = Dio();

  Future<List<Recipe>> getRecipesByCategory(String idCategory) async {
     try {
      final response = await dio.get("${AppConfig.baseUrl}v1/get-recipes-by-type/$idCategory");
      // print(response);
      if(response.statusCode == 200) {
        List<dynamic> jsonData = response.data['data'];
        
        final List<Recipe> recipes = jsonData.map((item) => Recipe.fromMap(item)).toList();
        return recipes;
      } else {
        throw Exception("Failed to load recipes: ${response.statusCode}");
      }

    } catch (e) {
      throw Exception("Failed to load recipes: $e");
    }
  }



}

      
