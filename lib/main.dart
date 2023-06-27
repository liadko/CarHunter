// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'dart:math'; // random
import 'dart:async'; // periodic timer functions
import 'package:flutter/services.dart'; // vibrate

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentElement = "Hydrogen";
  String currentSymbol = "H";
  int currentIndex = 0;

  //List<PeriodicElement> elements = PeriodicElement.elementList();

  Color primaryColor = Color.fromARGB(255, 29, 27, 33);
  Color bgColor = Color.fromARGB(255, 24, 22, 28);

  Random rnd = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 73, 71, 102),
          title: const Text("Car Hunter"),
        ),
        body: gallery(),
        //floatingActionButton: ,
        //bottomNavigationBar: AboutDialog(),
      ),
    );
  }

  static const Color textColor = Color.fromARGB(255, 191, 175, 212);

  Widget gallery() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 11,
      ),
      padding: const EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
      itemCount: 102,
      itemBuilder: (BuildContext context, int index) {
        return galleryItem(index);
      },
    );
  }

  Widget galleryItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 20, 20, 26),
          border: Border.all(
            color: textColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              index.toString().padLeft(3, '0'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                letterSpacing: 6,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
