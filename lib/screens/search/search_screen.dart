import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/widgets/card_food_horizontal.dart';
import 'package:recetastao/widgets/main_navigation_bar.dart';
import 'package:recetastao/widgets/search_main.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "search_screen";

  final String keySearch;

  const SearchScreen({super.key, required this.keySearch});

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
            child: ListView(
              children: const [
                CardFoodHorizontal(
                image: 'assets/images/01.jpg',
                title: 'Pollo al horno',
                description:
                    'Jugoso pollo al horno con papas',
                rating: 4.8,
                time: '35 min',
                portions: 4,
              )
            ],
            ),
          ),
        ],
      ),
    );
  }
}
