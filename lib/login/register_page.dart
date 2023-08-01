import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  Future signUp() async {

//authenticate user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(),
       password: passwordController.text.trim(),);

       //add user details
addUserDetails(
  firstNameController.text.trim(),
  lastNameController.text.trim(),
  emailController.text.trim(),
);
    }
  }

  Future addUserDetails(String firstName,  String lastName, String email,) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name' : firstName,
      'last name': lastName,
      'email': email,
    })
    ;
  }

 bool passwordConfirmed() {
  if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
    return true;
  } else {
    return false;
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 164, 162, 162),
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: const Text(
                  'Register here ↓ ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),

                            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'First Name',
                        hintStyle: const TextStyle(fontFamily: 'RobotoMono'),
                        fillColor: Colors.grey[200],
                        filled: true)),
              ),
              const SizedBox(height: 10),


                                          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Last Name',
                        hintStyle: const TextStyle(fontFamily: 'RobotoMono'),
                        fillColor: Colors.grey[200],
                        filled: true)),
              ),


              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Email',
                                 hintStyle: const TextStyle(fontFamily: 'RobotoMono'),
                        fillColor: Colors.grey[200],
                        filled: true)),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Password',
                                 hintStyle: const TextStyle(fontFamily: 'RobotoMono'),
                        fillColor: Colors.grey[200],
                        filled: true)),
              ),
                            const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Confirm Password',
                                 hintStyle: const TextStyle(fontFamily: 'RobotoMono'),
                        fillColor: Colors.grey[200],
                        filled: true)),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                          child: Text('Sign up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'RobotoMono',
                              )))),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I am a member!',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(' Login here',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                          ))),
                ],
              )
            ]),
          )),
        ));
  }
}
