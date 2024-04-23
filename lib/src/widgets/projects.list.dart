import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/models/project.dart';
import 'package:untitled/src/notifiers/projects.dart';
import 'package:untitled/src/screans/projectPage.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  late Future<List<Project>> list;
  @override
  void initState() {
    list = context.read<Projects>().getProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: list,
        builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot ) {
          final projectList = snapshot.data;
          if (snapshot.hasData && projectList != null) {
            return Expanded(
              child: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: projectList.length ,
                    itemBuilder: (context, index) {
                      final projectItem = projectList[index];
                      return ListTile(
                        onTap: () => context
                            .push('/Browse/search/projects/project/1212'),
                        title: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            projectList[index].title ,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(projectList[index].Details ),
                              const SizedBox(
                                height: 8,
                              ),

                              Column(

                                children: [

                                  Row(
                                    children: [
                                      Text(
                                        "${projectList[index].pay}\$",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.green),
                                      ),
                                      const Text(" per/Hour")
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            );
          }else if(snapshot.hasError){
            return Center(child: Text("error"),);
          }else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
