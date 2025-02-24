import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../comonents/textfield.dart';
import '../services/auth/auth_services.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void login() async {
    final authServices = AuthServices();

    try {
      await authServices.signInWithEmail(
          widget.emailController.text, widget.passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text(e.toString()),
        ),
      );
    }
  }

  void forgotPassword() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_outlined,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 20),
              Text(
                'Food Delivery',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              const SizedBox(height: 20),

              // Email
              LoginTextField(
                controller: widget.emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              // Password
              LoginTextField(
                controller: widget.passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 25),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
