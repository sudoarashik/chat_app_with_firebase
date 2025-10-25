import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {

  // Email & password text editing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // Tap to go Login page

  final void Function()? onTap;


  RegisterPage({super.key, required this.onTap });

  //Register Method
  void register() {}



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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

                // Create Account
                const Text(
                  "Let's Create an Account for You",
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

                const SizedBox(height: 10),

                //Confirm Password text field
                MyTextfield(
                  hintText: 'Confirm Password',
                  obscuretext: true,
                  controller: _confirmPwController,
                ),



                const SizedBox(height: 25),

                // Login button
                MyButton(
                  text: "Register",
                  onTap: register,
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account?",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),),

                    GestureDetector(
                      onTap: onTap,
                      child: Text("Login Now",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary
                        ),),
                    )
                  ],
                )

                // Register now text
              ],
            ),
          ),
        ),
      );
  }
}
