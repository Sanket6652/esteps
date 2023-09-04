import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class productTabWidget extends StatelessWidget {
  const productTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Popular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("See all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      )),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                CardFor(
                  ImageData: "assets/images/1.jpeg",
                  Discriptionofcard: 'Advanced Vocabularies for official works',
                  name: 'Lara Tuitions',
                  price: '5',
                  Rating: '5',
                  NoOfRating: '10',
                ),
                const SizedBox(
                  width: 15,
                ),
                CardFor(
                  ImageData: "assets/images/1.jpeg",
                  Discriptionofcard: 'Advanced Vocabularies for official works',
                  name: 'Lara Tuitions',
                  price: '5',
                  Rating: '5',
                  NoOfRating: '10',
                ),
                const SizedBox(
                  width: 15,
                ),
                CardFor(
                  ImageData: "assets/images/1.jpeg",
                  Discriptionofcard: 'Advanced Vocabularies for official works',
                  name: 'Lara Tuitions',
                  price: '5',
                  Rating: '5',
                  NoOfRating: '10',
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Valuable",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("See all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      )),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                CardFor(
                  ImageData: "assets/images/1.jpeg",
                  Discriptionofcard: 'Advanced Vocabularies for official works',
                  name: 'Lara Tuitions',
                  price: '5',
                  Rating: '5',
                  NoOfRating: '10',
                ),
                const SizedBox(
                  width: 15,
                ),
                CardFor(
                  ImageData: "assets/images/1.jpeg",
                  Discriptionofcard: 'Advanced Vocabularies for official works',
                  name: 'Lara Tuitions',
                  price: '5',
                  Rating: '5',
                  NoOfRating: '10',
                ),
                const SizedBox(
                  width: 15,
                ),
                CardFor(
                  ImageData: "assets/images/1.jpeg",
                  Discriptionofcard: 'Advanced Vocabularies for official works',
                  name: 'Lara Tuitions',
                  price: '5',
                  Rating: '5',
                  NoOfRating: '10',
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CardFor extends StatelessWidget {
  CardFor(
      {super.key,
      required this.ImageData,
      required this.Discriptionofcard,
      required this.name,
      required this.price,
      required this.Rating,
      required this.NoOfRating});
  late String ImageData;
  final String Discriptionofcard;
  final String name;
  final String price;
  final String Rating;
  final String NoOfRating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: 310,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    ImageData,
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Discriptionofcard,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.pink,
                    ),
                    Text(name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("\$" + price,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 227, 156, 33),
                      ),
                    ),
                    Text(
                      Rating,
                    ),
                    Text("(" + NoOfRating + ")+")
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: 164,
            height: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xff2f80ed)),
            child: const Center(
              child: Text("Buy Now",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ))
      ],
    );
  }
}
