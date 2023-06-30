import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SecondScreen extends StatelessWidget {
  //static String routeName = '/second-screen';
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 71, 102),
        title: const Text("Second Page"),
      ),
      //body: gallery(),

      body: const Align(
        alignment: Alignment.center,
        child: Text(
          "Second Screen!!!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
