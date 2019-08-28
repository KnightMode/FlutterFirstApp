import 'package:flutter/material.dart';
import 'ghflutter_widget.dart';
import 'strings.dart';

void main() => runApp(new GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.appTitle,
      home: new GHFlutterWidget(),
    );
  }
}
