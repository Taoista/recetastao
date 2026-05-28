import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetastao/core/theme/app_colors.dart';
import 'package:recetastao/screens/alerts/butons_filters.dart';
import 'package:recetastao/screens/alerts/card_alert.dart';
import 'package:recetastao/screens/alerts/head_alert.dart';
import 'package:recetastao/widgets/main_navigation_bar.dart';

class AlertsScreen extends StatefulWidget {
  static const String name = "alerts_screen";

  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  int newAlerts = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(),
      appBar: AppBar(
        title: Text('Alertas',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          ButtonsFilters(newAlerts: newAlerts),
          HeadAlert(newAlerts: newAlerts),
          const CardAlert(
            title: 'Nueva Receta',
            description:
                'Descubre una receta que\nte puede encantar: Buddha Bowl',
            timeAgo: 'Hace 2 horas',
            imagePath: 'assets/images/01.jpg',
            isNew: true,
            tipeIcon: 0,
          ),
          const SizedBox(height: 10),
          // const CardAlert(
          //   title: 'Lista de Compra',
          //   description:
          //       'Descubre una receta que\nte puede encantar: Buddha Bowl',
          //   timeAgo: 'Hace 2 horas',
          //   imagePath: 'assets/images/01.jpg',
          //   isNew: true,
          //   tipeIcon: 1,
          // ),
          // const SizedBox(height: 10),
          // const CardAlert(
          //   title: 'Nota Sistema',
          //   description:
          //       'Descubre una receta que\nte puede encantar: Buddha Bowl',
          //   timeAgo: 'Hace 2 horas',
          //   imagePath: 'assets/images/01.jpg',
          //   isNew: true,
          //   tipeIcon: 2,
          // ),
          // const SizedBox(height: 10),
          Text(
            'Antiguas',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 10),
          const CardAlert(
            title: 'Recordatorio',
            description:
                'Descubre una receta que\nte puede encantar: Buddha Bowl',
            timeAgo: 'Hace 2 horas',
            imagePath: 'assets/images/01.jpg',
            isNew: false,
            tipeIcon: 3,
          ),
        ],
      ),
    );
  }
}
