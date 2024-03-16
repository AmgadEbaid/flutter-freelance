import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => BrowseState();
}

class BrowseState extends State<Browse> {
  int currentPageIndex = 0;
  void _tap(String path) => context.go('b/:$path');
  @override
  Widget build(BuildContext context) {
    return

            ListView(

              children: [
                Card(

                  child: ListTile(

                    trailing: Icon(Icons.arrow_forward),
                    title: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Projects",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text("Explore new projects opportunities now!"),
                    ),
                    onTap: () => context.go('/b/search/Projects'),
                  ),

                ),
                Card(
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward),
                    title: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Freelancers",
                        style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text("Find top rated freelancers for your project.!"),
                    ),
                    onTap: () => context.go('/b/search/freelancer'),
                  ),
                ),


              ],
            );

  }
}
