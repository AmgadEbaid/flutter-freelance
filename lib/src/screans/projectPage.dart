import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class project extends StatelessWidget {
  project({super.key});
  bool isFreelancer = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E-commerce wordpress'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Project"),
              ),
              Tab(
                child: Text("appliers"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Text(
                          "E-commerce wordpress",
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(22),
                            child: Text(
                                "I am a Senior developer with expertise in building native iOS applications, NodeJS API's, and Discord Bots. I can help build your project idea from scratch, through all stages of design & development, to App submission and maintenance.My Skillset:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w100)),
                          ),
                        ),
                      ],
                    )),
                FilledButton(
                  onPressed: () => {},
                  child: Text('apply now'),
                ),
              ],
            ),
            Center(
              child: Text(
                "there is appliers yet",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
