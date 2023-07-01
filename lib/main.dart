// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'screens/second_screen.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: accentColor)),
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

      body: gallery(),

      // body: Align(
      //   alignment: Alignment.center,
      //   child: ElevatedButton(
      //     onPressed: () => moveToSecondScreen(context),
      //     child: const Text("First Screen (boring)"),
      //   ),
      // ),
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
    return ListView.separated(
      padding: const EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
      itemCount: 31,
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemBuilder: (BuildContext context, int index) {
        return getCard(index);
      },
    );
  }

  Widget getCard(int index) {
    //return the card with the image or a mystery card
    return getMysteryCard(index);
  }

  Widget getCardFromInternet(int a) {
    return Container(
      //margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () => print("ciao"),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Image.asset('images/mystery_bg.png',
                    width: 300, height: 150, fit: BoxFit.fill),
              ),
              ListTile(
                title: Text('Pub 1'),
                subtitle: Text('Location 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMysteryCard(int index) {
    return Container(
      height: 136,

      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: notchColor,
      //     width: 2,
      //   ),
      //   borderRadius: BorderRadius.circular(13),
      // ),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
              child: Image.asset('images/CarHunterCard.jpg',
                  height: 109, width: 400, fit: BoxFit.fitWidth),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 1),
            child: getMysteryNotch(index),
          ),
        ],
      ),
    );
  }

  Widget getMysteryNotch(int index) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
          //color: Color.fromARGB(255, 20, 20, 26),
          // border: Border.all(
          //   color: Colors.white,
          //   width: 1,
          // ),
          //borderRadius: BorderRadius.circular(5),
          ),
      child: Stack(
        children: [
          //bottom part of notch
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 27,
              decoration: const BoxDecoration(
                color: notchColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
              ),
            ),
          ),
          // notch part of notch
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 90,
              height: 29,
              decoration: BoxDecoration(
                color: notchColor,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
          //plate number
          Align(
            alignment: Alignment(0, 0.35),
            child: Text(
              index.toString().padLeft(3, '0'),
              style: TextStyle(
                color: textColor,
                fontSize: 27,
                letterSpacing: 4,
                fontFamily: "Bahnschrift",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///TO ADD:
///floating action button on each card for adding a picture to it
