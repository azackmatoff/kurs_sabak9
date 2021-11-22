import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurs_sabak9/models/user_model.dart';

class ChatScreenTest extends StatefulWidget {
  const ChatScreenTest({Key key, this.userCredential}) : super(key: key);

  final UserCredential userCredential;

  static const String id = 'chat_screen';

  @override
  _ChatScreenTestState createState() => _ChatScreenTestState();
}

class _ChatScreenTestState extends State<ChatScreenTest> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users =
        <UserModel>[]; //tizme bashinda bosh bolush kerek, null emes

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('users').get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> datas =
        querySnapshot.docs;

    for (var data in datas) {
      if (data.exists) {
        UserModel user = UserModel.fromJson(data.data());
        users.add(user);
      }
    }

    return users;
  }

  // Misal
  f1() {}

  //Versiya 1
  f2() {
    return f1();
  }

  //Versiya 2, kiska jolu
  f3() => f1();

  Stream<List<UserModel>> streamUsers() {
    final Stream<QuerySnapshot> _usersStream =
        firestore.collection('users').snapshots();
    return _usersStream.map((data) =>
        data.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Center(
        child:

            /// Bul StreamBuilder uchun misal
            StreamBuilder<List<UserModel>>(
          stream: streamUsers(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<UserModel> _users = snapshot.data;

              log('_users: $_users');

              return ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  UserModel _user = _users[index];

                  return Text(
                    'User Credential Email: ${_user.lastname}',
                    style: TextStyle(fontSize: 22.0),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),

        /// Bul FutureBuilder uchun misal
        //  FutureBuilder<List<UserModel>>(
        //   future: getUsers(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        //     if (snapshot.hasData) {
        //       List<UserModel> _users = snapshot.data;

        //       log('_users: $_users');

        //       return ListView.builder(
        //         itemCount: _users.length,
        //         itemBuilder: (context, index) {
        //           UserModel _user = _users[index];

        //           return Text(
        //             'User Credential Email: ${_user.lastname}',
        //             style: TextStyle(fontSize: 22.0),
        //           );
        //         },
        //       );
        //     } else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),
      ),
    );
  }
}
