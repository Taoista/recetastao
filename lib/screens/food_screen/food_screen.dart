import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/network/api_get_recipe_selected.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/models/recipe.dart';
import 'package:recetastao/screens/food_screen/food_skeleton.dart';
import 'package:recetastao/screens/food_screen/icon_item.dart';
import 'package:recetastao/screens/food_screen/ingredient_list.dart';
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
  Recipe? recipes;
  List<Ingredient> ingredients = [];
  List<StepRecipe> stepsList = [];

  Future<void> getData() async {

    final data = ApiGetRecipeSelected();

    final recipe = await data.searchRecipes(int.parse(widget.idFood));

    setState(() {
      recipes = recipe;
      ingredients = recipe.ingredients;
      stepsList = recipe.steps;
      isLoading = true;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadData();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          /// FOTO
          SizedBox(
            height: 420,
            width: double.infinity,
            child: Image.network(
              recipes!.imgUrl,
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENIDO RECETA
          DraggableScrollableSheet(
            initialChildSize: 0.58,
            minChildSize: 0.58,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    24,
                    24,
                    120,
                  ),
                  children: [
                    /// HANDLE
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      recipes!.name,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      recipes!.description,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconItem(
                          icon: Icons.star,
                          value: recipes!.top.toString(),
                          label: 'Valoración',
                          color: AppColors.rating,
                        ),
                        IconItem(
                          icon: Icons.access_time,
                          value: '${recipes!.time} min',
                          label: 'Tiempo',
                          color: AppColors.primaryDark,
                        ),
                        IconItem(
                          icon: Icons.people_alt_outlined,
                          value: '${recipes!.personas}',
                          label: 'Porciones',
                          color: AppColors.primaryDark,
                        ),
                        IconItem(
                          icon: Icons.bar_chart_rounded,
                          value: 'Fácil',
                          label: 'Dificultad',
                          color: AppColors.primaryDark,
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    Text(
                      'Ingredientes',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Column(
                      children: ingredients.map((e) {
                        return IngredientList(text: e.ingrediente);
                      }).toList(),
                    ),

                    const SizedBox(height: 40),

                    Text(
                      'Preparación',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),

                    const SizedBox(height: 20),
                     Column(
                      children: stepsList.map((e) {
                        return StepsList(number: e.id, text: e.texto);
                      }).toList(),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      height: 62,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          context.push("/preparation/${widget.idFood}");
                        },
                        icon: const Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Cocinar ahora',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          /// BOTONES SUPERIORES
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: AppColors.primaryDark,
                      onPressed: () => context.pop(),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.share_outlined,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ): FoodSkeleton();
  }
}
