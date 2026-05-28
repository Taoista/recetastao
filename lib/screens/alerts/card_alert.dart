import 'package:flutter/material.dart';
import 'package:recetastao/core/theme/app_colors.dart';

class CardAlert extends StatefulWidget {

  final String title;
  final String description;
  final String timeAgo;
  final String imagePath;
  final bool isNew;
  final int tipeIcon;

  const CardAlert({super.key, required this.title, required this.description, required this.timeAgo, required this.imagePath, required this.isNew, required this.tipeIcon});

  @override
  State<CardAlert> createState() => _CardAlertState();
}

class _CardAlertState extends State<CardAlert> {

  IconData? tipeIcon;

  IconData setTipeIcon() {
    switch (widget.tipeIcon) {
      case 0:
        return Icons.restaurant_menu_rounded;
      case 1:
        return Icons.favorite_rounded;
      case 2:
        return Icons.comment_rounded;
      default:
        return Icons.timelapse_rounded;
    }
  }


  @override
  initState() {
    super.initState();
    tipeIcon = setTipeIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.imagePath,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 14),

          // Contenido
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        tipeIcon,
                        size: 15,
                        color: AppColors.primaryLight,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Text(
                      '5 min',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            width: 10,
            height: 10,
            decoration:  BoxDecoration(
              color: widget.isNew ? AppColors.rating : AppColors.primarySoft,
              shape: BoxShape.circle,
            ),
          ),
          
        ],
        
      ),
      
    );
  }
}
