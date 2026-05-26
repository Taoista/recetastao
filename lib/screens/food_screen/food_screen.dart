import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recetastao/models/recipe.dart';
import 'package:recetastao/screens/food_screen/header_foods.dart';
import 'package:recetastao/screens/food_screen/ingredients_list.dart';
import 'package:recetastao/screens/food_screen/person_data.dart';
import 'package:recetastao/screens/food_screen/steps_list.dart';

class FoodScreen extends StatefulWidget {
  static const String name = "food_screen";

  final String idFood;

  const FoodScreen({super.key, required this.idFood});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool isLoading = false;
  List<Recipe> listFood = getRecipeFoods();
  List<Ingredient> ingredients = [];
  List<StepRecipe> stepsList = [];

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Recipe> lista = getRecipeFoods();

    setState(() {
      print("entrando a la consola");

      listFood = lista
          .where((recipe) => recipe.idPlato == int.parse(widget.idFood))
          .toList();

      if (listFood.isNotEmpty) {
        ingredients = listFood.first.ingredients;
        stepsList = listFood.first.steps;

        for (var i = 0; i < stepsList.length; i++) {
          print(stepsList[i].title);
        }
      } else {
        print("No se encontró la receta");
      }

      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: isLoading ?  ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // ? header de la pantalla o banner de la receta
          HeaderFoods(recipe: listFood.first),
          const SizedBox(height: 10),
          Text(
            listFood.first.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 10),
          // ?
          // TODO: aun no termino que es lo que quiero hacer
          // PersonData(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Ingredientes"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.push("/preparation/${widget.idFood}");
                  },
                  child: const Text("Preparación"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.restaurant_menu_outlined),
              const SizedBox(width: 5),
              Text("${listFood.first.personas} Servicios"),
              const Spacer(),
              Text("${ingredients.length} Ingredientes"),
            ],
          ),
          const SizedBox(height: 20),
         ...ingredients.map((ingredient) {
            return IngredientsList(image: ingredient.icon, name: ingredient.ingrediente, weight: ingredient.cantidad,);
          }).toList(),
          const SizedBox(height: 20),
          // stesp for use ingredients
          ...stepsList.map((step) {
            return StepsList(
              idFood: step.id,
              name:step.title,
              description: step.texto,
            );
          }).toList(),
        ],
        
      ): Center(child: Text('cargando'),),
    );
  }
}
