import 'package:chat_app_with_firebase/services/Auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.grey[500],
        actions: [
          //logout button
          // IconButton(onPressed: logout, icon: Icon(Icons.logout)),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
