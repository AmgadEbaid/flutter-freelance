import 'package:flutter/widgets.dart';


class BookstoreAuth extends ChangeNotifier {
  bool _signedIn = false;
  bool get signedIn => _signedIn;
  String SS = "sldfsldjkflskjdf";

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign out.
    _signedIn = false;
    notifyListeners();
  }

  change() {
    SS = " hello ";
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in. Allow any password.
    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }

}
