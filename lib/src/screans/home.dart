import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/notifiers/auth.dart';
import 'package:untitled/src/notifiers/projects.dart';
import 'package:untitled/src/notifiers/users.dart';

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
      Scaffold(
        appBar: AppBar(title: Text("home"),),
        body:ListView(

          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Column(
              children: [
                FilledButton(

                 onPressed: ( )  {context.read<BookstoreAuth>().signOut();},
                  child:  Text("sineout "),
                ),
                FilledButton(

                  onPressed: ( ) async { await context.read<users>().addUser();},
                  child:  Text("print  users "),
                ),

                Container(
                  height: 100,
                  color: Colors.green[100],
                  child: const Row( children: [ SizedBox(width: 100,child: Icon(Icons.cabin), )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
                ),
              ],
            ),
            Container(
              height: 100,
              color: Colors.green[100],

              child: const Row( children: [ SizedBox(width: 100,child: Icon(Icons.cabin), )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
            ),
            Container(
              height: 100,
              color: Colors.green[100],
              child: const Row( children: [ SizedBox(width: 100,child: Icon(Icons.cabin), )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
            ),
          ],
        ) ,
      );



  }
}
