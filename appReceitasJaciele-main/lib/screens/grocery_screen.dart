import 'package:flutter/material.dart';
import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key}); // Correção na declaração do construtor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //1
          final manager = Provider.of<GroceryManager>(context, listen: false);
          //2
          Navigator.push(
            context,
            //3
            MaterialPageRoute(
              //4
              builder: (context) => GroceryItemScreen(
                //5
                onCreate: (item) {
                  //6
                  manager.addItem(item);
                  //7
                  Navigator.pop(context);
                },
                //8
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItens.isNotEmpty) {
          // TODO: Adicionar o GroceryListScreen
          return Container();
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
