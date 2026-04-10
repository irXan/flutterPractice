import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'todo_details.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  String user = 'Hafeez';
  final myKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> todos = [];
  final box = Hive.box('profile');

  @override
  Widget build(BuildContext context) {
    box.add(todos);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Form(
            key: myKey,
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null) {
                      return 'Please Enter Title';
                    }

                    if (value.length <= 3) {
                      return 'Lenth of title must be more than 4 digits';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: details,
                  decoration: InputDecoration(labelText: 'Details'),
                  validator: (value) {
                    if (value == null) {
                      return 'Please Enter Details';
                    }
                    if (value.length <= 3) {
                      return 'Lenth of Details must be more than 4 digits';
                    }

                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    String titleText = title.text;
                    String detailstext = details.text;

                    if (myKey.currentState!.validate()) {
                      todos.add({
                        'title': titleText,
                        'details': detailstext,
                        'date': DateTime.now(),
                        'status': false,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Todo Added'),
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                        ),
                      );
                      title.clear();
                      details.clear();
                      setState(() {});
                      Navigator.pushReplacementNamed(context, '/to');
                    }
                  },
                  child: Text('Save'),
                ),
                // Row(
                //   children: [
                //     TextButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) =>
                //                 TodoDetails(todos: todos, name: user),
                //           ),
                //         );
                //       },
                //       child: Text('Todo View '),
                //     ),
                //     CircleAvatar(child: Text(todos.length.toString())),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
