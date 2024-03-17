import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class profile extends StatelessWidget {
  profile({super.key});
  bool isFreelancer = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("amgad"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/pic2.jpg"),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "amgad",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text("\$2 per/hour",
              style: TextStyle(
                fontSize: 16,
              )),
          Padding(
              padding: const EdgeInsets.all(40),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Text(
                      "I am a Senior developer with expertise in building native iOS applications, NodeJS API's, and Discord Bots. I can help build your project idea from scratch, through all stages of design & development, to App submission and maintenance.My Skillset:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w100)),
                ),
              )),
          TextButton(child: const Text('change to client '), onPressed: () {}),
        ],
      ),
      floatingActionButton: isFreelancer
          ? const FloatingActionButton.extended(
              onPressed: null,
              label: Text("chat"),
              icon: Icon(Icons.chat),
            )
          : null,
    );
  }
}
