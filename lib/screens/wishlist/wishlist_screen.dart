import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recetao/core/database/favoritos_repository.dart';
import 'package:recetao/core/network/api_get_wishslist.dart';
import 'package:recetao/core/theme/app_colors.dart';
import 'package:recetao/models/recipe.dart';
import 'package:recetao/screens/wishlist/card_wish.dart';
import 'package:recetao/screens/wishlist/head_wishlist.dart';
import 'package:recetao/screens/wishlist/skeleton_card_wish.dart';
import 'package:recetao/widgets/main_navigation_bar.dart';

class WishlistScreen extends StatefulWidget {
  static const String routeName = "wishlist_screen";

  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isLoading = false;
  List<Recipe> listFavorites = [];
  int countaWishlist = 0;
  List<String> recipesId = [];
  List<dynamic> favoritos = [];


  Future<void> getDataFavorites() async {
    setState(() {
      listFavorites = [];
      countaWishlist = 0;
      isLoading = false;
    });
    final repository = FavoritosRepository();
    final favorites = await repository.getFavorites();
    // print(favorites);
    // ? ids de las recetas
    recipesId = favorites.map((fav) => fav.idRecipe.toString()).toList();
    // ? id registro db
    favoritos = await FavoritosRepository().getFavorites();
    

    var data = ApiGetWishlist(wishlist: recipesId);
    var response = await data.getWishlist();


    setState(() {
      listFavorites = response;
      countaWishlist = listFavorites.length;
      isLoading = true;
    });
  }

  Future<void> deleteFavorite(int idDbRegister) async {
    final repository = FavoritosRepository();
    await repository.deleteFavorite(idDbRegister);
   
    getDataFavorites();
  }


  @override
  void initState() {
    super.initState();
    getDataFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavigationBar(selectedIndex: 2),
      appBar: AppBar(
        title: Text('Favoritos',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            )),
      ),
      body:ListView(
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 10),
          HeadWishlist(countaWishlist: countaWishlist),
          const SizedBox(height: 10),
          isLoading ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listFavorites.length,
            itemBuilder: (context, index) {
              final item = listFavorites[index];
              return CardWish(
                        idDbRegister: favoritos[index].id,
                        image: item.imgUrl, 
                        title: item.name, 
                        description: item.description, 
                        rating: item.top, 
                        time: item.time.toString(), 
                        portions: item.personas, 
                        idFood: item.id,
                        onDelete: deleteFavorite,
                        );
            },
          ) :
          SkeletonCardWish()
        ],
      ),
    );
  }
}
