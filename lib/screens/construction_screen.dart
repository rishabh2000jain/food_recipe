import 'package:flutter/material.dart';

class ConstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: Image(image:NetworkImage('https://image.freepik.com/free-vector/urban-building-construction_1284-16906.jpg') ,)

      ),
    );
  }
}
