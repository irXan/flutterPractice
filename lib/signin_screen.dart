import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "L O G I N",
          style: GoogleFonts.orbitron(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
            children: [
              Lottie.asset('assets/animations/signin.json', height: 180, width: 180),

              Text(
                "Welcome Back!",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.redAccent),
              ),

              const SizedBox(height: 10),
              Text(
                "SignIn to your Exclusive Account",
                style: GoogleFonts.playfair(fontSize: 14, color: Colors.red, letterSpacing: 1.1),
              ),

              SizedBox(height: 15),
              TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                  hintFadeDuration: Duration(milliseconds: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepOrange)
                  )
                ),
              ),

              SizedBox(height: 15),
              TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                    hintFadeDuration: Duration(milliseconds: 30),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.deepOrange)
                    )
                ),
              ),

              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Logged-In Successfully.", style: TextStyle(color: Colors.deepOrangeAccent)),
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );

                      Navigator.pushNamed(context, '/profile2');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      elevation: 3
                    ),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.orbitron(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                      ),
                    )),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Colors.black
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.deepOrangeAccent,
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
    );
  }
}
