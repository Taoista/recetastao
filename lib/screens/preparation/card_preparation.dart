import 'package:flutter/material.dart';
import 'package:recetastao/models/recipe.dart';

class CardPreparation extends StatelessWidget {
  final StepRecipe steps;
  const CardPreparation({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              steps.id.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            /// TÍTULO
            const Text(
              "Preparar ingredientes",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black54,
              ),
            ),
            Text(
              steps.title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            

            const SizedBox(height: 25),

            /// IMAGEN
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  steps.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),

            /// DESCRIPCIÓN
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                steps.texto,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// BOTÓN
            // SizedBox(
            //   width: double.infinity,
            //   height: 60,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.orange,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18),
            //       ),
            //     ),
            //     child: const Text(
            //       "Siguiente paso",
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
