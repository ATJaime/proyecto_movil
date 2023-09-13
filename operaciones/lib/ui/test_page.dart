import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.find();
    return const Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Text("5+3"),
          Row(
            children: <Widget>[
              FloatingActionButton(onPressed: null, child: Text("1")),
              FloatingActionButton(onPressed: null, child: Text("4")),
              FloatingActionButton(onPressed: null, child: Text("7"))
            ],
          ),
          Row(
            children: <Widget>[
              FloatingActionButton(onPressed: null, child: Text("2")),
              FloatingActionButton(onPressed: null, child: Text("5")),
              FloatingActionButton(onPressed: null, child: Text("8"))
            ],
          ),
          Row(
            children: <Widget>[
              FloatingActionButton(onPressed: null, child: Text("3")),
              FloatingActionButton(onPressed: null, child: Text("6")),
              FloatingActionButton(onPressed: null, child: Text("9"))
            ],
          ),
          Center(child: FloatingActionButton(onPressed: null, child: Text("0")))
        ],
      ),
    ));
  }
}
