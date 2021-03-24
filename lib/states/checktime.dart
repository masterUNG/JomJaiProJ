import 'dart:async';

import 'package:flutter/material.dart';

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
    countTime();
  }

  Future<Null> countTime() async {
    Duration duration = Duration(seconds: 1);
    await Timer(
      duration,
      () {
        setState(() {
          showTime--;
        });
        if (showTime == 0) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/unSuccessTenSec', (route) => false);
        } else {
          countTime();
        }
      },
    );
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
