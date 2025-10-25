import 'package:chat_app_with_firebase/Auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home"),
    actions: [
      //logout button
      IconButton(onPressed: logout, icon: Icon(Icons.logout))
    ],));
  }
}
