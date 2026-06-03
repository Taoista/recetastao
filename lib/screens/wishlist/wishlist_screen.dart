import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/theme/app_colors.dart';


class WishlistScreen extends StatelessWidget {

  static const String routeName = "wishlist_screen";

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 10),
          Text(
            'Recetas que te han gustado',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}