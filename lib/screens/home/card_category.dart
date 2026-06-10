import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/theme/app_colors.dart';

class CardCategory extends StatelessWidget {
  final int idFood;
  final String nameCategory;
  final String pathImage;

  const CardCategory(
      {super.key,
      required this.idFood,
      required this.nameCategory,
      required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/category/$idFood");
      },
      child: Column(
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
          SizedBox(
            width: 100,
            height: 35,
            child: Text(
              nameCategory,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
