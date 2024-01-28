import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nano_dictionary/all_users.dart';
import 'package:nano_dictionary/search_sample.dart';
import 'package:nano_dictionary/words.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAll = false;
  Color? color = const Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: const Text(
          'Glossary of electronics and \nnanoelectronics specialty',
          style: TextStyle(fontSize: 22, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 235, 249, 255),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 180.0, horizontal: 27),
            child: Center(
              child: Image.asset(
                'assets/titu.png',

                // color: color,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 0, 35, 53).withOpacity(.8),
                  const Color.fromARGB(255, 3, 11, 16).withOpacity(.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 4.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(top: 10),
                        backgroundColor: Colors.blueGrey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Color.fromARGB(255, 36, 255, 7)),
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
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: color,
                    thickness: 3,
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
                              const Icon(
                                Icons.shuffle,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Shuffle',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
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
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: color,
                    thickness: 3,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: isAll ? wordList.length : 20,
                      separatorBuilder: (context, index) => const Divider(height: 4),
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          // turnsCurve: Curves.bounceOut,
                          trailing: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromARGB(255, 36, 255, 7),
                          ),

                          // expandedTextColor: Colors.blueGrey[900],
                          // expandedColor: const Color.fromARGB(255, 48, 110, 111),
                          // borderRadius: BorderRadius.circular(10),
                          // baseColor: const Color.fromARGB(255, 4, 18, 26),
                          // initialPadding:
                          // const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          // finalPadding:
                          // const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          title: Text(
                            allUsers[index]['word'],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                allUsers[index]['def'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
