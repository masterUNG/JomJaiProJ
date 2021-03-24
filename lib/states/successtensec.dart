import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jomjaiproj/utilty/my_constant.dart';

class SuccessTenSec extends StatefulWidget {
  @override
  _SuccessTenSecState createState() => _SuccessTenSecState();
}

class _SuccessTenSecState extends State<SuccessTenSec> {
  File file;
  bool statusLoad = false;

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result.path);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success 10 Sec'),
      ),
      body: Stack(
        children: [
          buildContent(),
          statusLoad ? buildShowProgress() : SizedBox(),
        ],
      ),
    );
  }

  Center buildShowProgress() => Center(child: CircularProgressIndicator());

  Column buildContent() {
    return Column(
      children: [
        buildRow(),
        statusLoad ? SizedBox() : buildElevatedButton() ,
      ],
    );
  }

  ElevatedButton buildElevatedButton() => ElevatedButton(
        onPressed: () => uploadProcess(),
        child: Text('Upload'),
      );

  Future<Null> uploadProcess() async {
    setState(() {
      statusLoad = true;
    });
    int i = Random().nextInt(100000);
    String nameFile = 'image$i.jpg';
    String path = '${MyConstant().domain}/jomjai/saveFile.php';

    try {
      Map<String, dynamic> map = Map();
      map['file'] = await MultipartFile.fromFile(file.path, filename: nameFile);
      FormData data = FormData.fromMap(map);
      await Dio().post(path, data: data).then((value) {
        print('Upload Success');
        setState(() {
          statusLoad = false;
        });
      });
    } catch (e) {}
  }

  Row buildRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () => chooseImage(ImageSource.camera),
        ),
        Container(
          width: 250,
          height: 250,
          child:
              file == null ? Image.asset('images/image.png') : Image.file(file),
        ),
        IconButton(
          icon: Icon(Icons.add_photo_alternate),
          onPressed: () => chooseImage(ImageSource.gallery),
        ),
      ],
    );
  }
}
