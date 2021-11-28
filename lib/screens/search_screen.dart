import 'package:flutter/material.dart';
import 'package:cook_mate/model/meal_plan_model.dart';
import 'package:cook_mate/model/api_services.dart';
import 'package:cook_mate/screens/meals_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _diets = [
    'None',
    'Gluten Free',
    'Ketogenic',
    'Vegetarian',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Low FODMAP',
    'Whole30',
  ];

  double _targetCalories = 2250;
  String _diet = 'None';

  @override
  void _searchMealPlan() async {
    MealPlan mealPlan = await ApiService.instance.generateMealPlan(
      targetCalories: _targetCalories.toInt(),
      diet: _diet,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MealsScreen(mealPlan: mealPlan),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Plan', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 10),
          Icon(Icons.search)
        ],
      )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'My Daily Meal Planner',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black), textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                      children: [
                        TextSpan(
                            text: _targetCalories.truncate().toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' cal',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange)),
                      ]),
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Colors.lightBlue[100],
                    trackHeight: 6,
                  ),
                  child: Slider(
                    min: 0,
                    max: 4500,
                    value: _targetCalories,
                    onChanged: (value) => setState(() {
                      _targetCalories = value.round().toDouble();
                    }),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButtonFormField(
                    items: _diets.map((String priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(
                          priority,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Diet',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _diet = value!;
                      });
                    },
                    value: _diet,
                  ),
                ),
                //Space
                SizedBox(height: 30),

                ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.orange),
                  child: Text('Search',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: _searchMealPlan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
