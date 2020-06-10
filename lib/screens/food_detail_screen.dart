import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodrecipe/constants.dart';
import 'package:foodrecipe/networking_files/response_provider.dart';

class FoodDetailPage extends StatelessWidget {
  final int index;
  final ResponseProvider responseProvider;

  FoodDetailPage({@required this.index, @required this.responseProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: '$index',
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('${responseProvider.dishdata[index].label}',style: IntroHeadingTextColorStyle,),
                  Card(
                    child: Image.network(responseProvider.dishdata[index].imgUrl),
                    color: Colors.redAccent,
                  ),
                  Text('Ingredient: ',style: IntroHeadingTextColorStyle,),
                  SizedBox(height: 15.0,),
                  Text('${responseProvider.dishdata[index].ingredientLines}',style: IntroTextStyle,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
