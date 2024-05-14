import 'dart:convert';

import 'package:recipe_finder_app/Recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveFavoriteRecipe(Recipe recipe) async {
  final prefs = await SharedPreferences.getInstance();
  final favorites = prefs.getStringList('favorites') ?? [];
  favorites.add(json.encode(recipe.toJson()));
  await prefs.setStringList('favorites', favorites);
}

Future<List<Recipe>> getFavoriteRecipes() async {
  final prefs = await SharedPreferences.getInstance();
  final favorites = prefs.getStringList('favorites') ?? [];
  return favorites.map((json) => Recipe.fromJson(jsonDecode(json))).toList();
}
