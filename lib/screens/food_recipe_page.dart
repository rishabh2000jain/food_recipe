import 'package:flutter/material.dart';
import 'package:foodrecipe/components/component.dart';
import 'package:foodrecipe/networking_files/response_provider.dart';
import 'package:foodrecipe/screens/food_detail_screen.dart';
import '../constants.dart';

class FoodRecipePage extends StatefulWidget {
  @override
  _FoodRecipePageState createState() => _FoodRecipePageState();
}

class _FoodRecipePageState extends State<FoodRecipePage> {
  bool progress = false;
  ResponseProvider responseProvider;
  Future<ResponseProvider> getResponse(String foodName)async{
    ResponseProvider responseProvider =  ResponseProvider(name: foodName);
    await responseProvider.getData();
//    responseProvider.dishdata.forEach((element) {
//      print(element.label);
//      print(element.imgUrl);
//    });

    return responseProvider;

  }
  String foodName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    responseProvider = ResponseProvider();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                UnderlinedText(
                  text: 'Welcome to My Recipe World',
                  bold: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Search for any recipe you wish',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    foodName = value;
                    //print(foodName);
                  },
                  decoration: InputDecoration(
                    hintText: 'Find best recipes',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 0.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircularButton(
                  onPress: () async {
                    progress = true;
                    responseProvider.dishdata.length = 0;
                    setState(() {});
                    responseProvider = await getResponse(foodName);
                    //print(foodName);
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                responseProvider.dishdata.length != 0
                    ? Container(
                        height: MediaQuery.of(context).size.height * .45,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: responseProvider.dishdata.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return FoodDetailPage(responseProvider: responseProvider,index: index,);
                                    }
                                  ));
                                },
                                child: Hero(
                                  tag: '$index',
                                  child: Container(
                                    width: 230.0,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 9.0, horizontal: 3.0),
                                      child: Card(
                                        elevation: 6.0,
                                        color: Colors.redAccent,
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 5.0, right: 5.0),
                                              child: Container(
                                                padding: EdgeInsets.all(5.0),
                                                clipBehavior: Clip.hardEdge,
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.purple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Image.network(
                                                    responseProvider
                                                        .dishdata[index].imgUrl),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              'Required ingredient : ${responseProvider.dishdata[index].ingredientLines.length}',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                                'Total Time : ${responseProvider.dishdata[index].time}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              '${responseProvider.dishdata[index].label}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white),
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Container(
                        child: progress
                            ? CircularProgressIndicator()
                            : Icon(
                                Icons.fastfood,
                                size: 250.0,
                              )),
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
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
