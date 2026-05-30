import 'package:flutter/material.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/models/recipe.dart';

class CardPreparation extends StatelessWidget {
  final StepRecipe steps;
  const CardPreparation({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: ListView(
          children: [
            /// IMAGEN
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  steps.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // ? paso para cocinar
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${steps.id}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      steps.title,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// DESCRIPCIÓN
            Container(
              // padding: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                // color: Colors.white,
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

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.tips_and_updates_outlined,
                    color: AppColors.primaryDark,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Consejo: Si la sartén está demasiado caliente, los alimentos pueden quemarse por fuera y quedar crudos por dentro.',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      // ? botonera para continuar
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 20, 5),
          child: Row(
            children: [
              // Botón anterior
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    // Retroceder paso
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 8,
                  ),
                ),
              ),

              const Spacer(),

              // Botón continuar
              SizedBox(
                width: 160, // prueba 140, 160 o 180
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Siguiente paso
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continuar',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
