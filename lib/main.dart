import 'package:flutter/material.dart';
import 'package:flutter_app_ui_km4/screen/home_ui.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}