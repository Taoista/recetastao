import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/network/api_trending_recipes.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';
import 'package:recetao/screens/home/card_popular_week.dart';
import 'package:recetao/screens/home/skeleton_popular_week.dart';

class PopularWeek extends StatefulWidget {
  const PopularWeek({super.key});

  @override
  State<PopularWeek> createState() => _PopularWeekState();
}

class _PopularWeekState extends State<PopularWeek> {
  bool isLoading = false;
  List<Recipe>? recipesLIst;

  Future<void> getData() async {
    final controll = ApiTrendingRecipes();
    List<Recipe> data = await controll.getData();
    setState(() {
      recipesLIst = data.take(3).toList();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Populares esta semana',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark,
              ),
            ),
            TextButton(
              onPressed: () {
                context.push("/popular");
              },
              child: Text(
                'Ver todas',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        /// HORIZONTAL LIST
        isLoading ? SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recipesLIst!.length,
            itemBuilder: (context, index) {
              Recipe item = recipesLIst![index];
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CardPopularWeek(idFood: item.id, name: item.name, imgUrl: item.imgUrl,),
              );
            },
          ),
        ) : SkeletonPopularWeek(),
      ],
    );
  }
}


/// CARD 3
              