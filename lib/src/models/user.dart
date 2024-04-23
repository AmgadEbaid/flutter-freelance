
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String UUid;
  final String name;
  final String email;
  final String Details;
  final int pay;
  final List<DocumentReference> projects;
  final List<String> skills;
  final bool IsFreelancer;

  UserModel( this.name,this.email,this.projects, this.Details, this.pay,
      this.skills, this.UUid,this.IsFreelancer);

  UserModel.fromJson(Map<String, dynamic> json, String UUid)
      : UUid = UUid as String,
        email = json["email"],
        Details = json["Details"],
        pay = json["pay"],
        name = json["name"],
        skills =List<String>.from(json["skills"]??[]),
        projects = List<DocumentReference>.from(json["projects"] ?? []) ,
  IsFreelancer= json["IsFreelancer"];

  Map<String,dynamic> tojson() => {
    'email':email,
    "Details":Details,
    "pay":pay,
    "name":name,
    "skills":skills,
    "projects":projects,
    "IsFreelancer":IsFreelancer
  };
}