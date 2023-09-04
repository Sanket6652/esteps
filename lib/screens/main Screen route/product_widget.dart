import 'package:flutter/material.dart';

import '../../Widget/tab_widgets/Product_tab_Widget.dart';
import '../../Widget/tab_widgets/cources_tab_widget.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                    tabs: const [
                      Tab(
                        child: Text(
                          "Product",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Cources",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children:  [productTabWidget(), courcesTabwidget()]),
          )
        ],
      ),
    );
  }
}

