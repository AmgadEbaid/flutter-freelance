

import 'package:flutter/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookstoreAuth extends ChangeNotifier {
  final Usersref = FirebaseFirestore.instance.collection("users");

  bool _signedIn = false;
   User? _user  = null;
  bool get signedIn => _signedIn;

  Future<void> signOut() async {
     await FirebaseAuth.instance.signOut();    // Sign out.
    notifyListeners();
  }



  Stream<User?> userStream() {
    return FirebaseAuth.instance.authStateChanges();
  }

  AuthStateProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _signedIn = user != null;
    });
  }

  Future<void> signIn(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      _user = credential.user!;
    } else {
      print('no user!');
    }
  }
  Future<DocumentReference> getUserRef () async{
    final userId = await FirebaseAuth.instance.currentUser?.uid;
    return Usersref.doc(userId);
  }
  // Sign in. Allow any password.

    notifyListeners();

  }


