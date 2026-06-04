import 'package:recetao/core/database/database_helper.dart';
import 'package:recetao/core/database/db_favoritos.dart';

class FavoritosRepository {

  Future<int> insertFavorite(DbFavoritos recipe) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert(
      'favorites',
      recipe.toMap(),
    );
  }

  Future<List<DbFavoritos>> getFavorites() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query('favorites');
    return result
        .map((json) => DbFavoritos.fromMap(json))
        .toList();
  }

  

  Future<void> deleteFavorite(int id) async {
    final db = await DatabaseHelper.instance.database;

    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> getStateWishItem(int id) async {
      final db = await DatabaseHelper.instance.database;

      final result = await db.query(
        'favorites',
        where: 'id_recipes = ?',
        whereArgs: [id],
        limit: 1,
      );

      return result.isNotEmpty;
  }

  
}