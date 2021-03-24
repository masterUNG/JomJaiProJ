import 'dart:async';

import 'package:flutter/material.dart';

class CheckTime extends StatefulWidget {
  @override
  _CheckTimeState createState() => _CheckTimeState();
}

class _CheckTimeState extends State<CheckTime> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countTime();
  }

  Future<Null> countTime() async {
    Duration duration = Duration(seconds: 10);
    await Timer(
        duration,
        () => Navigator.pushNamedAndRemoveUntil(
            context, '/unSuccessTenSec', (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Time'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, '/successTenSec', (route) => false),
          child: Text('Tap me 10 sec'),
        ),
      ),
    );
  }
}
