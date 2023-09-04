
import 'package:esteps/screens/loginAndSignupScreens/login_screen.dart';
import 'package:flutter/material.dart';

import 'term&condition_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Image.asset(
                "assets/image.png",
                width: 330,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Community",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "    Join our community of\neducators, parents, teachers\n      and students",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 110,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginSignUpScreen()));
                  },
                  child: const Text("Skip",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TermConditionScreen()));
                  },
                  child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
