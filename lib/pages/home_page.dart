import 'package:chat_app_with_firebase/services/Auth/auth_service.dart';
import 'package:chat_app_with_firebase/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import '../pages/chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        actions: [
          // logout button
          // IconButton(onPressed: logout, icon: Icon(Icons.logout)),
        ],
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(context),
    );
  }

  // build a list of users except the current user logged in
  Widget _buildUserList(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading..."));
        }

        // return list view
        final users = snapshot.data!;
        return ListView(
          children: users.map((userData) {
            return _buildUserListItem(userData, context);
          }).toList(),
        );
      },
    );
  }

  // build individual list item for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // display all users except current user
    final currentUser = _authService.getCurrentUser();

    if (currentUser != null && userData["email"] != currentUser.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // tapped on a user --> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
