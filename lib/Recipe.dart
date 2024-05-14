class Recipe {
  final String title;
  final List<String> ingredients;
  final String servings;
  final String instructions;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.servings,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      ingredients: List<String>.from(json['ingredients'].split('|')),
      servings: json['servings'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'ingredients': ingredients.join('|'),
      'servings': servings,
      'instructions': instructions,
    };
  }
}