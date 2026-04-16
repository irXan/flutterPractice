import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "P R O F I L E",
          style: GoogleFonts.orbitron(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout_outlined),
          color: Colors.white,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white.withValues(alpha: 0.2);
              }
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withValues(alpha: 0.4);
              }
              return null;
            }),
          ),
        ),
        centerTitle: true,
        elevation: 1,
      ),

      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            );
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(child: Text("Error fetching profile data"));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;
          String name = userData['name'] ?? "No Name";
          String email = userData['email'] ?? "No Email";

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/linkdinCover.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -55,
                      left: MediaQuery.of(context).size.width / 2 - 65,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 62,
                          backgroundImage: const AssetImage(
                            'assets/images/DP.png',
                          ),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 70),
                Text(
                  "Flutter Developer | AI Enthusiast",
                  style: GoogleFonts.poppins(
                    color: Colors.deepOrangeAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      _buildProfileField(
                        label: "Full Name",
                        value: name,
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 15),
                      _buildProfileField(
                        label: "Email Address",
                        value: email,
                        icon: Icons.email_outlined,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              _showToast(context, "Following $name"),
                          icon: const Icon(Icons.person_add_alt_1, size: 18),
                          label: Text(
                            "FOLLOW",
                            style: GoogleFonts.orbitron(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: _buttonStyle(isPrimary: true),
                        ),
                      ),

                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _showToast(
                            context,
                            "Messaging feature coming soon!",
                          ),
                          icon: const Icon(Icons.chat_bubble_outline, size: 18),
                          label: Text(
                            "MESSAGE",
                            style: GoogleFonts.orbitron(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: _buttonStyle(isPrimary: false),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return TextFormField(
      readOnly: true,
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
        prefixIcon: Icon(icon, color: Colors.deepOrangeAccent),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12)
          )
        
      ),
    );
  }

  ButtonStyle _buttonStyle({required bool isPrimary}) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 15),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (isPrimary)
          return states.contains(WidgetState.hovered)
              ? Colors.black
              : Colors.deepOrange;
        return states.contains(WidgetState.hovered)
            ? Colors.grey[100]
            : Colors.white;
      }),
      foregroundColor: WidgetStateProperty.all(
        isPrimary ? Colors.white : Colors.black,
      ),
      side: WidgetStateProperty.all(
        isPrimary ? BorderSide.none : const BorderSide(color: Colors.black12),
      ),
    );
  }

  void _showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
