import 'package:flutter/material.dart';
import 'package:foodrecipe/constants.dart';
import 'package:foodrecipe/screens/food_recipe_page.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:foodrecipe/components/component.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xFF444a5a),
        leading: Icon(
          Icons.fastfood,
        ),
        title: Text('Food Recipe App '),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                LineAwesomeIcons.code,
                color: Colors.green,
                size: 50.0,
              ),
              Text(
                IntroTextForApp,
                style: IntroTextStyle,
              ),
              SizedBox(
                height: 25.0,
              ),
              UnderlinedText(
                text: 'Services',
                bold: true,
              ),
              IconUnderlinedTextWithData(
                textIUT: 'Recipe Search',
                icon: LineAwesomeIcons.spoon,
                data: RecipeSearchText,
              ),
              SizedBox(
                height: 10.0,
              ),
              CircularButton(
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return FoodRecipePage();
                      }));
                },
              ),
              IconUnderlinedTextWithData(
                textIUT: 'Food Database',
                icon: LineAwesomeIcons.database,
                data: FoodDatabaseText,
              ),
              SizedBox(
                height: 10.0,
              ),
              CircularButton(
                onPress: () {},
              ),
              IconUnderlinedTextWithData(
                textIUT: 'Nutrition Analysis',
                icon: LineAwesomeIcons.apple,
                data: NutritionAnalysisText,
              ),
              SizedBox(
                height: 10.0,
              ),
              CircularButton(
                onPress: () {},
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50.0,
                color: PurpleColor,
                width: double.infinity,
                child: Center(
                    child: Text(
                  'Made With ❤ In India',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

