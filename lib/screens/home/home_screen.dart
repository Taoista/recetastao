import 'package:flutter/material.dart';
import 'package:recetastao/core/constants/app_category.dart';
import 'package:recetastao/models/type_foods.dart';
import 'package:recetastao/screens/home/card_category.dart';
import 'package:recetastao/widgets/category_food.dart';
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
      appBar: AppBar(
        title: const Text('Recetas Tao'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchMain(),
          ),
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
                  return CardCategory(idFood: listCategory[index]['id'], nameCategory: listCategory[index]['name'], pathImage: listCategory[index]['icon']);
                },
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 2 / 2,
              children: listTypeFoods.map((food) {
                // final String image = typeFoods.firstWhere((e) => e['id'] == food.id)['img'];
                return CategoryFood(
                  idFood: food.id,
                  img: food.img,
                  title: food.nombre,
                );
              }).toList(),
            ),
          )),
        ],
      ),
    );
  }
}
