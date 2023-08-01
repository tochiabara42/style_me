import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('My Cart'),
      ),
    );
  }
}