import 'package:flutter/material.dart';
export 'package:untitled/home.dart';
import 'package:go_router/go_router.dart';

class HomeState extends StatefulWidget {
  const HomeState({super.key});

  @override
  State<HomeState> createState() => HomeWidget();
}

 class HomeWidget extends State<HomeState> {
   int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return
      ListView(

          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.blue[100],
              child: const Row( children: [ SizedBox(width: 100,child: Icon(Icons.cabin), )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
            ),
            Container(
              height: 100,
              color: Colors.blue[100],

              child: const Row( children: [ SizedBox(width: 100,child: Icon(Icons.cabin), )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
            ),
            Container(
              height: 100,
              color: Colors.blue[100],
              child: const Row( children: [ SizedBox(width: 100,child: Icon(Icons.cabin), )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
            ),
          ],
        );


  }
}


