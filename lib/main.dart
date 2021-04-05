import 'package:flutter/material.dart';
import 'package:jomjaiproj/states/checktime.dart';
import 'package:jomjaiproj/states/show_map.dart';
import 'package:jomjaiproj/states/successtensec.dart';
import 'package:jomjaiproj/states/testnoti.dart';
import 'package:jomjaiproj/states/unsuccesstensec.dart';

final Map<String, WidgetBuilder> map = {
  '/checkTime': (BuildContext context) => CheckTime(),
  '/successTenSec': (BuildContext context) => SuccessTenSec(),
  '/unSuccessTenSec': (BuildContext context) => UnSuccessTenSec(),
  '/testNoti': (BuildContext context) => TestNoti(),
  '/showMap':(BuildContext context)=> ShowMap(),
};

String initialRoute = '/testNoti';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initialRoute,
      theme: ThemeData(
          
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.black),
          ),
          primaryIconTheme: IconThemeData(color: Colors.black)),
    );
  }
}
