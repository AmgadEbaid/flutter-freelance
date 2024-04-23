import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/src/models/project.dart';
import 'package:untitled/src/screans/projectPage.dart';

class Projects {
  final projectref = FirebaseFirestore.instance.collection("projects");
  final Usersref = FirebaseFirestore.instance.collection("users");


  Future<List<Project>> getProjects() async {
    final projects = <Project>[];
    final projectsSnapshot = await projectref.get();

    for (final doc in projectsSnapshot.docs) {
      final projectJson = doc.data();
      final projectId = doc.id;
      final project = Project.fromJson(projectJson, projectId);
      projects.add(project);
    }
    return projects;
  }


  Future<void> postProject(Project project) async{
   await projectref.add(project.tojson());
  }

}
