import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoDetails extends StatelessWidget {
  final String name;
  final List<Map<String, dynamic>> todos;

  const TodoDetails({super.key, required this.name, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: todos.isEmpty
          ? const Center(
              child: Text('No todos found', style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo['isCompleted'] ?? false,
                      onChanged: null,
                    ),
                    title: Text(
                      todo['title'] ?? 'Untitled',
                      style: TextStyle(
                        decoration: (todo['isCompleted'] ?? false)
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Text(todo['description'] ?? ''),
                    trailing: Text(
                      todo['date'] ?? '',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
    );
  }
}