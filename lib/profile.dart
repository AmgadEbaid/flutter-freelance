import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class profile extends StatelessWidget {
  profile({super.key});
  final bool isFreelancer = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("amgad"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/pic2.jpg"),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "amgad",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text("\$2 per/hour",
              style: TextStyle(
                fontSize: 16,
              )),
          const Padding(
              padding: EdgeInsets.all(40),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(22),
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
