import 'package:esteps/Widget/EmailTextField_widget.dart';
import 'package:esteps/screens/home_screen.dart';
import 'package:esteps/user_auth/verify_email.dart';
import 'package:esteps/user_auth/firebase_auth_implemetation/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  CollectionReference teacher =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 8),
            child: Text("Sign Up",
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
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Enter Name",
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
                      hintText: "Enter Password",
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: 
              _signup,         
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Sign Up",
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
        ]),
      ),
    );
  }

  Future<void> _signup() async {
    String name = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signupWithEmailAndPassword(email, password);

    if (user != null) {
      print("SignUp Success");
      await teacher
          .add({
            'Email': email,
            'name': name,
            'password': password
          })
          .then((value) => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VerifyEmail())))
          .catchError((error) => print("Failed to add user: $error"));
      
    } else {
      print("Error");
    }
  }
}
