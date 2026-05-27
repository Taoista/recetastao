import 'package:flutter/material.dart';



class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;

    return Container(

  decoration: BoxDecoration(
    border: Border(
      top: BorderSide(
        color: Colors.black.withOpacity(0.15),
        width: 1,
      ),
    ),
  ),

  child: NavigationBar(

    backgroundColor: Colors.white,

    indicatorColor: Colors.green.withOpacity(0.18),

    selectedIndex: selectedIndex,

    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

    onDestinationSelected: (index) {
      // setState(() {
      //   selectedIndex = index;
      // });
    },

    destinations: const [

      NavigationDestination(
        selectedIcon: Icon(
          Icons.home,
          color: Colors.green,
        ),
        icon: Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
        label: 'Inicio',
      ),

      NavigationDestination(
        selectedIcon: Icon(
          Icons.search,
          color: Colors.green,
        ),
        icon: Icon(
          Icons.search,
          color: Colors.black,
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
);
  }
}