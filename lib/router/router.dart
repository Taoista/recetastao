import 'package:go_router/go_router.dart';
import 'package:recetastao/screens/card_food/card_food_screen.dart';
import 'package:recetastao/screens/home/home_screen.dart';

appRouter() {
  return GoRouter(initialLocation: "/home", routes: [
    GoRoute(
      path: "/home",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/card_food/:id_food",
      name: CardFoodScreen.name,
      builder: (context, state) {
              String idFood = state.pathParameters["id_food"]!;
              return CardFoodScreen(idFood: idFood,);
      }),
  ]);
}
