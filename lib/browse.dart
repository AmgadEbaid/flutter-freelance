import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => BrowseState();
}

class BrowseState extends State<Browse> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Browse"),
        actions: [
          const IconButton(onPressed: null, icon: Icon(Icons.message)),
          const IconButton(onPressed: null, icon: Icon(Icons.bike_scooter))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(11, 11, 11, 22),
        child: const Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Card(
                  child: ListTile(
                    onTap: null,
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
                    onTap: null,
                  ),
                ),

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
                    onTap: null,
                  ),
                )
              ],
            ),
          ],
        ),
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
