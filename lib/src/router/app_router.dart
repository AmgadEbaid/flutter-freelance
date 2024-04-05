import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/notifiers/auth.dart';
import 'package:untitled/src/screans/browse.dart';
import 'package:untitled/src/screans/home.dart';
import 'package:untitled/src/screans/login.dart';
import 'package:untitled/src/screans/messeges.dart';
import 'package:untitled/src/screans/people.dart';
import 'package:untitled/src/screans/profile.dart';
import 'package:untitled/src/screans/projectPage.dart';
import 'package:untitled/src/screans/search.dart';
import 'package:untitled/src/screans/shellnavroute.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final BookstoreAuth auth;
  GoRouter get router => _gorouter;
  AppRouter(this.auth);

   final _rootNavigatorKey = GlobalKey<NavigatorState>();
   final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');

  late final GoRouter _gorouter = GoRouter(
    refreshListenable: auth,
    redirect: (context, state) {
      final signedIn = auth.signedIn;
      print(signedIn);

      if (state.uri.toString() != '/sign-in' && !signedIn) {
        return '/sign-in';
      }
      return null;
    },
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          print(state.uri.path);
          return Scaffoldshell(
            child: child,
            selectedIndex: switch (state.uri.path) {
              var p when p == '/' => 0,
              var p when p.startsWith('/Browse') => 1,
              var p when p.startsWith('/create') => 2,
              var p when p.startsWith('/chat') => 3,
              var p when p.startsWith('/settenigs') => 4,
              _ => 0,
            },
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: "home",
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => const MaterialPage(
              child: HomeState(),
            ),
            routes: [],
          ),
          GoRoute(
            path: '/Browse',
            name: "Browse",
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: Browse(),
            ),
            routes: [
              GoRoute(
                  path: 'search/:name',
                  name: "search",
                  pageBuilder: (context, state) {
                    final detail = state.pathParameters['name'].toString();
                    return MaterialPage(
                        child: Search(
                          details: detail,
                        ));
                  },
                  routes: [
                    GoRoute(
                      path: "project/:name",
                      name: "project",
                      builder: (context, state) {
                        final name = state.pathParameters["name"].toString();
                        return project();
                      },
                    ),
                    GoRoute(
                        path: "profile/:name",
                        name: "profile",
                        builder: (context, state) {
                          final name = state.pathParameters["name"].toString();
                          return profile();
                        },
                        routes: [
                          GoRoute(
                              path: "messge/:id",
                              name: "emain",
                              pageBuilder: (context, State) =>
                                  MaterialPage(child: Messges()))
                        ]),
                  ]),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/create',
            name: 'create',
            pageBuilder: (context, state) => const MaterialPage(
              child: Center(child: Text("create a project")),
            ),
            routes: [],
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/chat',
            name: 'chat',
            pageBuilder: (context, state) => MaterialPage(
              child: ChatPage(),
            ),
            routes: [
              GoRoute(
                  path: "messges/:id",
                  pageBuilder: (context, State) => MaterialPage(child: Messges()))
            ],
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/settenigs',
            name: 'settenigs',
            pageBuilder: (context, state) => const MaterialPage(
              child: Center(child: Text("settenigs")),
            ),
            routes: [],
          ),
        ],
      ),
      GoRoute(
        path: "/sign-in",
        pageBuilder: (context, state) => MaterialPage(child: login()),
      )
    ],
  );


}

