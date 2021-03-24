

import 'package:flutter/material.dart';
import 'package:jomjaiproj/utilty/mycounttime.dart';

class CheckTime extends StatefulWidget {
  @override
  _CheckTimeState createState() => _CheckTimeState();
}

class _CheckTimeState extends State<CheckTime> {
  int showTime = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countTime(context);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Time'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$showTime sec',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/successTenSec', (route) => false),
              child: Text('Tap me 10 sec'),
            ),
          ],
        ),
      ),
    );
  }
}
