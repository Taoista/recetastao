import 'package:flutter/material.dart';
import 'package:recetastao/core/theme/app_colors.dart';

class ButtonsFilters extends StatefulWidget {
  final int newAlerts;
  const ButtonsFilters({super.key, required this.newAlerts});

  @override
  State<ButtonsFilters> createState() => _ButtonsFiltersState();
}

class _ButtonsFiltersState extends State<ButtonsFilters> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedOption == 0
                  ? AppColors.primaryDark
                  : AppColors.primarySoft,
              foregroundColor:
                  selectedOption == 0 ? Colors.white : AppColors.primaryDark,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Todas'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedOption == 1
                  ? AppColors.primaryDark
                  : AppColors.primarySoft,
              foregroundColor:
                  selectedOption == 1 ? Colors.white : AppColors.primaryDark,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Recetas'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedOption == 2
                  ? AppColors.primaryDark
                  : AppColors.primarySoft,
              foregroundColor:
                  selectedOption == 2 ? Colors.white : AppColors.primaryDark,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Recordar'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedOption == 3
                  ? AppColors.primaryDark
                  : AppColors.primarySoft,
              foregroundColor:
                  selectedOption == 3 ? Colors.white : AppColors.primaryDark,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Sistema'),
          ),
        ),
      ],
    );
  }
}
