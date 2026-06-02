import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/constants/app_category.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/widgets/main_navigation_bar.dart';
import 'package:recetao/widgets/search_main.dart';


class CategoryScreen extends StatefulWidget {
  static const String routeName = "category_screen";

  final idCategory;

  const CategoryScreen({super.key, this.idCategory});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<dynamic> listCategory = categoryList;

  String labelCategory = "";

  void selectData() {
    for (var category in categoryList) {
      if (category['id'].toString() == widget.idCategory.toString()) {
        setState(() {
          labelCategory = category['name'] as String;
        });
        break;
      }
    }
   
  }

  Future<void> loadData() async {
    

  }


  @override
  initState() {
    super.initState();
    selectData();
    loadData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(selectedIndex: 1),
      appBar: AppBar(
        title: Text(labelCategory,
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: recipes.length,
          //     itemBuilder: (context, index) {
          //       final recipe = recipes[index];
          //       return CardFoodHorizontal(
          //         image: recipe.imgUrl,
          //         title: recipe.name,
          //         description: recipe.description,
          //         rating: recipe.top,
          //         time: recipe.time.toString(),
          //         portions: recipe.personas,
          //         idFood: recipe.id,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}