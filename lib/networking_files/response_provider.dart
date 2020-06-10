import 'dart:io';

import 'package:foodrecipe/networking_files/dish_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String YOUR_APP_ID = '1f652301';
const String YOUR_APP_KEY = '0abd04e898aa390b2e44b0a0caeeb8e0';


class ResponseProvider {
  final String name;

ResponseProvider({this.name});

  List<DishData> dishdata = List<DishData>();
  Future<void> getData()async{
    print('in resp$name');
    String url = 'https://api.edamam.com/search?q=${name}&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}';
    http.Response response = await http.get(url);
    Map<String,dynamic> jsonData = jsonDecode(response.body);
//    print(jsonData);
    jsonData['hits'].forEach((element){
      DishData ddata = DishData();
      ddata.imgUrl = element['recipe']['image'];
      ddata.ingredientLines = element['recipe']['ingredientLines'];
      ddata.label = element['recipe']['label'];
      ddata.time = element['recipe']['totalTime'];
      dishdata.add(ddata);
    });
    //print(data);
}
}
