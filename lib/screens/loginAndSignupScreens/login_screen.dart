import 'package:esteps/screens/loginAndSignupScreens/signup.dart';
import 'package:esteps/user_auth/firebase_auth_implemetation/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Widget/EmailTextField_widget.dart';
import '../home_screen.dart';



class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 8),
                child: Text("Log In",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 8, top: 8),
                child: Text("Please log in to continue",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: EmailPasswordTextfieldWidget(
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "Enter Email",
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: EmailPasswordTextfieldWidget(
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          hintText: "Password",
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _signIn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        const Text("Remember me"),
                      ],
                    ),
                    const Text("|"),
                    const Text("Forgot Password ?")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const signup()));
                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.blue,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("SignIn Success");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      print("Error");
    }
  }
}
