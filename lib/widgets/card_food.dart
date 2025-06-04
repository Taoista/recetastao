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
            height:200,
            color: Colors.black54, // capa oscura para que el texto blanco se vea
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
               textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
