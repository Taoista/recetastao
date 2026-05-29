import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/constants/app_category.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/models/type_foods.dart';
import 'package:recetastao/screens/home/card_category.dart';
import 'package:recetastao/screens/home/featured_card.dart';
import 'package:recetastao/screens/home/header.dart';
import 'package:recetastao/screens/home/popular_week.dart';
import 'package:recetastao/widgets/main_navigation_bar.dart';
import 'package:recetastao/widgets/search_main.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TypeFood> listTypeFoods = getTypeFoods();

  List<dynamic> listCategory = categoryList;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(selectedIndex: 0),
      appBar: AppBar(
        title: Text('Recetas Tao',
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
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: FeaturedCard(),
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
