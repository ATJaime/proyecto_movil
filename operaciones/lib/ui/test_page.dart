import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.find();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0), // Ajusta la cantidad de espacio en la parte superior
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("5+3"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(onPressed: null, child: Text("1")),
                    SizedBox(width: 10.0),
                    FloatingActionButton(onPressed: null, child: Text("4")),
                    SizedBox(width: 10.0),
                    FloatingActionButton(onPressed: null, child: Text("7"))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(onPressed: null, child: Text("2")),
                    SizedBox(width: 10.0),
                    FloatingActionButton(onPressed: null, child: Text("5")),
                    SizedBox(width: 10.0),
                    FloatingActionButton(onPressed: null, child: Text("8"))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(onPressed: null, child: Text("3")),
                    SizedBox(width: 10.0),
                    FloatingActionButton(onPressed: null, child: Text("6")),
                    SizedBox(width: 10.0),
                    FloatingActionButton(onPressed: null, child: Text("9"))
                  ],
                ),
              ),
              Center(
                child: FloatingActionButton(onPressed: null, child: Text("0")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
