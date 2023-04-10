import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:nano_dictionary/all_users.dart';
import 'package:nano_dictionary/search_sample.dart';
import 'package:nano_dictionary/words.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAll = false;
  Color? color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(14)),
                    gradient: LinearGradient(colors: [
                      Colors.blueGrey[900]!,
                      const Color.fromARGB(255, 3, 11, 16)
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                  ),
                  child: Column(
                    children: const [
                      SizedBox(height: 40),
                      Text(
                        'Glossary of electronics and \nnanoelectronics specialty',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                color = Colors.amber[400];
              });
              Future.delayed(const Duration(seconds: 3));
              setState(() {
                color = const Color.fromARGB(255, 255, 255, 255);
              });
            },
            child: Ink(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Image.asset(
                'assets/titu.png',

                // color: color,
                height: 222,
                width: 222,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 10),
                backgroundColor: Colors.blueGrey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.amber),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: ((_) {
                  return const Search();
                })));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '   Search   ',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
          Divider(
            color: color,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  radius: 59,
                  onTap: () {
                    setState(() {
                      allUsers.shuffle();
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.shuffle),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Shuffle',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  radius: 59,
                  onTap: () {
                    setState(() {
                      isAll = !isAll;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      isAll ? 'Show less' : 'Show all',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: color,
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: isAll ? wordList.length : 20,
              itemBuilder: (context, index) {
                return ExpansionTileCard(
                  turnsCurve: Curves.bounceOut,
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.amber,
                  ),
                  animateTrailing: true,
                  expandedTextColor: Colors.blueGrey[900],
                  expandedColor: const Color.fromARGB(255, 48, 110, 111),
                  borderRadius: BorderRadius.circular(10),
                  baseColor: const Color.fromARGB(255, 4, 18, 26),
                  initialPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  finalPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    allUsers[index]['word'],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(allUsers[index]['def']),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
