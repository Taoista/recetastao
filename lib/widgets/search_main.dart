import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchMain extends StatelessWidget {
  const SearchMain({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController keyController = TextEditingController();

    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        controller: keyController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            context.push("/search/$value");
          } 
        },
        decoration: InputDecoration(
          hintText: 'Buscar recetas, ingredientes...',
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade700,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                keyController.clear();
              },
              icon: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
