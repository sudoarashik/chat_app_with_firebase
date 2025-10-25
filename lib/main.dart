import 'package:chat_app_with_firebase/Auth/auth_gate.dart';
import 'package:chat_app_with_firebase/firebase_options.dart';
import 'package:chat_app_with_firebase/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Auth/login_or_register.dart';
import 'pages/login_page.dart';
import 'themes/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: LightMode,
    );
  }
}
