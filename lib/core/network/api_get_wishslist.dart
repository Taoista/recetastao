import 'package:dio/dio.dart';
import 'package:recetao/models/recipe.dart';

class ApiGetWishlist {
  
  final List<String> wishlist;

  ApiGetWishlist({required this.wishlist});

  final Dio dio = Dio();

  Future<List<Recipe>> getWishlist() async {
  
    try {
      final response = await dio.post(
        'https://backend-recetastao-production.up.railway.app/api/v1/get-wishlist',
        data: {
          'wishlist': wishlist,
        },
      );

      List<dynamic> jsonData = response.data['data'];
      final recipes = jsonData
    .expand((item) => item)
    .map<Recipe>((item) => Recipe.fromMap(item))
    .toList();

      return recipes;

          
    } catch (e) {
      throw Exception('Error al obtener wishlist: $e');
    }
  
  }


}