import 'package:buddy/res/contants/colors_contants.dart';
import 'package:buddy/Auth/login.dart';
import 'package:buddy/CreatorScreens/verificationCode.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedRole = 'buyer'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Back button
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: ColorsContants.primaryColor,
                      child: Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Image
                Image.asset(
                  'assets/signup.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 30),

                // Titles
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: ColorsContants.primaryColor,
                  ),
                ),
                Text(
                  "Create a new account",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                // Input fields
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email_outlined),
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    labelText: "Confirm Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 12),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    // You can pass `selectedRole` to your backend or next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationCode(),
                      ),
                    );
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or sign up with"),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),
                SizedBox(height: 16),

                // Google and Facebook Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // TODO: Google signup logic
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorsContants.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/Google.png',
                            height: 30, width: 30),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // TODO: Facebook signup logic
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorsContants.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/Facbook.png',
                            height: 30, width: 30),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Already have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          fontSize: 14, color: ColorsContants.primaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
