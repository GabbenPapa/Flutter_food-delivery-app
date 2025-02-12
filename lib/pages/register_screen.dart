import 'package:flutter/material.dart';

import '../comonents/textfield.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register_screen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                obscureText: false,
              ),
              const SizedBox(height: 20),

              // Password Confirm
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
                  onPressed: () {},
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      "Sign In",
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
