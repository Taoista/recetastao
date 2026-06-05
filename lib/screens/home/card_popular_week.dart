import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recetao/core/database/db_favoritos.dart';
import 'package:recetao/core/database/favoritos_repository.dart';
import 'package:recetao/core/theme/app_colors.dart';

class CardPopularWeek extends StatefulWidget {
  final int idFood;
  final String name;
  final String imgUrl;

  const CardPopularWeek(
      {super.key,
      required this.idFood,
      required this.name,
      required this.imgUrl});

  @override
  State<CardPopularWeek> createState() => _CardPopularWeekState();
}

class _CardPopularWeekState extends State<CardPopularWeek> {

  bool inFavorite = false;

  void getWishList() async {
    final repository = FavoritosRepository();
    
    final exists = inFavorite = await repository.getStateWishItem(widget.idFood);
    
    setState(() {
      inFavorite = exists;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishList();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  context.push("/food/${widget.idFood}");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.imgUrl,
                    height: 120,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: () async {
                    final repository = FavoritosRepository();
                    await repository.insertFavorite(
                      DbFavoritos(idRecipe: widget.idFood),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: inFavorite ? AppColors.primaryDark : AppColors.backgroundSoft,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: inFavorite ? AppColors.backgroundSoft : AppColors.primaryDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              context.push("/food/${widget.idFood}");
            },
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
