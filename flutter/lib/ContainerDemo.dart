import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        width: 128.0,
        height: 128.0,
        decoration: new BoxDecoration(
          color: Colors.lightBlueAccent[100],
        ),
      ),
    );
  }
}
