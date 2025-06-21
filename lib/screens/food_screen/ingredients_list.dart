import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {

  final String image;
  final String name;
  final String weight;

  const IngredientsList({super.key, required this.image, required this.name, required this.weight});

  @override
  Widget build(BuildContext context) {

    return Card(
              child: ListTile(
                leading: Text(
                  image,
                  style: const TextStyle(fontSize: 30),
                ),
                title: Text(name),
                trailing: Text(weight),
              ),
            );
  }
}
