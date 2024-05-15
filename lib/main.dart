import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder_app/DetailedView.dart';
import 'package:recipe_finder_app/Recipe.dart';
import 'package:recipe_finder_app/api.dart';
import 'package:recipe_finder_app/components.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Recipe> recipes = [];

  void searchRecipes(String ingredients) async {
    try {
      List<Recipe> fetchedRecipes = await fetchRecipes(ingredients);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBars(
                onSearch: searchRecipes,
              ),
              recipes.length != 0
                  ? SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: ListView.builder(
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          return RecipeResultItem(recipe: recipes[index]);
                        },
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CatBox(
                                  title: "Breakfast",
                                  img:
                                      "https://t3.ftcdn.net/jpg/00/78/87/94/360_F_78879462_KyMC4iWhDHLlEEZDAOLiDWPuubnAaMMk.jpg"),
                              CatBox(
                                  title: "Dessert",
                                  img:
                                      "https://t3.ftcdn.net/jpg/01/76/33/14/360_F_176331484_nLHY9EoW0ETwPZaS9OBXPGbCJhT70GZe.jpg"),
                              CatBox(
                                  title: "Lunch",
                                  img:
                                      "https://media.istockphoto.com/id/1321195603/photo/people-having-balanced-diet-from-lunch-boxes.jpg?s=612x612&w=0&k=20&c=yieHclin0zByT8mXbK1x7dlf_4bG6yqeBRszUjyYBbc="),
                              CatBox(
                                  title: "Meal",
                                  img:
                                      "https://t3.ftcdn.net/jpg/01/76/33/14/360_F_176331484_nLHY9EoW0ETwPZaS9OBXPGbCJhT70GZe.jpg"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Most popular",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: CarouselSlider(
                            options:
                                CarouselOptions(height: 200.0, autoPlay: true),
                            items: [
                              "https://i0.wp.com/picjumbo.com/wp-content/uploads/homemade-dessert-tiramisu-served-in-individual-glasses.jpg?w=2210&quality=7",
                              "https://i0.wp.com/picjumbo.com/wp-content/uploads/homemade-pastry-cinnamon-swirls.jpg?w=2210&quality=70",
                              "https://i0.wp.com/picjumbo.com/wp-content/uploads/korean-bibimbap-flatlay.jpg?w=2210&quality=70",
                              "https://i0.wp.com/picjumbo.com/wp-content/uploads/making-homemade-apple-strudel.jpg?w=2210&quality=70"
                            ].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Image.network(i),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
              recommended(
                  "Apple Pie",
                  "https://t4.ftcdn.net/jpg/02/27/44/65/360_F_227446517_6RiH14SUE2s8HieDibxLbpn8b1ugdqwZ.jpg",
                  "30 Minute | 4 Serves"),
              recommended(
                  "Idli",
                  "https://vaya.in/recipes/wp-content/uploads/2018/02/Idli-and-Sambar-1.jpg",
                  "45 Minute | 2 Serves"),
              recommended(
                  "Milk Shake",
                  "https://i.ytimg.com/vi/-MTa9JY5WnA/maxresdefault.jpg",
                  "10 Minute | 4 Serves"),
            ],
          ),
        ),
      ),
    );
  }
}

recommended(title, img, des) {
  return Stack(
    children: [
      Container(
        width: Get.width,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover, // Adjust the fit based on your preference
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30, // Adjust the font size based on your preference
              color: Colors
                  .white, // Adjust the text color based on your preference
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.black.withOpacity(0.5),
          // Adjust the opacity or color based on your preference
          padding: EdgeInsets.all(8.0),
          child: Text(
            des,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18, // Adjust the font size based on your preference
              color: Colors
                  .white, // Adjust the text color based on your preference
            ),
          ),
        ),
      ),
    ],
  );
}

CatBox({required String title, required String img}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: Colors.white,
      ),
      height: 60,
      width: 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.network(
              img,
              fit: BoxFit.cover, // Ensure the image fills the container
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.black26, // Black color with 50% opacity
            ),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

class RecipeResultItem extends StatelessWidget {
  final Recipe recipe;

  RecipeResultItem({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://icons.veryicon.com/png/Holiday/Christmas%205/fast%20food.png"),
        ),
        title: Text(recipe.title),
        subtitle: Text(recipe.servings),
        onTap: () {
          Get.to(DetailedView(recipe));
        },
      ),
    );
  }
}
