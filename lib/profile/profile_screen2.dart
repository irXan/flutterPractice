import 'package:flutter/material.dart';

class ProfileScreenLevel2 extends StatelessWidget {
  const ProfileScreenLevel2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Column(
        children: [

          /// 🔥 STACK (Advanced)
          Stack(
            clipBehavior: Clip.none,
            children: [

              /// Gradient Banner
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              /// Edit Button
              Positioned(
                top: 40,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit, color: Colors.black),
                ),
              ),

              /// Profile Image with border
              Positioned(
                bottom: -60,
                left: MediaQuery.of(context).size.width / 2 - 60,
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundImage:
                    NetworkImage("https://i.pravatar.cc/300"),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 70),

          /// Name
          Text(
            "Irzan Ahmad",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          /// Bio
          Text(
            "Flutter Developer | AI & Blockchain",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          /// 🔥 Stats with Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat(Icons.grid_on, "120", "Posts"),
              _buildStat(Icons.people, "1.2K", "Followers"),
              _buildStat(Icons.person_add, "300", "Following"),
            ],
          ),

          const SizedBox(height: 20),

          /// 🔥 Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                    label: Text("Follow"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    label: Text("Message"),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          /// 🔥 Tabs (UI only)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.grid_on),
              Icon(Icons.video_collection),
              Icon(Icons.bookmark),
            ],
          ),

          const SizedBox(height: 10),

          /// 🔥 Expanded Content
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
                    color: Colors.orange[200],
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