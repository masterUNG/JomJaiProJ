import 'package:flutter/material.dart';
import 'package:jomjaiproj/states/checktime.dart';
import 'package:jomjaiproj/states/successtensec.dart';
import 'package:jomjaiproj/states/unsuccesstensec.dart';

final Map<String, WidgetBuilder> map = {
  '/checkTime': (BuildContext context) => CheckTime(),
  '/successTenSec': (BuildContext context) => SuccessTenSec(),
  '/unSuccessTenSec': (BuildContext context) => UnSuccessTenSec(),
};

String initialRoute = '/checkTime';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initialRoute,
    );
  }
}
