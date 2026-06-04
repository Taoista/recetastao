


class DbFavoritos{
  final int? id; 
  final idRecipe;
  DbFavoritos({
    this.id,
    required this.idRecipe,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_recipes': idRecipe,
    };
  }

  factory DbFavoritos.fromMap(Map<String, dynamic> json) {
    return DbFavoritos(
      id: json['id'],
      idRecipe: json['id_recipes']
    );
  }

}