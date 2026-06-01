import 'package:dio/dio.dart';
import 'package:recetastao/core/config/app_config.dart';
import 'package:recetastao/models/recipe.dart';

class ApiSearchRecipes {
  
  ApiSearchRecipes();

  var dio = Dio();


  Future<List<Recipe>> searchRecipes(String keySearch) async {
    print("INICIANDO EL CODIO");
    try {
      final response = await dio.get("${AppConfig.baseUrl}v1/get-recipes/$keySearch");
      // print(response);
      if(response.statusCode == 200) {
        List<dynamic> jsonData = response.data['data'];
        print(jsonData);

        // final List<Recipe> recipes = jsonData.map((item) => Recipe.fromJson(item)).toList();
        
        final List<Recipe> recipes = jsonData.map((item) => Recipe.fromMap(item)).toList();
        print(recipes);
        return recipes;
      } else {
        throw Exception("Failed to load recipes: ${response.statusCode}");
      }

    } catch (e) {
      throw Exception("Failed to load recipes: $e");
    }
  }


}