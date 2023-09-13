import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.find();
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(200.0),
      child: Row(
        children: <Widget>[
          Text(""),
          Column(
            children: <Widget>[
              FloatingActionButton(onPressed: null, child: Text("1")),
              FloatingActionButton(onPressed: null, child: Text("2")),
              FloatingActionButton(onPressed: null, child: Text("3"))
            ],
          ),
          Column(
            children: <Widget>[
              FloatingActionButton(onPressed: null, child: Text("4")),
              FloatingActionButton(onPressed: null, child: Text("5")),
              FloatingActionButton(onPressed: null, child: Text("6"))
            ],
          ),
          Column(
            children: <Widget>[
              FloatingActionButton(onPressed: null, child: Text("7")),
              FloatingActionButton(onPressed: null, child: Text("8")),
              FloatingActionButton(onPressed: null, child: Text("9"))
            ],
          ),
          FloatingActionButton(onPressed: null, child: Text("0"))
        ],
      ),
    ));
  }
}
