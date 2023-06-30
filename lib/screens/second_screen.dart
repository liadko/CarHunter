import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Second Page"),
      ),
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
