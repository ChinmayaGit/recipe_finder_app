import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'Recipe.dart';

class DetailedView extends StatelessWidget {
  final Recipe recipe;

  DetailedView(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Colors.black26),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      // Get.back();
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Colors.red.shade50),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),

                ],
              ),
              Image.network(
                  "https://icons.veryicon.com/png/Holiday/Christmas%205/fast%20food.png"),
              Text(
                recipe.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListTile(
                  title: Text("Ingredients:"),
                  subtitle: Text(recipe.ingredients.join(", ")),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        'Instructions:',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ExpandChild(
                        collapsedVisibilityFactor: 0.2,
                        child: Text('${recipe.instructions}'),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(

                        height: 60,
                        child: Center(
                            child: Text(
                              'Servings :',
                              style: TextStyle(color: Colors.teal.shade200,fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            color: Colors.teal.shade200),
                        height: 60,
                        child: Center(
                            child: Text(
                              recipe.servings,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
