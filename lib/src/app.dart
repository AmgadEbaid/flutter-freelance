import 'package:go_router/go_router.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/notifiers/auth.dart';
import 'package:untitled/src/router/app_router.dart';
import 'package:untitled/src/screans/browse.dart';
import 'package:untitled/src/screans/home.dart';
import 'package:untitled/src/screans/login.dart';
import 'package:untitled/src/screans/messeges.dart';
import 'package:untitled/src/screans/people.dart';
import 'package:untitled/src/screans/profile.dart';
import 'package:untitled/src/screans/projectPage.dart';
import 'package:untitled/src/screans/search.dart';
import 'package:untitled/src/screans/shellnavroute.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late final BookstoreAuth auth = BookstoreAuth();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BookstoreAuth>(create: (context) => auth),
          Provider<AppRouter>(create: (context) => AppRouter(auth))
        ],
        child: Builder(builder: (context) {
        late  final GoRouter gorouter = context.read<AppRouter>().router;
          return MaterialApp.router(
       routerConfig: gorouter,

            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorSchemeSeed: Colors.green),

          );
        }));
  }
}

// private navigators
