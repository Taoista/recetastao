import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/theme/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT CONTENT
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HELLO
            Row(
              children: [
                Text('Hola Tao',
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryDark,
                    )),
                const SizedBox(width: 8),
                Icon(
                  Icons.waving_hand_rounded,
                  color: Colors.orange.shade400,
                  size: 28,
                ),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              '¿Qué vas a cocinar hoy?',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        /// NOTIFICATION BUTTON
        InkWell(
          onTap: () {
            context.push("/alerts");
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
