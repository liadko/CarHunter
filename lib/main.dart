// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'screens/second_screen.dart';
import 'screens/sign_in_page.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: accentColor)),
      home: SignInPage(),
    ),
  );
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  late BuildContext globalContext;
  bool goingToSecondScreen = false;

  void goToSecondScreen() {
    Navigator.of(globalContext).push(createRoute());
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Car Hunter"),
      ),
      body: gallery(),
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
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 10),
      itemCount: 11,
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
    return Stack(
      children: [
        //First Child, The Card Itself
        Container(
          height: 136,
          child: Stack(
            children: [
              //Picture
              Align(
                alignment: const Alignment(0.0, -1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                  child: Image.asset('images/CarHunterCard.jpg',
                      height: 109, width: 400, fit: BoxFit.cover),
                ),
              ),

              //Notch
              Align(
                alignment: const Alignment(0.0, 1),
                child: getMysteryNotch(index),
              ),
            ],
          ),
        ),

        //Second Child, the button
        Center(
          child: ElevatedButton(
              onPressed: () => cardPressed(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                // shape: RoundedRectangleBorder(
                //   side: const BorderSide(
                //       width: 1, // thickness
                //       color: Colors.deepPurple // color
                //       ),
                //   //border radius
                //   borderRadius: BorderRadius.circular(13),
                // ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 370,
                height: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                ),
              )),
        )
      ],
    );
  }

  Widget getMysteryNotch(int index) {
    return Container(
      width: 400,
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

  void cardPressed(int index) {
    if (goingToSecondScreen)
      return; //early return if already going to second screen
    goingToSecondScreen = true;
    Future.delayed(const Duration(milliseconds: 300), () {
      goToSecondScreen();
      goingToSecondScreen = false;
    });
  }
}

///TO ADD:
///floating action button on each card for adding a picture to it
