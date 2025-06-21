import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recetastao/models/foods.dart';

class CardFood extends StatelessWidget {
  final Foods food;

  const CardFood({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card
        Container(
          margin: const EdgeInsets.only(top: 80),
          padding:
              const EdgeInsets.only(top: 80, bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 146, 145, 145),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 220,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // <-- agrega esto
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Espacio flexible entre el título y la fila inferior
              const Spacer(),
              // Fila inferior: Time y Bookmark
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tiempo",
                        style: TextStyle(
                          color: Color.fromARGB(255, 199, 198, 198),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${food.time} Mins",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8), // espacio interno
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      color:
                          Colors.black, // puedes cambiar el color si prefieres
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),

        // Imagen circular que sobresale arriba
       
        Positioned(
          top: 0,
          left: 30,
          right: 30,
          child: InkWell(
            onTap: (){
              context.push("/food/${food.id}");
            },
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/images/foods/food_01.png'), // pon tu imagen aquí
            ),
          ),
        ),

        // Rating estrella
        Positioned(
          top: 10,
          right: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.star, size: 18, color: Colors.orange),
                SizedBox(width: 5),
                Text(
                  food.top.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
