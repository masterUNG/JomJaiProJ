import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jomjaiproj/model/location_model.dart';
import 'package:jomjaiproj/utilty/my_constant.dart';

class ShowMap extends StatefulWidget {
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  List<LocationModel> locationModels = [];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllLocation();
  }

  Future<Null> readAllLocation() async {
    String path = '${MyConstant().domain}/RCI/getAllLocation.php';
    await Dio().get(path).then((value) {
      for (var map in json.decode(value.data)) {
        LocationModel model = LocationModel.fromJson(map);
        setState(() {
          locationModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Map'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
