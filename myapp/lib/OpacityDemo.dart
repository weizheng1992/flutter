

import 'package:flutter/material.dart';

class OpacityDemo extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('不透明'),
      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.1,
          child: new Container(
            width: 250.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color:  const Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}