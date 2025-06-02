import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {

  final String img;
  final String title;

  const CardFood({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias, // para que el borde redondeado se aplique a la imagen
      elevation: 5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: AssetImage('assets/images/01.jpg'),
            fit: BoxFit.cover,
            height: 200,
          ),
          Container(
            color: Colors.black45, // capa oscura para que el texto blanco se vea
            alignment: Alignment.center,
            height: 200,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
