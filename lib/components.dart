import 'package:flutter/material.dart';
import 'package:recipe_finder_app/api.dart'; // Import the fetchRecipes function

class SearchBars extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function(String) onSearch;

  SearchBars({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Enter ingredients...',
        prefixIcon: Icon(Icons.search),
      ),
      onSubmitted: (value) {
        onSearch(value);
      },
    );
  }
}
