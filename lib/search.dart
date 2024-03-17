import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Search extends StatefulWidget {
  final String details;
  const Search({super.key , required String this.details});

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {

  int currentPageIndex = 0;
  late  String _dropDownvalue ;
  late final List<projectsType> pojectlist ;
   late  List<freelancerType> freelancerslist;
  @override
  void initState() {
    final freelancerType free221 = freelancerType(
        "amgad",
        "this me a free lancer that has alot of expereicane in alot of topics like react flutter i guss node js and so on",
        2,
        2,
        "assets/pic2.jpg");
    final projectsType proj = projectsType(
        "e-commere wepsite wordpress ",
        "i want to a new wepsite for my bussness   about it i have a resturant that have a  lot of meunues and stuff and i need some one to do it ",
        1,
        200);
    pojectlist = [
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj,
      proj
    ];
     freelancerslist = [
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221,
      free221
    ];
    super.initState();
    _dropDownvalue = widget.details;
  }

  void DropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropDownvalue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {



    return  Scaffold(appBar: AppBar(title: Text("search"),
    ), body: Container(
    child: Column(
    children: [
        Column(
        children: [
        Container(
        child: Container(

        padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),

    child: SearchBar(
    hintText: "Search For $_dropDownvalue",
    leading: const Icon(Icons.search),
    padding: const MaterialStatePropertyAll<EdgeInsets>(
    EdgeInsets.symmetric(horizontal: 16.0)),

    ),
    )),
    const SizedBox(height: 24,),
    SegmentedButton(
    segments: const [
    ButtonSegment(
    value: "freelancer",
    label: Text('freelancer'),
    icon: Icon(Icons.calendar_view_day)),
    ButtonSegment(
    value: "Projects",
    label: Text('Projects'),
    icon: Icon(Icons.calendar_view_week)),
    ],
    selected: <String>{_dropDownvalue},
    onSelectionChanged: (Set<String> newSelection) {
    setState(() {
    _dropDownvalue = newSelection.first;
    });
    },
    ),
    ],
    ),

    _dropDownvalue == "freelancer"
    ? Freelancer(list: freelancerslist)
        : Projects(
    list: pojectlist,
    )
    ],
    ),
    ));
  }
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
                onTap: () => context.go('/b/search/freelancer/profile/1212'),
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

class freelancerType {
  final String name;
  final String description;
  final int pay;
  final String photoUrl;
  final int Id;

  freelancerType(this.name, this.description, this.Id, this.pay, this.photoUrl);
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
                onTap: () => context.go('/b/search/projects/project/1212'),
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
