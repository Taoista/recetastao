import 'package:flutter/material.dart';

class SearchMain extends StatelessWidget {
  const SearchMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Input con ícono de búsqueda adentro
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: const Icon(Icons.search), // Icono dentro del input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
            ),
          ),
        ),
        // const SizedBox(width: 8),
        // Botón cuadrado, verde, con ícono blanco
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Color de fondo verde
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: const Icon(Icons.search, color: Colors.white), // Ícono blanco
        ),
      ],
    );
  }
}
