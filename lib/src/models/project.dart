import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Project {
  final String? UUid;
  final String title;
  final String Details;
  final int pay;
  final DocumentReference user;
  final List<DocumentReference> appliers;
  final List<String> skills;

  Project(this.user, this.title, this.Details, this.appliers, this.pay,
      this.skills, {this.UUid});

  Project.fromJson(Map<String, dynamic> json, String UUid)
      : UUid = UUid as String,
        title = json["title"],
        Details = json["Details"],
        pay = json["pay"],
        user = json["user"],
        skills = List<String>.from(json["skills"]??[]),
        appliers = List<DocumentReference>.from(json["appliers"] ?? []) ;

   Map<String,dynamic> tojson() => {
     'title':title,
     "Details":Details,
     "pay":pay,
     "user":user,
     "skills":skills,
     "appliers":appliers
   };
}
