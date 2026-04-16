import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      showMsg("Please fill all fields");
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      showMsg("Passwords do not match");
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': DateTime.now(),
        'uid': userCredential.user!.uid,
      });

      showMsg("Registered Successfully.");
      Navigator.pushReplacementNamed(context, '/');

    } on FirebaseAuthException catch (e) {
      showMsg(e.message ?? "An error occurred");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: GoogleFonts.montserrat(color: Colors.deepOrangeAccent)),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
            padding: const EdgeInsets.all(20),
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
                    controller: nameController,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.deepOrange))),
                  ),

                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.deepOrange))),
                  ),

                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.black,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.deepOrange),
                        )),
                  ),

                  const SizedBox(height: 15),
                  TextFormField(
                    controller: confirmPasswordController,
                    cursorColor: Colors.black,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: GoogleFonts.poppins(color: Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.deepOrange),
                        )),
                  ),

                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : createAccount,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                        padding: const EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 3,
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : Text(
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
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Text(
                          "SignIn ",
                          style: GoogleFonts.poppins(color: Colors.deepOrange, fontSize: 13, fontWeight: FontWeight.w600),
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