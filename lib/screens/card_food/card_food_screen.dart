import 'package:flutter/material.dart';



class CardFoodScreen extends StatelessWidget {

  static const String name = "card_food_screen";

  final String idFood;

  const CardFoodScreen({super.key, required this.idFood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recetas Tao'),
        ),
        body: Column(
          children: [Text('hola')],
        ),
        );
  }
}