class Recipe {
  final int id;
  final int idPlato;
  final double top;
  final String name;
  final String description;
  final String imageUrl;
  final int personas;
  final String icon;
  final int time;
  final String tipo;
  final String origen;
  final List<Ingredient> ingredients;
  final List<StepRecipe> steps;

  Recipe({
    required this.id,
    required this.idPlato,
    required this.top,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.personas,
    required this.icon,
    required this.time,
    required this.tipo,
    required this.origen,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'],
      idPlato: map['id_food'],
      top: (map['top'] as num).toDouble(),
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      personas: map['personas'],
      icon: map['icon'],
      time: map['time'],
      tipo: map['tipo'],
      origen: map['origen'],
      ingredients: (map['ingredients'] as List<dynamic>)
          .map((item) => Ingredient.fromMap(item))
          .toList(),
      steps: (map['steps'] as List<dynamic>)
        .map((item) => StepRecipe.fromMap(item as Map<String, dynamic>)) // Aquí pasas a objeto
        .toList(),
  );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_food': idPlato,
      'top': top,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'personas': personas,
      'icon': icon,
      'time': time,
      'tipo': tipo,
      'origen': origen,
      'ingredients': ingredients.map((e) => e.toMap()).toList(),
      'steps': steps.map((e) => e.toMap()).toList(),
    };
  }
}

class Ingredient {
  final String ingrediente;
  final String cantidad;
  final String icon;

  Ingredient({
    required this.ingrediente,
    required this.cantidad,
    required this.icon,
  });

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      ingrediente: map['ingrediente'],
      cantidad: map['cantidad'],
      icon: map['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ingrediente': ingrediente,
      'cantidad': cantidad,
      'icon': icon,
    };
  }
}

class StepRecipe{
  final int id;
  final String title;
  final String texto;

  StepRecipe({required this.id, required this.title, required this.texto});

