import 'package:go_router/go_router.dart';
import 'package:recetastao/screens/card_category_food/card_category_screen.dart';
import 'package:recetastao/screens/food_screen/food_screen.dart';
import 'package:recetastao/screens/home/home_screen.dart';
import 'package:recetastao/screens/ingredient/ingredient_screen.dart';
import 'package:recetastao/screens/preparation/preparation_screen.dart';
import 'package:recetastao/screens/start/start_scree.dart';

appRouter() {
  return GoRouter(initialLocation: "/start", routes: [
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
  ]);
}
