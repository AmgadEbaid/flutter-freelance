import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/models/user.dart';
import 'package:untitled/src/notifiers/users.dart';




class Freelancer extends StatefulWidget {
  const Freelancer({super.key});

  @override
  State<Freelancer> createState() => _FreelancerState();
}


class _FreelancerState extends State<Freelancer> {
    late final Future<List<UserModel>> freelancers ;
  @override
  void initState() {
    freelancers = context.read<users>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: freelancers,
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        final FreelancersList = snapshot.data;

        if(snapshot.hasData && FreelancersList != null){
          return Expanded(
            child: SizedBox(
                child: ListView.builder(
                 itemCount: FreelancersList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => context.push('/Browse/search/freelancer/profile/1212'),

                      title: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          FreelancersList[index].name,
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
                            Text(FreelancersList[index].Details),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${FreelancersList[index].pay}\$",
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
        }else if(snapshot.hasError){
          return Center(child: Text("error"),);
        }else {
          return Center(child: CircularProgressIndicator());
        }

      }
    );
  }
}

