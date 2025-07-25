// ignore_for_file: deprecated_member_use

import 'package:buddy/res/contants/colors_contants.dart';
import 'package:buddy/Auth/signUp.dart';
import 'package:buddy/CreatorScreens/subscription.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({super.key});

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
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Navigate back
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: ColorsContants.primaryColor,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/login.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 30),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: ColorsContants.primaryColor,
                  ),
                ),
                Text(
                  "Please Sign In your account",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsContants.textColor,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("    View Password"),
                    Transform.scale(
                      scale: 0.75,
                      child: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: ColorsContants.primaryColor,
                        activeTrackColor:
                            ColorsContants.primaryColor.withOpacity(0.5),
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Subscription(),
                      ),
                    );
                  },
                  child: Text("Sign In", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),

                // Social login divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or login with"),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),
                SizedBox(height: 16),

                // Google and Facebook buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    InkWell(
                      onTap: () {
                        // TODO: Implement Google Sign-In
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorsContants.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Google.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    // Facebook
                    InkWell(
                      onTap: () {
                        // TODO: Implement Facebook Sign-In
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorsContants.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/Facbook.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Sign Up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorsContants.primaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
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
