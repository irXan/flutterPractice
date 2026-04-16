import 'package:flutter/material.dart';

class Insta extends StatelessWidget {
  const Insta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 94, 82, 255),
                      const Color.fromARGB(255, 248, 221, 221),
                      Colors.pinkAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              Positioned(
                top: 40,
                right: 20,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit, color: Colors.black, size: 20),
                ),
              ),

              Positioned(
                bottom: -60,
                left: MediaQuery.of(context).size.width / 2 - 60,
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundImage: AssetImage('assets/images/DP.png'),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 70),
          Text(
            "Irzan Ahmad",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),
          Text(
            "Flutter Developer | AI & Blockchain",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat(Icons.grid_on, "120", "Posts"),
              _buildStat(Icons.people, "1.2K", "Followers"),
              _buildStat(Icons.person_add, "300", "Following"),
            ],
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                    label: Text("Follow"),
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.black;
                        }
                        return Colors.amber;
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.amber;
                        }
                        return Colors.black;
                      }),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    label: Text("Message"),
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.blueAccent;
                        }
                          return Colors.white;
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.white;
                        }
                        return Colors.blueAccent;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.grid_on, color: Colors.pinkAccent),
              Icon(Icons.video_collection, color: Colors.pinkAccent),
              Icon(Icons.bookmark, color: Colors.pinkAccent),
            ],
          ),

          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String number, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepOrange),
        const SizedBox(height: 5),
        Text(
          number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label),
      ],
    );
  }
}
