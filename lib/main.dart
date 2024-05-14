import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder_app/Recipe.dart';
import 'package:recipe_finder_app/api.dart';
import 'package:recipe_finder_app/components.dart';

void main() => runApp(const GetMaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Recipe> recipes = [];

  void searchRecipes(String query) async {
    try {
      List<Recipe> fetchedRecipes = await fetchRecipes(query);
      setState(() {
        recipes = fetchedRecipes;
      });
    } catch (e) {
      print('Error fetching recipes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Finder'),
      ),
      body: Column(
        children: [
          SearchBars(
            onSearch: searchRecipes,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeResultItem(recipe: recipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}



class RecipeResultItem extends StatelessWidget {
  final Recipe recipe;

  RecipeResultItem({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(recipe.title),
      subtitle: Text(recipe.servings),
      onTap: () {
      },
    );
  }
}

class DetailedView extends StatelessWidget {
  final Recipe recipe;

  DetailedView(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Column(
        children: [
          Text('Ingredients: ${recipe.ingredients.join(", ")}'),
          Text('Instructions: ${recipe.instructions}'),
          Text('servings Information: ${recipe.servings}'),
        ],
      ),
    );
  }
}
