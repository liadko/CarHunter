// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import '../utils/colors.dart';

enum LoginState { yetToChoose, createCollection, joinCollection }

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  LoginState loginState = LoginState.yetToChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Car Hunter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.deepPurple,
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Your Username',
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            loginButtons(),
          ],
        ),
      ),
    );
  }

  Widget loginButtons() {
    if (loginState == LoginState.yetToChoose)
      return Column(
        children: [
          const SizedBox(height: 40),
          homeButton("CREATE COLLECTION", LoginState.createCollection),
          const SizedBox(height: 20),
          homeButton("JOIN COLLECTION", LoginState.joinCollection),
        ],
      );
    if (loginState == LoginState.createCollection)
      return Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 50,
            child: TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.deepPurple,
                border: UnderlineInputBorder(),
                hintText: 'Choose Collection Name',
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          homeButtonsPhase2("CREATE"),
        ],
      );

    //Picked Join
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: 350,
          height: 50,
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusColor: Colors.deepPurple,
              border: UnderlineInputBorder(),
              hintText: 'Enter Invite Code',
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        homeButtonsPhase2("JOIN"),
      ],
    );
  }

  Widget homeButton(String text, LoginState stateToChangeTo) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
      onPressed: () => setState(() {
        loginState = stateToChangeTo;
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
        child: Text(
          text,
          style: const TextStyle(
            color: textColor,
            fontSize: 27,
            letterSpacing: 2,
            fontFamily: "Bahnschrift",
          ),
        ),
      ),
    );
  }

  Widget homeButtonsPhase2(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        backButton(),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () => setState(() {
            print("clicked " + text + " button");
          }),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: textColor,
                fontSize: 27,
                letterSpacing: 2,
                fontFamily: "Bahnschrift",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget backButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
      onPressed: () => setState(() {
        loginState = LoginState.yetToChoose;
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
        child: Text(
          "BACK",
          style: const TextStyle(
            color: textColor,
            fontSize: 27,
            letterSpacing: 2,
            fontFamily: "Bahnschrift",
          ),
        ),
      ),
    );
  }
}
