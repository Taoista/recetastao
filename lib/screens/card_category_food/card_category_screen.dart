import 'package:flutter/material.dart';
import 'package:recetastao/widgets/card_food.dart';
import 'package:recetastao/models/foods.dart';



class CardCategoryScreen extends StatefulWidget {

  static const String name = "card_food_category_screen";

  final String idFood;

  const CardCategoryScreen({super.key, required this.idFood});

  @override
  State<CardCategoryScreen> createState() => _CardCategoryScreenState();
}

class _CardCategoryScreenState extends State<CardCategoryScreen> {

  List<Foods> foodsList = getFoods();

  int? idType = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      idType = int.tryParse(widget.idFood);
    });
  }

  @override
  Widget build(BuildContext context) {

    

    List<Foods> filteredFoods = foodsList.where((food) => food.idType == idType).toList();


    return Scaffold(
        appBar: AppBar(
          title: const Text('Recetas Tao'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2, // ← dos por fila
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6, // Ajusta según el tamaño del Card
          children: filteredFoods.map((food) => CardFood(food:food)).toList(),
        ),
      ),
        );
  }
}