import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) {
        return const AlertDialog(content: Text('Password reset link sent! Please check your email.'));
      });
    } on FirebaseAuthException catch(e) {
      print(e);
      showDialog(context: context, builder: (context) {
        return AlertDialog(content: Text(e.message.toString()));
      });
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Enter your email and we will send you password reset link ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                      filled: true,
                      hintStyle: const TextStyle(fontFamily: 'RobotoMono'))),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
                onPressed: passwordReset,
                color: Colors.black,
                child: const Text(
                  'Reset Password',
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'RobotoMono'),
                ))
          ],
        ));
  }
}
