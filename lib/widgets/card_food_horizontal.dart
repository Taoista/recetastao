import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/database/db_favoritos.dart';
import 'package:recetao/core/database/favoritos_repository.dart';
import 'package:recetao/core/theme/app_colors.dart';

class CardFoodHorizontal extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final double rating;
  final String time;
  final int portions;
  final int idFood;

  const CardFoodHorizontal(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.rating,
      required this.time,
      required this.portions, required this.idFood});

  @override
  State<CardFoodHorizontal> createState() => _CardFoodHorizontalState();
}

class _CardFoodHorizontalState extends State<CardFoodHorizontal> {

  bool stateWishList = false;

  void getWishList() async {
    final repository = FavoritosRepository();
    
    final exists = stateWishList = await repository.getStateWishItem(widget.idFood);
    
    setState(() {
      stateWishList = exists;
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
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          InkWell(
            onTap: () {
              context.push("/food/${widget.idFood}");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                widget.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: InkWell(
                        onTap: () async {
                          if(stateWishList){

                          }else{
                            final repository = FavoritosRepository();
                            await repository.insertFavorite(
                              DbFavoritos(idRecipe: widget.idFood),
                            );
                          }
                        },
                        child: Icon(
                          stateWishList ? Icons.favorite_sharp : Icons.favorite_border,
                          color: AppColors.primaryDark,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.rating,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.access_time_rounded,
                      color: AppColors.primaryDark,
                      size: 18,
                    ),
                    const SizedBox(width: 1),
                    Text(
                      widget.time,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.person_outline_rounded,
                      color: AppColors.primaryDark,
                      size: 18,
                    ),
                    const SizedBox(width: 1),
                    Text(
                      '${widget.portions} porciones',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
