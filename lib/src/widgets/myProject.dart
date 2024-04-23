import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/models/project.dart';
import 'package:untitled/src/notifiers/projects.dart';
import 'package:untitled/src/screans/projectPage.dart';

//to do find a way to use the same projectView class as the search projects and as my projects
class MyProjectsView extends StatefulWidget {
  const MyProjectsView({super.key});

  @override
  State<MyProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<MyProjectsView> {
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
        builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
          final projectList = snapshot.data;
          if (snapshot.hasData && projectList != null) {
            return Expanded(
              child: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: projectList.length,
                    itemBuilder: (context, index) {
                      final projectItem = projectList[index];
                      return ListTile(
                        trailing: IconButton(
                            onPressed: () => _dialogBuilder(
                                context, projectList[index].title.toString()),
                            icon: Icon(
                              Icons.delete,
                            )),
                        onTap: () => context
                            .push('/Browse/search/projects/project/1212'),
                        title: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            projectList[index].title,
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
                              Text(projectList[index].Details),
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
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

Future<void> _dialogBuilder(BuildContext context, String projectname) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
      title: const Text('delete ' ),
        content: const Text(
          "do you want to delete this project ",
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('delete'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
