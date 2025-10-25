import 'package:chat_app_with_firebase/services/Auth/auth_service.dart';
import 'package:chat_app_with_firebase/components/my_button.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // Email & password text editing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // Tap to go register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // Login method
  void login(BuildContext context) async {
    // authservice
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    }

    // catch my errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                Icons.message,
                size: 60,
              ),

              const SizedBox(height: 50),

              // Welcome back message
              const Text(
                'Welcome Back, You have been missed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // Email text field
              MyTextfield(
                hintText: 'Email',
                obscuretext: false,
                controller: _emailController,
              ),

              const SizedBox(height: 10),

              // Password text field
              MyTextfield(
                hintText: 'Password',
                obscuretext: true,
                controller: _pwController,
              ),

              const SizedBox(height: 25),

              // Login button
              MyButton(
                text: "Login",
                onTap: () => login(context),
              ),

              const SizedBox(height: 25),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a Member?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),

              // Register now text


            ],
          ),
        ),
      ),
    );
  }
}
