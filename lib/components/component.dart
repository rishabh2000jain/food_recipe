import 'package:flutter/material.dart';

import '../constants.dart';
class UnderlinedText extends StatelessWidget {
  UnderlinedText({this.text, this.textSize, @required this.bold});

  final String text;
  final double textSize;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$text',
            style: IntroHeadingTextColorStyle.copyWith(
                fontSize: textSize != null ? textSize : 40.0,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            width: 50.0,
            height: 3.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class IconUnderlinedText extends StatelessWidget {
  IconUnderlinedText({this.icon, this.textIUT});

  final IconData icon;
  final String textIUT;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Icon(
          icon,
          size: 50.0,
          color: Color(0xFF4a4a4a),
        ),
        UnderlinedText(
          text: '$textIUT',
          textSize: 30.0,
          bold: false,
        ),
      ],
    );
  }
}

class IconUnderlinedTextWithData extends StatelessWidget {
  final String textIUT;
  final String data;
  final IconData icon;

  IconUnderlinedTextWithData(
      {@required this.textIUT, @required this.icon, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconUnderlinedText(icon: icon, textIUT: textIUT),
        SizedBox(
          height: 10.0,
        ),
        Text(
          data,
          style: IntroTextStyle,
        ),
      ],
    );
  }
}

class CircularButton extends StatefulWidget {
  Function onPress;

  CircularButton({this.onPress});

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  bool pressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.green, width: 2.0),
      ),
      child: Center(
        child: InkWell(
          child: Text(
            'Try Now',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          onTap: widget.onPress,
        ),
      ),
    );
  }
}