  factory StepRecipe.fromMap(Map<String, dynamic> map) {
    return StepRecipe(
      id: map['id'] as int,
      title: map['title'] as String,
      texto: map['texto'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'texto': texto,
    };
  }

}

List<Recipe> getRecipeFoods() {
  return foodsLista.map((item) => Recipe.fromMap(item)).toList();
}

const List<Map<String, dynamic>> foodsLista = [
  {
    'id': 1,
    "id_food": 2,
    "top": 5.0,
    "name": "Champiñones cremosos con arroz",
    "description": "Delicious dish with a unique flavor.",
    "imageUrl": "food_01_header.jpg",
    "personas": 4,
    "icon": "food_01.png",
    "time": 12,
    "tipo": "Platos principales",
    "origen": "italiana",
    "ingredients": [
      {
        "ingrediente": "Cebolla",
        "cantidad": "1 cebolla morada (mediana)",
        "icon": "🧅"
      },
      {"ingrediente": "Champiñones", "cantidad": "300g", "icon": "🍄"},
      {"ingrediente": "Ajo", "cantidad": "2 Dientes picado", "icon": "🧄"},
      {"ingrediente": "Arroz", "cantidad": "250g", "icon": "🍚"},
      {"ingrediente": "Mantequilla", "cantidad": "50g", "icon": "🧈"},
      {"ingrediente": "Vino blanco", "cantidad": "Botella 700", "icon": "🍾"},
      {"ingrediente": "Crema", "cantidad": "200ml", "icon": "🥛"},
      {"ingrediente": "Sal y Pimienta", "cantidad": "Al gusto", "icon": "🧂"},
      {
        "ingrediente": "Queso rallado Parmesano o similar",
        "cantidad": "100g",
        "icon": "🧀"
      },
      {
        "ingrediente": "Queso mozzarella",
        "cantidad": "Las Bolas que quieras por plato",
        "icon": "🧀"
      },
      {"ingrediente": "Perejil", "cantidad": "Un puñado", "icon": "🌿"},
    ],
    "steps": [
      {
        "id": 1,
        "title": "Sofreír la cebolla",
        "texto":
            "Pica la cebolla morada finamente y sofríela en una sartén amplia con un poco de aceite a fuego medio hasta que esté transparente y comience a tomar color."
      },
      {
        "id": 2,
        "title": "Agregar los champiñones",
        "texto":
            "Incorpora los champiñones picados y cocina hasta que suelten su agua y reduzcan su tamaño."
      },
      {
        "id": 3,
        "title": "Incorporar el ajo",
        "texto":
            "Agrega el ajo picado y deja que se cocine unos minutos para que libere su sabor."
      },
      {
        "id": 4,
        "title": "Agregar el arroz y la mantequilla",
        "texto":
            "Vierte el arroz y remueve bien para que absorba los sabores. Añade la mantequilla y deja que se derrita por completo."
      },
      {
        "id": 5,
        "title": "Desglasar con vino blanco",
        "texto":
            "Agrega el vino blanco y cocina unos minutos hasta que se evapore el alcohol y el líquido reduzca."
      },
      {
        "id": 6,
        "title": "Cocinar el arroz",
        "texto":
            "Vierte un vaso de agua y deja que el arroz se cocine a fuego lento, removiendo de vez en cuando para que quede cremoso."
      },
      {
        "id": 7,
        "title": "Agregar la crema y sazonar",
        "texto":
            "Cuando el arroz esté casi listo, incorpora la crema, sal y pimienta al gusto. Mezcla bien."
      },
      {
        "id": 8,
        "title": "Derretir el queso rallado",
        "texto":
            "Añade el queso rallado y remueve hasta que se funda y el risotto tenga una textura suave y cremosa."
      },
      {
        "id": 9,
        "title": "Emplatado",
        "texto":
            "Sirve el risotto en un plato hondo y espolvorea más queso rallado por encima. Coloca una bola de queso mozzarella y rocía con tu aceite favorito."
      },
      {
        "id": 10,
        "title": "Decorar y servir",
        "texto":
            "Termina decorando con perejil picado fresco para darle color y sirve inmediatamente."
      }
    ]
  },
  {
    'id': 2,
    "id_food": 2,
    "top": 5.0,
    "name": "Champiñones cremosos con arroz",
    "description": "Delicious dish with a unique flavor.",
    "imageUrl": "food_01_header.jpg",
    "personas": 4,
    "icon": "food_01.png",
    "time": 12,
    "tipo": "Platos principales",
    "origen": "italiana",
    "ingredients": [
      {
        "ingrediente": "Cebolla",
        "cantidad": "1 cebolla morada (mediana)",
        "icon": "🧅"
      },
      {"ingrediente": "Champiñones", "cantidad": "300g", "icon": "🍄"},
      {"ingrediente": "Ajo", "cantidad": "2 Dientes picado", "icon": "🧄"},
      {"ingrediente": "Arroz", "cantidad": "250g", "icon": "🍚"},
      {"ingrediente": "Mantequilla", "cantidad": "50g", "icon": "🧈"},
      {"ingrediente": "Vino blanco", "cantidad": "Botella 700", "icon": "🍾"},
      {"ingrediente": "Crema", "cantidad": "200ml", "icon": "🥛"},
      {"ingrediente": "Sal y Pimienta", "cantidad": "Al gusto", "icon": "🧂"},
      {
        "ingrediente": "Queso rallado Parmesano o similar",
        "cantidad": "100g",
        "icon": "🧀"
      },
      {
        "ingrediente": "Queso mozzarella",
        "cantidad": "Las Bolas que quieras por plato",
        "icon": "🧀"
      },
      {"ingrediente": "Perejil", "cantidad": "Un puñado", "icon": "🌿"},
    ],
    "steps": [
      {
        "id": 1,
        "title": "Sofreír la cebolla",
        "texto":
            "Pica la cebolla morada finamente y sofríela en una sartén amplia con un poco de aceite a fuego medio hasta que esté transparente y comience a tomar color."
      },
      {
        "id": 2,
        "title": "Agregar los champiñones",
        "texto":
            "Incorpora los champiñones picados y cocina hasta que suelten su agua y reduzcan su tamaño."
      },
      {
        "id": 3,
        "title": "Incorporar el ajo",
        "texto":
            "Agrega el ajo picado y deja que se cocine unos minutos para que libere su sabor."
      },
      {
        "id": 4,
        "title": "Agregar el arroz y la mantequilla",
        "texto":
            "Vierte el arroz y remueve bien para que absorba los sabores. Añade la mantequilla y deja que se derrita por completo."
      },
      {
        "id": 5,
        "title": "Desglasar con vino blanco",
        "texto":
            "Agrega el vino blanco y cocina unos minutos hasta que se evapore el alcohol y el líquido reduzca."
      },
      {
        "id": 6,
        "title": "Cocinar el arroz",
        "texto":
            "Vierte un vaso de agua y deja que el arroz se cocine a fuego lento, removiendo de vez en cuando para que quede cremoso."
      },
      {
        "id": 7,
        "title": "Agregar la crema y sazonar",
        "texto":
            "Cuando el arroz esté casi listo, incorpora la crema, sal y pimienta al gusto. Mezcla bien."
      },
      {
        "id": 8,
        "title": "Derretir el queso rallado",
        "texto":
            "Añade el queso rallado y remueve hasta que se funda y el risotto tenga una textura suave y cremosa."
      },
      {
        "id": 9,
        "title": "Emplatado",
        "texto":
            "Sirve el risotto en un plato hondo y espolvorea más queso rallado por encima. Coloca una bola de queso mozzarella y rocía con tu aceite favorito."
      },
      {
        "id": 10,
        "title": "Decorar y servir",
        "texto":
            "Termina decorando con perejil picado fresco para darle color y sirve inmediatamente."
      }
    ]
  },
];
