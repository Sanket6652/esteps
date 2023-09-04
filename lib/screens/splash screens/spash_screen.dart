
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        decoration:  const BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/splash2.png"),
              fit: BoxFit.fill
            )
          ),
        child: Container(
          decoration:  const BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/splash.png"),
              fit: BoxFit.fill
            )
          ),
          child: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/esteps-logo1.png",width: 200,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "...redefining educational solutions",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                   
                  ],
                ),
                SizedBox(height: 150,),
                 ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const OnboardingScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
