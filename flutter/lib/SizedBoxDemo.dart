

import 'package:flutter/material.dart';
class SizedBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('强制大小'),
      ),
      body:new SizedBox(
        width: 250.0,
        height: 250.0,
        child: new Container(
          decoration: new BoxDecoration(
            color:  Colors.lightBlueAccent[100],
          ),
        ),
      ),
    );
  }
}