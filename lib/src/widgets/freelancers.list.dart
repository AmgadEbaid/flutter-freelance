import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class freelancerType {
  final String name;
  final String description;
  final int pay;
  final String photoUrl;
  final int Id;

  freelancerType(this.name, this.description, this.Id, this.pay, this.photoUrl);
}

class Freelancer extends StatelessWidget {
  final List<freelancerType> list;
  const Freelancer({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          height: .0,
          child: ListView.builder(
            itemCount: list.length,
            prototypeItem: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  list.first.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ), subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list.first.description),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "${list.first.pay}\$",
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
              isThreeLine: true,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => context.push('/Browse/search/freelancer/profile/1212'),
                leading:  CircleAvatar(
                    backgroundImage: AssetImage(list[index].photoUrl)),
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    list[index].name,
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

