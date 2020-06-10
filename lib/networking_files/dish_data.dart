class DishData{
  String _imgUrl;
  String _label;
  List<dynamic> _ingredientLines = List();
  double _time;

  set time(double value) {
    _time = value;
  }

  double get time => _time;

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get label => _label;

  List<dynamic> get ingredientLines => _ingredientLines;

  set ingredientLines(List<dynamic> value) {
    _ingredientLines = value;
  }

  set label(String value) {
    _label = value;
  }


}