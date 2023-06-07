import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/simple_recipe.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // TODO: Adicione aqui o Recipes GridView
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
