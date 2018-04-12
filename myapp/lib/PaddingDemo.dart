

import 'package:flutter/material.dart';
class PaddingDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('填充'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(50.0),
        child: new Image.network('http://up.qqjia.com/z/25/tu32710_4.jpg'),
      ),
    );
  }
}