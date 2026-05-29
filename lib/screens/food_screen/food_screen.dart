import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/models/recipe.dart';
import 'package:recetastao/screens/food_screen/icon_item.dart';
import 'package:recetastao/screens/food_screen/ingredient_list.dart';
import 'package:recetastao/screens/food_screen/steps_view.dart';
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
        print(ingredients);
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
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          /// FOTO
          SizedBox(
            height: 420,
            width: double.infinity,
            child: Image.asset(
              'assets/images/01.jpg',
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
                      'Pollo al horno con romero',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Jugoso pollo al horno con papas y romero, ideal para toda la familia.',
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
                          value: '4.8',
                          label: 'Valoración',
                          color: AppColors.rating,
                        ),
                        IconItem(
                          icon: Icons.access_time,
                          value: '35 min',
                          label: 'Tiempo',
                          color: AppColors.primaryDark,
                        ),
                        IconItem(
                          icon: Icons.people_alt_outlined,
                          value: '4',
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
                    // StepsList(number: 1, text: 'Precalienta el horno a 200°C'),
                    StepsList(number: 1, text: 'Precalienta el horno a 200°C'),
                    StepsList(number: 2, text: 'Mezcla aceite, ajo y romero'),
                    StepsList(number: 3, text: 'Unta el pollo con la mezcla'),
                    StepsList(number: 4, text: 'Agrega las papas alrededor'),
                    StepsList(number: 5, text: 'Hornea durante 35 minutos'),

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
    );
  }
}
