import 'package:esteps/screens/loginAndSignupScreens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('user').snapshots();    
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
              width: double.maxFinite,
              height: 40,
              decoration: const BoxDecoration(color: Color(0xff699bf7)),
              child: const Center(
                child: Text("Subscribe to Premium to enjoy more features",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
              )),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person_2_outlined,
                  size: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("john",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("Student",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.edit),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        const Column(
          children: [
            AccountWidget(
                Activityname: "My Transactions",
                icon: Icon(Icons.receipt_long)),
            AccountWidget(
                Activityname: "ESTEPS Store", icon: Icon(Icons.shopping_cart)),
            AccountWidget(
                Activityname: "Notification", icon: Icon(Icons.notifications)),
            AccountWidget(
                Activityname: "My Downloads", icon: Icon(Icons.download)),
            AccountWidget(Activityname: "Terms", icon: Icon(Icons.warning)),
            AccountWidget(Activityname: "Feed", icon: Icon(Icons.menu)),
          ],
        ),
        GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginSignUpScreen()));
          },
          child: Container(
            width: 146,
            height: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xff2f80ed)),
            child: const Center(
              child: Text("Log Out",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        )
      ],
    );
  }
}

// Account  section widget
class AccountWidget extends StatelessWidget {
  const AccountWidget(
      {super.key, required this.Activityname, required this.icon});
  final String Activityname;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(Activityname,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 2,
            width: 340,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
