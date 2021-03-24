import 'dart:async';

import 'package:flutter/material.dart';

Future<Null> countTime(BuildContext context) async {
  Duration duration = Duration(seconds: 10);
  await Timer(
    duration,
    () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/unSuccessTenSec', (route) => false);
    },
  );
}
