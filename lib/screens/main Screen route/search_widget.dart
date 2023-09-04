import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {},
                );
              });
            }),
          ),
          const SizedBox(
            height: 50,
          ),
          TextfieldWidget(colors: Colors.red,),
          const SizedBox(
            height: 10,
          ),
          TextfieldWidget(colors: Colors.blue,),
          const SizedBox(
            height: 10,
          ),
          TextfieldWidget(colors: Colors.black,),
          const SizedBox(
            height: 10,
          ),
          TextfieldWidget(colors: Colors.green,),
          const SizedBox(
            height: 10,
          ),
          TextfieldWidget(colors: Colors.yellow,),
          const SizedBox(
            height: 10,
          ),
          TextfieldWidget(colors: Colors.orange,),
        ],
      ),
    );
  }

  
}

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({super.key, required this.colors});
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.arrow_right_outlined,
            size: 80,
            color: colors,
          ),
          const SizedBox(
            width: 280,
            child: TextField(
              //obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}
