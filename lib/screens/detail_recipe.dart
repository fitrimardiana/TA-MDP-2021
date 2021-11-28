import 'package:cook_mate/model/recipe.dart';
import 'package:cook_mate/screens/widget/recipe_card.dart';
import 'package:flutter/material.dart';

class DetailRecipe extends StatelessWidget {
  final String name;
  final String totalTime;
  final String country;
  final String images;
  final String description;
  final String videoUrl;
  final List<Instruction> instructions;
  final List<Section> sections;
 
 DetailRecipe({
 required this.name,
 required this.totalTime,
 required this.country,
 required this.images,
 required this.description,
 required this.videoUrl,
 required this.instructions,
 required this.sections}
 );


  @override
  Widget build(BuildContext context) {
    List<Component> components = List.from(sections[0].components);
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Recipe Details', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 10),
          Icon(Icons.list_alt)
        ],
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              RecipeCard(
                  title: name,
                  cookTime: totalTime,
                  country: country,
                  thumbnailUrl: images,
                  description: description,
                  videoUrl: videoUrl,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 22, vertical:10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                            textAlign: TextAlign.left
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(description,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.justify),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(description,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.justify),
                          ),
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ingredients',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                            textAlign: TextAlign.left
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: components.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                              return ListTile(
                                title: Text(components[index].rawText),
                              );
                            })
                          ),
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Instructions',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                            textAlign: TextAlign.left
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: instructions.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                              return ListTile(
                                title: Text(instructions[index].displayText),
                              );
                            })
                          )
                      ],
                    ),
                  )
            ],
          ),
        ),
      ),
    );
    
  }

}