import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final database = Hive.box('LocalStorage');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "T O D O",
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter New Task",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.deepOrangeAccent,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: detailController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter Details About Task",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.deepOrangeAccent,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    final newEntry = {
                      'Label': titleController.text,
                      'Description': detailController.text,
                    };

                    database.add(newEntry);

                    setState(() {
                      titleController.clear();
                      detailController.clear();
                    });
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Task Added Successfully!",
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style:
                    ElevatedButton.styleFrom(
                      elevation: 2,
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                    ).copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.white;
                        }
                        return Colors.deepOrange;
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.deepOrange;
                        }
                        return Colors.white;
                      }),
                    ),
                icon: const Icon(Icons.add_circle_outline_sharp),
                label: const Text('ADD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
