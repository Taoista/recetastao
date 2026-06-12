import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/network/api_search_recipes.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';
import 'package:recetao/widgets/not_found.dart';
import 'package:recetao/widgets/card_food_horizontal.dart';
import 'package:recetao/widgets/main_navigation_bar.dart';
import 'package:recetao/widgets/search_main.dart';
import 'package:recetao/widgets/skeleton_card_food_horizontal.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search_screen";

  final String keySearch;

  const SearchScreen({super.key, required this.keySearch});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  bool isLoading = true;

  List<Recipe> recipes = [];

  // * realiza la peticion para obtener los productos
  Future<void> getDataFromApi() async {
    try {
      final api = ApiSearchRecipes();
      final recipesFromApi = await api.searchRecipes(widget.keySearch);
      setState(() {
        recipes = recipesFromApi;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching recipes: $e");
    }
  }


  @override
  void initState() {
    super.initState();
    getDataFromApi();
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
            child: isLoading ? const SkeletonCardFoodHorizontal():
            recipes.isEmpty ? NotFound(keySearch: widget.keySearch):
            ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return CardFoodHorizontal(
                  image: recipe.imgUrl,
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
        
