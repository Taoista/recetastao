import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/constants/app_category.dart';
import 'package:recetao/core/network/api_get_recipes_top.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';
import 'package:recetao/models/type_foods.dart';
import 'package:recetao/screens/home/card_category.dart';
import 'package:recetao/screens/home/featured_card.dart';
import 'package:recetao/screens/home/featured_card_skeleton.dart';
import 'package:recetao/screens/home/header.dart';
import 'package:recetao/screens/home/popular_week.dart';
import 'package:recetao/widgets/main_navigation_bar.dart';
import 'package:recetao/widgets/search_main.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = false;

  List<TypeFood> listTypeFoods = getTypeFoods();

  List<dynamic> listCategory = categoryList;

  Recipe? firstRecipe;

  Future<void> getProductTop() async{
    var controll = ApiGetRecipesTop();
    var recipes = await controll.getData();
    setState(() {
      firstRecipe = recipes.first;
      isLoading = true;
    });
  }


  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<TypeFood> listaTypeFoods = getTypeFoods();

    setState(() {
      listTypeFoods = listaTypeFoods;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    getProductTop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(selectedIndex: 0),
      appBar: AppBar(
        title: Text('ReceTao',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ? Header
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Header(),
            ),

            // ? Busacdor
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SearchMain(),
            ),

            // ? categorias
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 21,
                vertical: 8,
              ),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCategory.length,
                  itemBuilder: (context, index) {
                    return CardCategory(
                      idFood: listCategory[index]['id'],
                      nameCategory: listCategory[index]['name'],
                      pathImage: listCategory[index]['icon'],
                    );
                  },
                ),
              ),
            ),

          // ? Productos detacados
          isLoading ? Padding(
              padding: EdgeInsets.all(14.0),
              child: FeaturedCard(recipe: firstRecipe!,),
            ) : Padding(
              padding: EdgeInsets.all(14.0),
              child: FeaturedCardSkeleton(),
            ),
            

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: PopularWeek(),
            ),

          ],
        ),
      ),
    );
  }
}
