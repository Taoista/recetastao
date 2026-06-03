


import 'package:recetao/core/database/database_helper.dart';
import 'package:recetao/core/database/favoritos.dart';

class FavoritosRepository {
  Future<int> insertRecipe(Favoritos recipe) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert(
      'favorites',
      recipe.toMap(),
    );
  }

  Future<List<Favoritos>> getRecipes() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('favorites');

    return result
        .map((json) => Favoritos.fromMap(json))
        .toList();
  }

  Future<void> deleteRecipe(int id) async {
    final db = await DatabaseHelper.instance.database;

    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}