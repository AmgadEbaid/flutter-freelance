import 'package:flutter/material.dart';
import 'package:untitled/browse.dart';
import 'package:untitled/login.dart';
import 'package:untitled/search.dart';
import 'home.dart';

void main() {
  bool user = true;
  runApp(MaterialApp(title: "first shit", home:user?  Search() : login(),debugShowCheckedModeBanner:false ,));
}
