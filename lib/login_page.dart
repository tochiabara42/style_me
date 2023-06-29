import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
  }

@override 
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(image: AssetImage('assets/styleme.jpg')),
              const Text('Hello❤️‍🔥',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 64,
                      fontFamily: 'Pacifico')),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: emailController,
                          style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email'),
                        ))),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: passwordController,
                          style: const TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 14,
                          ),
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your password'),
                        ))),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 92, 92),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                          child: Text('Sign in',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'RobotoMono',
                              )))),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  Text(' Register here',
                      style: TextStyle(
                        color: Color.fromARGB(255, 227, 97, 97),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ))
                ],
              )
            ]),
          )),
        ));
  }
}
