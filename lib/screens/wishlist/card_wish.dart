import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/theme/app_colors.dart';

class CardWish extends StatefulWidget {
  final int idDbRegister;
  final String image;
  final String title;
  final String description;
  final double rating;
  final String time;
  final int portions;
  final int idFood;
  final Function(int) onDelete;

  const CardWish(
      {super.key,
      required this.idDbRegister,
      required this.image,
      required this.title,
      required this.description,
      required this.rating,
      required this.time,
      required this.portions,
      required this.idFood,
      required this.onDelete
      });

  @override
  State<CardWish> createState() => _CardWishState();
}

class _CardWishState extends State<CardWish> {
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
                          widget.onDelete(widget.idDbRegister);
                        },
                        child: Icon(
                          Icons.delete,
                          color: AppColors.favorite,
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
