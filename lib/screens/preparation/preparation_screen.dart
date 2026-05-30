import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/models/recipe.dart';
import 'package:recetastao/screens/preparation/card_preparation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PreparationScreen extends StatefulWidget {
  final String idFood;

  static const String name = "preparation_screen";

  const PreparationScreen({super.key, required this.idFood});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  bool isLoading = false;
  List<Recipe> listFood = getRecipeFoods();
  List<StepRecipe> stepsList = [];

  int pageIndex = 1;

  final PageController _pageController = PageController();

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Recipe> lista = getRecipeFoods();

    setState(() {
      print("entrando a la consola");

      listFood = lista
          .where((recipe) => recipe.idPlato == int.parse(widget.idFood))
          .toList();

      if (listFood.isNotEmpty) {
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
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          listFood.first.name,
          maxLines: 2,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Favorito
            },
            icon: const Icon(Icons.favorite_border),
            color: AppColors.primaryDark,
          ),
          IconButton(
            onPressed: () {
              // Compartir
            },
            icon: const Icon(Icons.share_outlined),
            color: AppColors.primaryDark,
          ),
        ],
      ),
      body: isLoading
          // ? paginador
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top:20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Página $pageIndex de ${stepsList.length}",
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: stepsList.length,
                          effect: WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 8,
                            activeDotColor: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index + 1;
                      });
                    },
                    itemCount: stepsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: CardPreparation(
                          steps: listFood.first.steps[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: Text('cargando'),
            ),
    );
  }
}
