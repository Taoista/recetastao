import 'package:flutter/material.dart';
import 'package:recetao/core/theme/app_colors.dart';



class HeadWishlist extends StatefulWidget {

  final int countaWishlist;

  const HeadWishlist({super.key, required this.countaWishlist});

  @override
  State<HeadWishlist> createState() => _HeadWishlistState();
}

class _HeadWishlistState extends State<HeadWishlist> {

  int newsWishlist = 0;


  // void updateNewsWishlist() {
  //   setState(() {
  //     newsWishlist = widget.countaWishlist;
  //   });
  // }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: 200,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Círculo de fondo
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight,
              ),
            ),

            // Imagen de la campana
            Image.asset(
              'assets/icons/wishislist_icon.png',
              width: 130,
              height: 130,
            ),

            // Burbuja de notificaciones
            Positioned(
              top: 25,
              right: 35,
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: AppColors.rating,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    widget.countaWishlist.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Text(
        'Tienes ${widget.countaWishlist} Recetas favoritas :)',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryDark,
        ),
      ),
      const SizedBox(height: 10),
      
    ],
  );
  }
}