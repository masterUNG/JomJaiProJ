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
          : Column(
              children: [
                Container(decoration: BoxDecoration(color: Colors.grey.shade400),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Cat'),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text('Url Detail'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('Action'),
                        ),
                      ],
                    ),
                  ),
                ),
                buildListView(),
              ],
            ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: catigoryModels.length,
      itemBuilder: (context, index) => Container(
        height: 60,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(catigoryModels[index].name),
              ),
              Expanded(
                flex: 3,
                child: Text(catigoryModels[index].url),
              ),
              Expanded(
                flex: 1,
                child: createButton(catigoryModels[index].status, index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> editDataWhereId(String id) async {
    String path =
        '${MyConstant().domain}/ungposbee/editDataWhereId.php?isAdd=true&id=$id&status=1';
    await Dio().get(path).then((value) => readAllData());
  }

  Widget createButton(String status, int index) {
    switch (status) {
      case '0':
        return ElevatedButton(
          onPressed: () {
            print('You Tap index ==> $index');
            editDataWhereId(catigoryModels[index].id);
          },
          child: Text('Active'),
          style: ElevatedButton.styleFrom(primary: colors[0]),
        );
        break;
      case '1':
        return SizedBox();
        break;
      default:
        return SizedBox();
        break;
    }
  }
}
