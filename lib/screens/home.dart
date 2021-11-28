import 'package:cook_mate/screens/detail_recipe.dart';
import 'package:flutter/material.dart';
import 'package:cook_mate/model/recipe.api.dart';
import 'package:cook_mate/model/recipe.dart';
import 'package:cook_mate/screens/widget/recipe_card.dart';
import 'package:cook_mate/screens/information.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> recipe;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    recipe = await RecipeApi.getRecipe();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('CookMate', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Icon(Icons.restaurant_menu)
          ],
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Information(),
                    ),
                  ),
              icon: Icon(
                Icons.info_outline,
                size: 24,
              ))
        ],
        ),
        body: _isloading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: recipe.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: RecipeCard(
                      title: recipe[index].name,
                      cookTime: recipe[index].totalTime,
                      country: recipe[index].country,
                      thumbnailUrl: recipe[index].images,
                      description: recipe[index].description,
                      videoUrl: recipe[index].videoUrl,
                    ),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailRecipe(
                                    name: recipe[index].name,
                                    totalTime: recipe[index].totalTime,
                                    country: recipe[index].country,
                                    images: recipe[index].images,
                                    description: recipe[index].description,
                                    videoUrl: recipe[index].videoUrl,
                                    instructions: recipe[index].instructions,
                                    sections: recipe[index].sections,
                                  )))
                    },
                  );
                },
              ));
  }
}
