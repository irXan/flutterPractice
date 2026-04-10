import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "P R O F I L E",
          style: GoogleFonts.orbitron(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
        leading: Icon(Icons.home, color: Colors.white),
        centerTitle: true,
        elevation: 1,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/linkdinCover.png'),
                      fit: BoxFit.cover
                    ),
                  ),
                ),

                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 65,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/images/DP.png'),
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),
            Text(
              "Irzan Ahmad",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 5),
            Text(
              "Flutter Developer | AI Enthusiast",
              style: GoogleFonts.poppins(
                  color: Colors.grey
              ),
            ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat("120","Posts"),
                  _buildStat("1.2","Followers"),
                  _buildStat("300","Following"),
                ],
              ),

            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              "You're Now following - 'Irzan Ahmad'.",
                              style: TextStyle(color: Colors.deepOrangeAccent),
                            ),
                            backgroundColor: Colors.black,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                        padding: const EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ).copyWith(
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                              (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.white;
                            }
                            return Colors.deepOrange;
                          },
                        ),
                        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                              (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.deepOrange;
                            }
                            return Colors.white;
                          },
                        ),
                      ),
                      child: Text(
                        "F o l l o w",
                        style: GoogleFonts.orbitron(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              "Person is Busy at the moment. Try later.",
                              style: TextStyle(color: Colors.deepOrangeAccent),
                            ),
                            backgroundColor: Colors.black,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,           // Default: White
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ).copyWith(
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                              (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.black;
                            }
                            return Colors.white;
                          },
                        ),
                        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                              (states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.white;
                            }
                            return Colors.black;
                          },
                        ),
                      ),
                      child: Text(
                        "M e s s a g e",
                        style: GoogleFonts.orbitron(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        Text(label)
      ],
    );
  }
  }