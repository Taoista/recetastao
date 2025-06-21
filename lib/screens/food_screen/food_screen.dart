import 'package:flutter/material.dart';
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
  bool isLoading =false;
  List<Recipe> listFood = getRecipeFoods();
  List<Ingredient> ingredients = [];
  List<StepRecipe> stepsList = [];

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Recipe> lista = getRecipeFoods();

    setState(() {
      listFood = lista.where((recipe) => recipe.idPlato == int.parse(widget.idFood)).toList();
      ingredients = listFood.first.ingredients;
      stepsList = listFood.first.steps;
      
      for (var i = 0; i < stepsList.length; i++) {
        print(stepsList[i].title);
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
          // ? header de la pantalla
          HeaderFoods(recipe: listFood.first),
          const SizedBox(height: 10),
          Text(
            listFood.first.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text("${listFood.first.personas} Personas", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          PersonData(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Ingrident"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Procedure"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.restaurant_menu_outlined),
              SizedBox(width: 5),
              Text("1 serve"),
              Spacer(),
              Text("10 Items"),
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
        
      ): Container(child: Center(child: Text('cargando'),),),
    );
  }
}
