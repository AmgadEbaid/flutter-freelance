import 'package:flutter/material.dart';
export 'package:untitled/home.dart';

class HomeState extends StatefulWidget {
  const HomeState({super.key});

  @override
  State<HomeState> createState() => HomeWidget();
}

 class HomeWidget extends State<HomeState> {
   int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Home"),
        actions: [ IconButton(onPressed: null, icon: Icon( Icons.message)) ,IconButton(onPressed: null, icon: Icon( Icons.bike_scooter))],
      ),
      body:  ListView(

        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.blue[100],
            child: Row( children: [ Container(child: Icon(Icons.cabin), width: 100, )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
          ),
          Container(
            height: 100,
            color: Colors.blue[100],

            child: Row( children: [ Container(child: Icon(Icons.cabin), width: 100, )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
          ),
          Container(
            height: 100,
            color: Colors.blue[100],
            child: Row( children: [ Container(child: Icon(Icons.cabin), width: 100, )  ,Flexible(child: Text("welcome to freelance if you are new to our website here are a few thing to get started", ) ,),]),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(

        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            print(currentPageIndex);
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),

    );
  }
}


