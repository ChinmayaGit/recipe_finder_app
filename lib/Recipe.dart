class Recipe {
  final int id;
  final String title;
  final String servings;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.id,
    required this.title,
    required this.servings,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'] ?? 'Unknown Title',
        servings:json['servings'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: json['instructions'] ?? 'No instructions available',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'servings': servings,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }
}
