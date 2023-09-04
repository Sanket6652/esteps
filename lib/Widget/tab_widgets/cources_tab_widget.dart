import 'package:flutter/material.dart';

class courcesTabwidget extends StatelessWidget {
  courcesTabwidget({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.filter_alt,
                  size: 35,
                ),
                onPressed: () => _searchController.clear(),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Card(),
                SizedBox(
                  width: 15,
                ),
                Card(),
                SizedBox(
                  width: 15,
                ),
                Card(),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                subject("all"),
                const SizedBox(
                  width: 20,
                ),
                subject("Science"),
                const SizedBox(
                  width: 20,
                ),
                subject("Math"),
                const SizedBox(
                  width: 20,
                ),
                subject("Biology"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Teachers of the week",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
        )
      ],
    );
  }

  Widget subject(String subjectname) {
    return Container(
      width: 86,
      height: 38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: const Color(0xff2f80ed)),
      child: Center(
        child: Text(subjectname,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 227,
          height: 278,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/man.jpeg",
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("TEACH Math in easy waywith John",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text("5.0",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
