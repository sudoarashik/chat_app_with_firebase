import 'package:chat_app_with_firebase/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//get instance of firestore & auth
class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //getter for current user email
  String get currentUserEmail => _auth.currentUser?.email ?? '';

  //get user stream
  // List<Map<String, dynamic>> =
  // {
  //   'email' : test@gmail.com
  //   'id' : ...
  // }
  //
  // {
  // 'email' : test@gmail.com
  // 'id' : ...
  // }

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  //send messages
  Future<void> sendMessage(String receiverID, message) async {

    //get current user info

    final String currentUserId = _auth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
      senderID: currentUserId,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    //construct a chat room id for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverID];
    ids.sort(); //sort the ids (this ensures the chatroomID is the same for any 2 people)
    String chatRoomID = ids.join('_');

    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //get messages
  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    //construct a chatroom id for two users
    List<String> ids = [userID, otherUserID]; //fixed assignment
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false) //fixed method name
        .snapshots();
  }
}
