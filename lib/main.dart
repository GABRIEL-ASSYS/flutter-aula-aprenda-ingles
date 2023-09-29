import 'package:flutter/material.dart';
import 'package:flutter_aula_29_09/telas/home.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: Color(0xfff5e9b9)),
    ));
