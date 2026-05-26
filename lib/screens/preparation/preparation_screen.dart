import 'package:flutter/material.dart';
import 'package:recetastao/models/recipe.dart';
import 'package:recetastao/screens/preparation/card_preparation.dart';

class PreparationScreen extends StatefulWidget {
  final String idFood;

  static const String name = "preparation_screen";

  const PreparationScreen({super.key, required this.idFood});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  bool isLoading = false;
  List<Recipe> listFood = getRecipeFoods();
  List<StepRecipe> stepsList = [];

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Recipe> lista = getRecipeFoods();

    setState(() {
      print("entrando a la consola");

      listFood = lista
          .where((recipe) => recipe.idPlato == int.parse(widget.idFood))
          .toList();

      if (listFood.isNotEmpty) {
        stepsList = listFood.first.steps;

        for (var i = 0; i < stepsList.length; i++) {
          print(stepsList[i].title);
        }
      } else {
        print("No se encontró la receta");
      }

      isLoading = true;
    });
  }


  @override
  void initState() {
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
        itemCount:  stepsList.length,

        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20),

            child: CardPreparation(steps: listFood.first.steps[index])
          );
        },
      ): Center(child: Text('cargando'),),
    );
  }
}
