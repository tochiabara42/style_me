import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

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
        backgroundColor: Colors.grey[500],
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('style ● me',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 64,
                      fontFamily: 'Mali')),
                                    const SizedBox(height: 30),
                            const SizedBox(height: 30),
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
                        fillColor: Colors.grey[200],
                        filled: true, hintStyle: const TextStyle(fontFamily: 'RobotoMono'))),
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
                        fillColor: Colors.grey[200],
                        filled: true, hintStyle: const TextStyle(fontFamily: 'RobotoMono'))),
              ),
                     const SizedBox(height: 10),
                     Padding(padding: 
                     const EdgeInsets.symmetric(horizontal: 25.0),
                     child: Row(mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const ForgotPasswordPage();
                          },
                          ),
                          );
                        },
                        child: const Text(
                          'Forgot password',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono')
                        ),
                      )
                     ],),),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(' Register here',
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
