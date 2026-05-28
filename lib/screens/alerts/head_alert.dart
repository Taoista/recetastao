import 'package:flutter/material.dart';
import 'package:recetastao/core/theme/app_colors.dart';

class HeadAlert extends StatefulWidget {
  final int newAlerts;

  const HeadAlert({super.key, required this.newAlerts});

  @override
  State<HeadAlert> createState() => _HeadAlertState();
}

class _HeadAlertState extends State<HeadAlert> {
  int newAlerts = 0;

  void getNewAlerts() {
    setState(() {
      newAlerts = widget.newAlerts;
    });
  }

  @override
  initState() {
    super.initState();
    getNewAlerts();
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
              'assets/icons/head_alert2.png',
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
                    newAlerts.toString(),
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
        'Tienes $newAlerts nuevas notificaciones sin ver',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryDark,
        ),
      ),
      const SizedBox(height: 10),

    ]);
  }
}
