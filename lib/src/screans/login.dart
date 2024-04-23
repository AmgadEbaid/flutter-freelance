import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/notifiers/auth.dart';

class login extends StatelessWidget {
  login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: Center(
              child: SizedBox(
                width: 350,
                height: 350,
                child: FormExample(),
              ),
            )));
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: password,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'enter your password',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some your password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 44,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await context
                      .read<BookstoreAuth>().signIn("amgad@gmail.com","amgadebaid");
                     // .signIn(email.text, password.text);

                  context.go("/");
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                  }
                },
                child: const Text('login'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
