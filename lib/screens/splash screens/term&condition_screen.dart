import 'package:flutter/material.dart';

import '../loginAndSignupScreens/login_screen.dart';
import 'onboarding_screen.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({super.key});

  @override
  State<TermConditionScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TermConditionScreen> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OnboardingScreen()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text("Terms & Conditions",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Container(
              width: 300,
              height: 515,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Welcome to ESTEPS! These Terms explain the rules you need to follow when you visit our marketplace located at ESTEPS and related subdomains (together, the ESTEPS Marketplace), "
                    "any affiliated web pages we may host (which together with the ESTEPS Marketplace, we refer to in these Terms as the “Sites”), our mobile applications (“Apps”), and any other"
                    "services we might offer (together the Sites, Apps, and related services are our “Services”)."
                    "\n                                                                           The ESTEPS Marketplace offers an open platform for educators and creators to discover,"
                    " buy, sell, and share their original content for teaching and learning, classroom decor, and supplies for creating such works (“Resources”). Resources may include electronically delivered files,"
                    " digital products, streaming video, physical or used goods, and other product types. ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue = !checkBoxValue;
                      });
                    },
                  ),
                  const Text("I agree"),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (checkBoxValue == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginSignUpScreen()));
                  } else {
                    _showToast(context);
                  }
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Please click Cheack Box'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

