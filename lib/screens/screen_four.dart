import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Fourth Route'),
      ),
    );
  }
}