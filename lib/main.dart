import 'package:flutter/material.dart';
import 'package:recetastao/router/router.dart';
import 'package:recetastao/screens/home/home_screen.dart';
// https://www.figma.com/design/uJYD4hxSzMLTX1Zy7eGS7r/Food-Recipe-App--Community-?node-id=1-3&p=f&t=Pn177xlAvffpRrcx-0
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "recetas tao",
      routerConfig: appRouter(),
      theme: ThemeData(
        useMaterial3: true,
        // primaryColor: colorBG,
      ),
    );
  }
}