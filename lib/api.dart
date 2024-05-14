import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_finder_app/Recipe.dart';

// Future<List<Recipe>> fetchRecipes(List<String> ingredients) async {
//   final apiKey =
//       "JVBxsRU6sxxtyuy5BlCNvw==t4qEqn7riGeW93mo"; // Replace with your API key
//   final apiUrl = Uri.parse('https://api.api-ninjas.com/v1/recipe');
//
//   final response = await http.get(
//     apiUrl.replace(queryParameters: {'X-Api-Key': apiKey}),
//   );
//   print('Response status code: ${response.statusCode}');
//   print('Response body: ${response.body}');
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     List<Recipe> filteredRecipes = data
//         .map((json) => Recipe.fromJson(json))
//         .where((recipe) => _containsAllIngredients(recipe, ingredients))
//         .toList();
//     return filteredRecipes;
//   } else {
//     throw Exception('Failed to fetch recipes');
//   }
// }
//
// bool _containsAllIngredients(Recipe recipe, List<String> ingredients) {
//   for (String ingredient in ingredients) {
//     if (!recipe.ingredients.contains(ingredient)) {
//       return false;
//     }
//   }
//   return true;
// }

// Single Ingredient
Future<List<Recipe>> fetchRecipes(String query) async {
  final apiKey = "JVBxsRU6sxxtyuy5BlCNvw==t4qEqn7riGeW93mo";
  final apiUrl = Uri.parse('https://api.api-ninjas.com/v1/recipe');
  final response = await http.get(
    apiUrl.replace(queryParameters: {'query': query}),
    headers: {'X-Api-Key': apiKey},
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    print(data);
    return data.map((json) => Recipe.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch recipes');
  }
}
