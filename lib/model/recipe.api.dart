import 'dart:convert';
import 'package:cook_mate/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "50", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "x-rapidapi-key": "9fffe1a002msh65d281cc154cc67p15fe47jsnfcc9a0c29d00",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Recipe.recipefromSnapshot(_temp);
  }
}
