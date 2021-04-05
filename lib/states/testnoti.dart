import 'package:flutter/material.dart';

class TestNoti extends StatefulWidget {
  @override
  _TestNotiState createState() => _TestNotiState();
}

class _TestNotiState extends State<TestNoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.pushNamed(context, '/showMap'),
        child: Icon(Icons.map),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Test Notification'),
        actions: [
          buildAlert(19),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.add_alert),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Text('Test Notification'),
    );
  }

  Widget buildAlert(int i) => Container(
        // color: Colors.grey,
        width: 36,
        height: 36,
        child: Stack(
          children: [
            Positioned(
              top: 4,
              left: 8,
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  i.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 16,
              child: Icon(Icons.add_alert),
            ),
          ],
        ),
      );
}
