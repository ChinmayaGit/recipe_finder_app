import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_finder_app/Recipe.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Recipe>> fetchRecipes(String ingredients) async {
  final apiUrl = Uri.parse('http://10.0.2.2:3000/recipes/filter?ingredients=$ingredients');

  final response = await http.get(apiUrl);
  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    print(data);
    return data.map((json) => Recipe.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch recipes');
  }
}

bool _containsAllIngredients(Recipe recipe, List<String> ingredients) {
  for (String ingredient in ingredients) {
    if (!recipe.ingredients.contains(ingredient)) {
      return false;
    }
  }
  return true;
}
// Single Ingredient
// Future<List<Recipe>> fetchRecipes(String query) async {
//   final apiKey = "xyz";
//   final apiUrl = Uri.parse('https://api.api-ninjas.com/v1/recipe');
//   final response = await http.get(
//     apiUrl.replace(queryParameters: {'query': query}),
//     headers: {'X-Api-Key': apiKey},
//   );
// print(response);
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     print(data);
//     return data.map((json) => Recipe.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to fetch recipes');
//   }
// }
