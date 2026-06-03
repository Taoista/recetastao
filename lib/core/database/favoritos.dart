


class Favoritos{
  final idRecipe;
  Favoritos({
    required this.idRecipe,
  });


  Map<String, dynamic> toMap() {
    return {
      'id_recipes': idRecipe,
    };
  }

  factory Favoritos.fromMap(Map<String, dynamic> json) {
    return Favoritos(
      idRecipe: json['id_recipes']
    );
  }

}