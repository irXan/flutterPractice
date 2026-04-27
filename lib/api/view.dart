import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp_01/api/controller.dart';
import 'package:myapp_01/api/model.dart';

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

    return Scaffold(
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
