import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jomjaiproj/model/catigory_model.dart';
import 'package:jomjaiproj/utilty/my_constant.dart';

class UnSuccessTenSec extends StatefulWidget {
  @override
  _UnSuccessTenSecState createState() => _UnSuccessTenSecState();
}

class _UnSuccessTenSecState extends State<UnSuccessTenSec> {
  List<CatigoryModel> catigoryModels = [];
  List<Color> colors = [Colors.green, Colors.red];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<Null> readAllData() async {
    if (catigoryModels.length != 0) {
      catigoryModels.clear();
    }

    String path = '${MyConstant().domain}/ungposbee/getAllCatitory.php';
    await Dio().get(path).then((value) {
      // print('value ===>>> $value');
      for (var item in json.decode(value.data)) {
        CatigoryModel model = CatigoryModel.fromMap(item);
        setState(() {
          catigoryModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnSuccess 10 Sec'),
      ),
      body: catigoryModels.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: catigoryModels.length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(catigoryModels[index].name),
                  ElevatedButton(
                    onPressed: () {
                      print('You Tap index ==> $index');
                      editDataWhereId(catigoryModels[index].id);
                    },
                    child: Text('Active'),
                    style: ElevatedButton.styleFrom(
                        primary:
                            colors[int.parse(catigoryModels[index].status)]),
                  ),
                ],
              ),
            ),
    );
  }

  Future<Null> editDataWhereId(String id) async {
    String path =
        '${MyConstant().domain}/ungposbee/editDataWhereId.php?isAdd=true&id=$id&status=1';
    await Dio().get(path).then((value) => readAllData());
  }
}
