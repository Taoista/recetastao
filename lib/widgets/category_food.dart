import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CategoryFood extends StatefulWidget {

  final int idFood;
  final String img;
  final String title;

  const CategoryFood({super.key, required this.idFood, required this.img, required this.title});

  @override
  State<CategoryFood> createState() => _CategoryFoodState();
}

class _CategoryFoodState extends State<CategoryFood> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.push("/card_category_food/${widget.idFood}");
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias, // para que el borde redondeado se aplique a la imagen
        elevation: 5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(widget.img),
              fit: BoxFit.cover,
              height: 200,
            ),
            Container(
              height:200,
              color: Colors.black54, // capa oscura para que el texto blanco se vea
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.title,
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
      ),
    );
  }
}
