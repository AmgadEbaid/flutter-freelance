import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/widgets/myProject.dart';

class MyProjectsPage extends StatefulWidget {
  @override
  State<MyProjectsPage> createState() => _CreatePojectState();
}

class _CreatePojectState extends State<MyProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my projects"),
      ),
      body: Column(
        children: [

          MyProjectsView()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
context.pushNamed("create");
        },
        label: Text("Create a new project"),
        icon: Icon(Icons.create),
      )
    );
  }
}

