import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recetastao/core/theme/app_colors.dart';

class MainNavigationBar extends StatefulWidget {
  final int selectedIndex;

  const MainNavigationBar({super.key, required this.selectedIndex});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.textPrimary,
              width: 0,
            ),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: AppColors.primarySoft,
            labelTextStyle: WidgetStatePropertyAll(
              TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          child: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              if(index == 0){
                context.push("/home");
              } 
              if(index == 1){
                context.push("/search/''");
              } 
            },
            destinations: [
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: AppColors.primaryDark,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.primaryDark,
                ),
                label: 'Inicio',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.search,
                  color: AppColors.primaryDark,
                ),
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryDark,
                ),
                label: 'Buscar',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.favorite,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                label: 'Favoritos',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                label: 'Perfil',
              ),
            ],
          ),
        ));
  }
}
