import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:untitled/src/models/project.dart';
import 'package:untitled/src/models/user.dart';
import 'package:untitled/src/screans/projectPage.dart';




class users {
  final Usersref = FirebaseFirestore.instance.collection("users");


  Future<List<UserModel>> getUsers() async {
    final users = <UserModel>[];
    final Snapshot = await Usersref.get();

    for (final doc in Snapshot.docs) {
      final json = doc.data();
      final userid = doc.id;
      final user = UserModel.fromJson(json, userid);
      users.add(user);
    }
    return users;
  }


  Future<void> addUser() async{
    final userid = await FirebaseAuth.instance.currentUser?.uid;
    print(userid);
      if(userid ==null)
        return;

    final user = UserModel("amgad", "amgad@gmail.com", [],"amgad is a freelancer looking forward to work on your most important projects/", 22, ["js","dart"], userid, true);
    await Usersref.add(user.tojson());

    final  users  = await getUsers();
for(var ele in users){
  print(ele.UUid);
}
  }

}
