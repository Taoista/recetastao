import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final int idFood;
  final String nameCategory;
  final String pathImage;

  const CardCategory({super.key, required this.idFood, required this.nameCategory, required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              pathImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 1),
        Text(
          nameCategory,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
