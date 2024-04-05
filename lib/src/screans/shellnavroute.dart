import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<String> index = ["home", "Browse", "create", "chat", "settenigs"];

class Scaffoldshell extends StatelessWidget {
  const Scaffoldshell(
      {Key? key, required this.child, required this.selectedIndex})
      : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final child;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          destinations: const [
            NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
            NavigationDestination(label: 'Search', icon: Icon(Icons.search)),
            NavigationDestination(label: 'Create', icon: Icon(Icons.add)),
            NavigationDestination(label: 'Chat', icon: Icon(Icons.message)),
            NavigationDestination(
                label: 'Settings', icon: Icon(Icons.settings)),
          ],
          onDestinationSelected: (int value) {
            context.pushNamed(index[value]);
          },
        ));
  }
}
