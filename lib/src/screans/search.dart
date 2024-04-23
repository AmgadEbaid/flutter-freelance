import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/models/project.dart';
import 'package:untitled/src/models/user.dart';
import 'package:untitled/src/notifiers/auth.dart';
import 'package:untitled/src/notifiers/projects.dart';
import 'package:untitled/src/notifiers/users.dart';
import 'package:untitled/src/widgets/freelancers.list.dart';
import 'package:untitled/src/widgets/projects.list.dart';

class Search extends StatefulWidget {
  final String details;
  const Search({super.key, required String this.details});

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  int currentPageIndex = 0;
  late String _dropDownvalue;
  @override
  void initState() {
    _dropDownvalue = widget.details;
    super.initState();

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
    return Scaffold(
        appBar: AppBar(
          title: Text("search"),
        ),
        body: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100)),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 24,
                  ),
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
                  ? Freelancer()
                  : ProjectsView(

                    )
            ],
          ),
        ));
  }
}
