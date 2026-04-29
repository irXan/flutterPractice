import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp_01/api/controller.dart';
import 'package:myapp_01/api/model.dart';
import 'package:myapp_01/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  final Controller contr = Controller();

  TextEditingController name = TextEditingController();
  TextEditingController view = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController avatar = TextEditingController();
  TextEditingController id = TextEditingController();

  bool isedit = false;

  @override
  Widget build(BuildContext context) {
    final theme_provider = Provider.of<ThemeProvider>(context);

    Future<void> add() async {
      final data = Model(
        avatar: avatar.text,
        name: name.text,
        details: details.text,
        id: '',
        phone: phone.text,
        role: role.text,
      );

      await contr.addData(data);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('data added')));
      setState(() {});
    }

    Future<void> edit() async {
      final data = Model(
        avatar: avatar.text,
        name: name.text,
        details: details.text,
        id: id.text,
        phone: phone.text,
        role: role.text,
      );

      await contr.updateData(data);

      isedit = false;
      name.clear();
      avatar.clear();
      details.clear();
      role.clear();
      phone.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('data added')));
      setState(() {});
    }

    Future<void> patch() async {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update Role"),
            content: TextField(
              controller: role,
              decoration: InputDecoration(labelText: "Enter new role"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await contr.patchData(id.text, role.text);

                  Navigator.pop(context);

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Role updated')));

                  setState(() {});
                },
                child: Text("Update"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme_provider.isDark ? Colors.black : Colors.blue,

        actions: [
          Switch(
            value: theme_provider.isDark,
            onChanged: (value) => theme_provider.toggle(),

            activeThumbColor: const Color.fromARGB(255, 25, 25, 116),
            inactiveThumbColor: const Color.fromARGB(255, 255, 234, 0),

            activeTrackColor:  const Color.fromARGB(255, 19, 19, 189),
            inactiveTrackColor: const Color.fromARGB(255, 255, 153, 0),

            thumbIcon: WidgetStateProperty.resolveWith((states) {
              return Icon(
                theme_provider.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny_outlined,
                size: 16,
                color: Colors.white,
              );
            }),
          ),
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: details,
              decoration: InputDecoration(labelText: 'Details'),
            ),
            TextField(
              controller: avatar,
              decoration: InputDecoration(labelText: 'Image url'),
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: role,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            SizedBox(height: 10),

            isedit == false
                ? ElevatedButton(
                    onPressed: () async {
                      add();
                    },
                    child: Text('Save'),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      edit();
                    },
                    child: Text('Update'),
                  ),

            Expanded(
              child: FutureBuilder(
                future: contr.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Products'));
                  }

                  final users = snapshot.data ?? [];

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return InkWell(
                        onLongPress: () => {contr.delete(user.id)},

                        child: ListTile(
                          onTap: () => {id.text = user.id, patch()},
                          title: Text(user.name),
                          subtitle: Text(user.details),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              isedit = true;

                              id.text = user.id;
                              name.text = user.name;
                              details.text = user.details;
                              avatar.text = user.avatar;
                              phone.text = user.phone;
                              role.text = user.role;

                              setState(() {});
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
