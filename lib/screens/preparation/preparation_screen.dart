import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/database/db_favoritos.dart';
import 'package:recetao/core/database/favoritos_repository.dart';
import 'package:recetao/core/network/api_get_recipe_selected.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';
import 'package:recetao/screens/preparation/card_preparation.dart';
import 'package:recetao/screens/preparation/skeleton_prepartion.dart';
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
  Recipe? recipes;
  List<StepRecipe>? stepsList;

  int pageIndex = 1;

  final PageController _pageController = PageController();

  bool stateWishList = false;

  void getWishList() async {
    final repository = FavoritosRepository();

    final exists = stateWishList =
        await repository.getStateWishItem(int.parse(widget.idFood));

    setState(() {
      stateWishList = exists;
    });
  }

  Future<void> loadData() async {
    final data = ApiGetRecipeSelected();

    final recipe = await data.searchRecipes(int.parse(widget.idFood));

    setState(() {
      recipes = recipe;
      stepsList = recipe.steps;
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
    return isLoading
        ? Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              title: Text(
                recipes!.name,
                maxLines: 2,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    if (stateWishList) {
                      // Eliminar de favoritos
                    } else {
                      final repository = FavoritosRepository();

                      await repository.insertFavorite(
                        DbFavoritos(idRecipe: widget.idFood),
                      );

                      setState(() {
                        stateWishList = true;
                      });
                    }
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: stateWishList
                          ? AppColors.primary
                          : AppColors.background,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: stateWishList ? Colors.white : AppColors.primary,
                    ),
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     // Compartir
                //   },
                //   icon: const Icon(Icons.share_outlined),
                //   color: AppColors.primaryDark,
                // ),
              ],
            ),
            body: isLoading
                // ? paginador
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Página $pageIndex de ${stepsList!.length}",
                                style: GoogleFonts.cormorantGaramond(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: stepsList!.length,
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
                          itemCount: stepsList!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: CardPreparation(
                                steps: stepsList![index],
                                pageController: _pageController,
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
          )
        : SkeletonPrepartion();
  }
}
