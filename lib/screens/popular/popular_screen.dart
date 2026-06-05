import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/network/api_trending_recipes.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';
import 'package:recetao/widgets/card_food_horizontal.dart';
import 'package:recetao/widgets/skeleton_card_food_horizontal.dart';



class PopularScreen extends StatefulWidget {
  static const name = "popular_screen";

  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  bool isLoading = false;
  List<Recipe>? listRecipes;

  Future<void> getData() async {
    final controller = ApiTrendingRecipes();
    List<Recipe> data = await controller.getData();

    setState(() {
      listRecipes = data;
      isLoading = true;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: MainNavigationBar(selectedIndex: 1),
      appBar: AppBar(
        title: Text('Populares',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            )),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child: SearchMain(),
          // ),
          isLoading ? Expanded(
            child: ListView.builder(
              itemCount: listRecipes!.length,
              itemBuilder: (context, index) {
                Recipe item = listRecipes![index];
                // final recipe = recipes[index];
                return CardFoodHorizontal(image: item.imgUrl, title: item.name, description: item.description, 
                    rating: item.top, time: item.time.toString(), portions: item.personas, idFood: item.id);
              },
            ),
          ) : SkeletonCardFoodHorizontal(),
        ],
      ),
    );
  }
}