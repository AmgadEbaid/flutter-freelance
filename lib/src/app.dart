import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/notifiers/auth.dart';
import 'package:untitled/src/notifiers/projects.dart';
import 'package:untitled/src/notifiers/users.dart';
import 'package:untitled/src/router/app_router.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final BookstoreAuth auth = BookstoreAuth();


  @override
  Widget build(BuildContext context) {
    auth.AuthStateProvider();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BookstoreAuth>(create: (context) => auth),
          Provider<AppRouter>(create: (context) => AppRouter(auth)),
          Provider<users>(create: (context) => users()),
          Provider<Projects>(create: (context) => Projects())
        ],
        child: Builder(builder: (context) {
          late final GoRouter gorouter = context.read<AppRouter>().router;
          return MaterialApp.router(
            routerConfig: gorouter,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorSchemeSeed: Colors.green),
          );
        }));
  }
}

// private navigators
