import 'package:flutter/material.dart';


class IngredientScreen extends StatefulWidget {
  static const String name = "ingredient_screen";

  final String idFood;

  const IngredientScreen({super.key, required this.idFood});

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {

  bool isLoading = false;

  List<String> ingredients = [];


  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      ingredients = [
        "1 taza de harina",
        "1/2 taza de azúcar",
        "1/4 taza de mantequilla",
        "1 huevo",
        "1 cucharadita de polvo de hornear",
        "1/2 taza de leche",
      ];

      isLoading = true;
    });
  }

  @override
  initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preparación"),
      ),
      body: isLoading ? PageView.builder(
        itemCount:  ingredients.length,

        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20),

            child: Text("Ddemo")
          );
        },
      ): Center(child: Text('cargando'),),
    );
  }
}