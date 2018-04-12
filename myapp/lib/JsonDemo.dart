import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

void _networkLoading(){
  http.get('https://domokit.github.io/examples/stocks/data/stock_data_2.json').then((http.Response response){
    String netdata=response.body;
    JsonDecoder decoder =new JsonDecoder();
    List<List<String>> json =decoder.convert(netdata);
    print(json[0][1]);
  });
}