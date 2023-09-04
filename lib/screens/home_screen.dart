import 'package:flutter/material.dart';

import 'main Screen route/account.dart';
import 'main Screen route/chat_widget.dart';
import 'main Screen route/home_widget.dart';
import 'main Screen route/product_widget.dart';
import 'main Screen route/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  int pageIndex = 0;

  pageChooser() {
    switch (this.pageIndex) {
      case 0:
        return new home();

      case 1:
        return new product();

      case 2:
        return Search();

      case 3:
        return new Chat();

      case 4:
        return new Account();

      default:
        return new Container(
          child: new Center(
              child: new Text('No page found by page chooser.',
                  style: new TextStyle(fontSize: 30.0))),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: pageChooser(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (int tappedIndex) {
            setState(() {
              this.pageIndex = tappedIndex;
            });
          },
          elevation: 5,
          // type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.black),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined, color: Colors.black),
              label: 'E-Step',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined, color: Colors.black),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.black),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
