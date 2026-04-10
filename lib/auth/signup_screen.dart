import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "R E G I S T E R",
          style: GoogleFonts.orbitron(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                Lottie.asset('assets/animations/signup.json', height: 200, width: 200),

                Text(
                  "Register Your Exclusive Account",
                  style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.red),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.deepOrange)
                    )
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.deepOrange)
                      )
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.deepOrange),
                    )
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.deepOrange),
                    )
                  ),
                ),

                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Registered Successfully.", style: TextStyle(color: Colors.deepOrangeAccent)),
                        backgroundColor: Colors.black,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.deepOrangeAccent,
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.orbitron(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.montserrat(fontSize: 13, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        "SignIn ",
                        style: GoogleFonts.poppins(
                          color: Colors.deepOrange,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}