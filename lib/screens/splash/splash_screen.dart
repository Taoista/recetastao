import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recetao/core/theme/app_colors.dart';




class SplashScreen extends StatefulWidget {

  static const String name = "splash_sreen";
  
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    _loadApp();
  }

  Future<void> _loadApp() async {
    // Simula carga
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    context.push("/start");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [

        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            'assets/images/wallpapers/wallpaper_splash.png',
            fit: BoxFit.cover,
          ),
        ),

        // Oscurece la imagen para que el logo destaque
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.45),
          ),
        ),

        // Contenido
        Center(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/icono.png',
                  width: 140,
                ),

                const SizedBox(height: 24),

                const Text(
                  'Recetao',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Las mejores recetas en un solo lugar',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                const CircularProgressIndicator(
                  color: AppColors.backgroundSoft,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }
}