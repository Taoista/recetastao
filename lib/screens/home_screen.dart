import 'package:flutter/material.dart';
import 'package:recetastao/models/type_foods.dart';
import 'package:recetastao/widgets/card_food.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<TypeFood> listTypeFoods = getTypeFoods();

  Future<void>loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<TypeFood> listaTypeFoods = getTypeFoods();

    setState(() {
      listTypeFoods = listaTypeFoods;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      // controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                      // onSubmitted: (_) => _searchFoods(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.search),
                ),
              ],),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2/2,
                  children: listTypeFoods.map((food) {
                    // final String image = typeFoods.firstWhere((e) => e['id'] == food.id)['img'];
                    return CardFood(
                      img: food.img,
                      title: food.nombre,
                    );
                  }).toList(),
                ),
              )
              ),
          ],
        ),
        );
  }
}