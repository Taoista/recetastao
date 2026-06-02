import 'package:flutter/material.dart';
import 'package:recetao/models/recipe.dart';

class SearchCategory extends StatefulWidget {
  final List<Recipe> listRecipes;
  final List<Recipe> listOriginalRecipes;
  final Function(List<Recipe>) onFilter;

  const SearchCategory(
      {super.key, required this.listRecipes, required this.onFilter, required this.listOriginalRecipes, });

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  TextEditingController keyController = TextEditingController();
  List<Recipe> allRecipes = [];

  @override
  void initState() {
    super.initState();
    allRecipes = widget.listRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        controller: keyController,
        onSubmitted: (value) {
          if (widget.listRecipes.isEmpty) return;
          {
            setState(() {
              if (widget.listRecipes.isEmpty) return;

               final filteredList = widget.listRecipes.where((recipe) {
                  return recipe.searchText
                      .toLowerCase()
                      .contains(value.toLowerCase());
                }).toList();


              widget.onFilter(filteredList);
            });
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
                setState(() {
                  widget.onFilter(widget.listOriginalRecipes);
                  keyController.text = "";
                });
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
