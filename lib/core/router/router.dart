import 'package:go_router/go_router.dart';
import 'package:recetao/screens/alerts/alerts_screen.dart';
import 'package:recetao/screens/card_category_food/card_category_screen.dart';
import 'package:recetao/screens/category/category_screen.dart';
import 'package:recetao/screens/food_screen/food_screen.dart';
import 'package:recetao/screens/home/home_screen.dart';
import 'package:recetao/screens/ingredient/ingredient_screen.dart';
import 'package:recetao/screens/popular/popular_screen.dart';
import 'package:recetao/screens/preparation/preparation_screen.dart';
import 'package:recetao/screens/search/search_screen.dart';
import 'package:recetao/screens/splash/splash_screen.dart';
import 'package:recetao/screens/start/start_scree.dart';
import 'package:recetao/screens/top/top_screen.dart';
import 'package:recetao/screens/wishlist/wishlist_screen.dart';

appRouter() {
  return GoRouter(initialLocation: "/", routes: [
  // return GoRouter(initialLocation: "/food/2", routes: [
  // return GoRouter(initialLocation: "/preparation/2", routes: [
   GoRoute(
      path: "/",
      name: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/start",
      name: StartScreen.name,
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: "/home",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/alerts",
      name: AlertsScreen.name,
      builder: (context, state) => const AlertsScreen(),
    ),
     GoRoute(
      path: "/wishlist",
      name: WishlistScreen.routeName,
      builder: (context, state) => const WishlistScreen(),
    ),
    GoRoute(
     path: "/search/:key_search",
      name: SearchScreen.routeName,
      builder: (context, state) {
              String keySearch = state.pathParameters["key_search"]!;
              return SearchScreen(keySearch: keySearch);
    }),
    GoRoute(
      path: "/card_category_food/:id_food",
      name: CardCategoryScreen.name,
      builder: (context, state) {
              String idFood = state.pathParameters["id_food"]!;
              return CardCategoryScreen(idFood: idFood,);
    }),
    GoRoute(
      path: "/food/:id_food",
      name: FoodScreen.name,
      builder: (context, state) {
              String idFood = state.pathParameters["id_food"]!;
              return FoodScreen(idFood: idFood,);
    }),
    GoRoute(
      path: "/preparation/:id_food",
      name: PreparationScreen.name,
      builder: (context, state) {
              String idFood = state.pathParameters["id_food"]!;
              return PreparationScreen(idFood: idFood,);
      }),
     GoRoute(
      path: "/ingredient/:id_food",
      name: IngredientScreen.name,
      builder: (context, state) {
              String idFood = state.pathParameters["id_food"]!;
              return IngredientScreen(idFood: idFood,);
      }),
      GoRoute(
      path: "/category/:id_category",
      name: CategoryScreen.routeName,
      builder: (context, state) {
              String idCategory = state.pathParameters["id_category"]!;
              return CategoryScreen(idCategory: idCategory);
      }),
      GoRoute(
        path: "/top",
        name: TopScreen.name,
        builder: (context, state) => const TopScreen(),
      ),
      GoRoute(
        path: "/popular",
        name: PopularScreen.name,
        builder: (context, state) => const PopularScreen(),
      ),
  ]);
}
