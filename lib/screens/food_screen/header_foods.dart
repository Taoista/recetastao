import 'package:flutter/material.dart';
import 'package:recetastao/models/foods.dart';
import 'package:recetastao/models/recipe.dart';


class HeaderFoods extends StatelessWidget {

  final Recipe recipe;

  const HeaderFoods({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/foods/${recipe.imageUrl}",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text("${recipe.top}"),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(width: 5),
                      Text("${recipe.time}", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}