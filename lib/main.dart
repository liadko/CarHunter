// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'screens/second_screen.dart';

void main() async {
  runApp(
    const MaterialApp(
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void moveToSecondScreen(BuildContext context) {
    Navigator.of(context).push(createRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Car Hunter"),
      ),

      //body: gallery(),

      body: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () => moveToSecondScreen(context),
          child: const Text("First Screen (boring)"),
        ),
      ),
    );
  }

  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

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
