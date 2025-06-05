import 'package:flutter/material.dart';
import 'package:recetastao/models/card_food.dart';
import 'package:recetastao/models/foods.dart';



class CardFoodScreen extends StatefulWidget {

  static const String name = "card_food_screen";

  final String idFood;

  const CardFoodScreen({super.key, required this.idFood});

  @override
  State<CardFoodScreen> createState() => _CardFoodScreenState();
}

class _CardFoodScreenState extends State<CardFoodScreen> {

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
          children: filteredFoods.map((food) => CardFood()).toList(),
        ),
      ),
        );
  }
}