import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/models/project.dart';
import 'package:untitled/src/notifiers/auth.dart';
import 'package:untitled/src/notifiers/projects.dart';
import 'package:untitled/src/widgets/myProject.dart';

final snackBar = SnackBar(
  content: const Text('your project was created'),
  action: SnackBarAction(
    label: "open",
    onPressed: () {},
  ),
);

class CreatePojectPage extends StatefulWidget {
  @override
  State<CreatePojectPage> createState() => _CreatePojectState();
}

class _CreatePojectState extends State<CreatePojectPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final descripthion = TextEditingController();
  final price = TextEditingController();
  final skils = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    title.dispose();
    descripthion.dispose();
    price.dispose();
    skils.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create a new project"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("title"),
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("descripthion"),
                    TextFormField(
                      controller: descripthion,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" pay per hour "),
                    TextFormField(
                      controller: price,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some your password';
                        } else if (int.parse(value).isNaN) {
                          return "Please enter a correct number";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("skils"),
                    TextFormField(
                      controller: skils,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final userRef =
                            await context.read<BookstoreAuth>().getUserRef();
                        final skillsList = skils.text.split(" ");
                        final project = Project(
                            userRef,
                            title.text,
                            descripthion.text,
                            [],
                            int.parse(price.text),
                            skillsList);
                        context.read<Projects>().postProject(project);
                        title.text = "";
                        descripthion.text = "";
                        price.text = "";
                        skils.text = "";
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 22),
                      child: Text("create a new project"),
                    ))
              ],
            ),
          ),
        ));
  }
}
