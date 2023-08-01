import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:style_me/screens/screen_one.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 80.0, right: 80.0, bottom: 40.0, top: 120),
              child: Image.asset('lib/images/avocado.png'),
            ),
            const Text(
              'We deliver groceries at your doorstep',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Fresh items everyday',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'RobotoMono'),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const ScreenOne();
              })),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.all(24.0),
                child: const Text(
                  'Get Started',
                  style:
                      TextStyle(fontFamily: 'RobotoMono', color: Colors.white),
                ),
              ),
            ),
            const Spacer()
          ],
        ));
  }
}
