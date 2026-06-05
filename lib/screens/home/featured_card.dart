import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/database/db_favoritos.dart';
import 'package:recetao/core/database/favoritos_repository.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';

class FeaturedCard extends StatefulWidget {

  final Recipe recipe;

  const FeaturedCard({super.key, required this.recipe});

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  bool isLoading = true;

   bool stateWishList = false;

  void getWishList() async {
    final repository = FavoritosRepository();
    
    final exists = stateWishList = await repository.getStateWishItem(widget.recipe.id);
    
    setState(() {
      stateWishList = exists;
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Destacados',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Ver todas',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// CARD
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: Image.network(
                  widget.recipe.imgUrl,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// CONTENT
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TEXTS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.recipe.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${widget.recipe.time} min",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '•',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                'Fácil',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// FAVORITE ICON
                    InkWell(
                      onTap: () async {
                        final repository = FavoritosRepository();
                        await repository.insertFavorite(
                            DbFavoritos(idRecipe: widget.recipe.id),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: stateWishList ? Colors.grey.shade100 : AppColors.background,
                          shape: BoxShape.circle,
                        ),
                        child: Icon( 
                          Icons.favorite_border,
                          color: stateWishList ? Colors.grey.shade100 : AppColors.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
