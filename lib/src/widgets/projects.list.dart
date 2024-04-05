import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class projectsType {
  final String title;
  final String description;
  final int pay;
  final int Id;

  projectsType(
    this.title,
    this.description,
    this.Id,
    this.pay,
  );
}

class Projects extends StatelessWidget {
  final List<projectsType> list;
  const Projects({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          height: 200.0,
          child: ListView.builder(
            itemCount: list.length,
            prototypeItem: ListTile(
              onTap: () => context.go('search/fgfg/SOME'),
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  list.first.title,
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
                    Text(list.first.description),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("${list.first.pay}  per/Hour"),
                  ],
                ),
              ),
              isThreeLine: true,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => context.push('/Browse/search/projects/project/1212'),
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    list[index].title,
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
                      Text(list[index].description),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "${list[index].pay}\$",
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
                ),
              );
            },
          )),
    );
  }
}
