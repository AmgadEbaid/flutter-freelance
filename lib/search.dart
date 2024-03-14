

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  int currentPageIndex = 0;
  String _dropDownvalue = 'freelancer';

  void DropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropDownvalue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final freelancerType free221 =  freelancerType("amgad","this me a free lancer that has alot of expereicane in alot of topics like react flutter i guss node js and so on", 2,2,"assets/pic.jpg");
   final projectsType proj = projectsType("e-commere wepsite wordpress " ,"i want to a new wepsite for my bussness   about it i have a resturant that have a  lot of meunues and stuff and i need some one to do it " , 1 ,200);
    final List<projectsType> pojectlist = [proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj,proj];
    final List<freelancerType> freelancerslist = [free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221,free221] ;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Browse"),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.message)),
          IconButton(onPressed: null, icon: Icon(Icons.bike_scooter))
        ],
      ),
      body: Column(
        children: [



          Row(
            children: [
              const Flexible(child: SearchBar(leading: Icon(Icons.search) , padding: MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),)),
              DropdownButton(
                icon: const Icon(Icons.search),
                items: const [
                  DropdownMenuItem(

                    child: Text("freelancer"),
                    value: "freelancer",
                  ),
                  DropdownMenuItem(
                    child: Text("Projects"),
                    value: "Projects",
                  )
                ],
                value: _dropDownvalue,
                onChanged: DropdownCallBack,
              ),
            ],
          ),
         _dropDownvalue == "freelancer"? Freelancer(list:freelancerslist ) : Projects(list:pojectlist,)

        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            print(currentPageIndex);
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}



class Freelancer extends StatelessWidget {
 final List<freelancerType> list;
  const Freelancer({super.key ,required List<freelancerType> this.list});
  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: SizedBox(
          height: 200.0,
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
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(list.first.description),
                  SizedBox(height: 8,),

                  Text(list.first.pay.toString() + "  per/Hour"),

                ],),
              ),
              isThreeLine: true,



            ),
            itemBuilder: (context, index) {
              return ListTile(
              onTap: () {},
                  leading:(CircleAvatar( backgroundImage: AssetImage(list[index].photoUrl)  )),
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
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(list[index].description),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(list[index].pay.toString() + "\$" ,style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                            color: Colors.green

                        ),),
                        Text(" per/Hour")
                      ],
                    ),
                   

                  ],),
                ),
              );
            },
          )
      ),
    );

  }



  }


class freelancerType{

  final String name;
  final String description;
  final int pay;
  final String photoUrl;
  final int Id;

  freelancerType(this.name,this.description,this.Id,this.pay,this.photoUrl);
}


class Projects extends StatelessWidget {
  final List<projectsType> list;
  const Projects({super.key ,required List<projectsType> this.list});
  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: SizedBox(
          height: 200.0,
          child: ListView.builder(
            itemCount: list.length,
            prototypeItem: ListTile(
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
                child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(list.first.description),
                  SizedBox(height: 8,),

                  Text(list.first.pay.toString() + "  per/Hour"),

                ],),
              ),
              isThreeLine: true,



            ),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
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
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(list[index].description),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(list[index].pay.toString() +"\$" ,style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green
                        ),),
                        Text(" per/Hour")
                      ],
                    ),


                  ],),
                ),
              );
            },
          )
      ),
    );

  }



}


class projectsType{

  final String title;
  final String description;
  final int pay;
  final int Id;

  projectsType(this.title,this.description,this.Id,this.pay,);
}


