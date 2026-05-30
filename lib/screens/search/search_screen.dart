import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/models/recipe.dart';
import 'package:recetastao/widgets/card_food_horizontal.dart';
import 'package:recetastao/widgets/main_navigation_bar.dart';
import 'package:recetastao/widgets/search_main.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search_screen";

  final String keySearch;

  const SearchScreen({super.key, required this.keySearch});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Recipe> recipes = [];

  void getData() {
    var recetas = getRecipeFoods();
    setState(() {
      recipes = searchRecipes(recetas, widget.keySearch);
    });
  }
  // * busqueda de redcetas

  List<Recipe> searchRecipes(List<Recipe> recipes,String query,) {
    if (query.trim().isEmpty) {
      return recipes;
    }

    final search = query.toLowerCase();

    return recipes.where((recipe) {
      // Nombre
      if (recipe.name.toLowerCase().contains(search)) {
        return true;
      }

      // Descripción
      if (recipe.description.toLowerCase().contains(search)) {
        return true;
      }

      // Ingredientes
      if (recipe.ingredients.any(
        (ingredient) => ingredient.ingrediente.toLowerCase().contains(search),
      )) {
        return true;
      }

      // Pasos
      if (recipe.steps.any(
        (step) =>
            step.title.toLowerCase().contains(search) ||
            step.texto.toLowerCase().contains(search),
      )) {
        return true;
      }

      return false;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(selectedIndex: 1),
      appBar: AppBar(
        title: Text('Resultados',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SearchMain(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return CardFoodHorizontal(
                  image: recipe.imageUrl,
                  title: recipe.name,
                  description: recipe.description,
                  rating: recipe.top,
                  time: recipe.time.toString(),
                  portions: recipe.personas,
                  idFood: recipe.id,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
        
