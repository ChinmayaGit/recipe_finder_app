import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBars extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function(String) onSearch;

  SearchBars({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), // Add rounded border
          border: Border.all(color: Colors.blue), // Add border color
        ),
        child: Row( // Wrap the content in a Row
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter ingredients separated by commas...',
                    border: InputBorder.none, // Hide the default border
                    prefixIcon: Icon(Icons.fastfood,color: Colors.green,),
                  ),
                  onSubmitted: onSearch,
                ),
              ),
            ),
            GestureDetector( // Search icon
              onTap: (){
                print("hello");
                onSearch(_controller.text);
              },
              child: Container(
                width: 65,
                height: 48,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.orange,
                ),
                child: Icon(Icons.search,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}