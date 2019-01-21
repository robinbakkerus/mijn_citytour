// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_service.dart';
import '../model/locatie.dart';

class FirestoreService implements IDataService {

  

  @override 
  Future<List<Lokatie>> getData(String geohash) async {
    // Firestore.instance.collection('lokaties');
    Firestore.instance.collection('lokaties').where('geohash', isEqualTo: 1)
    .snapshots.(
          (data) => print('grower ${data.documents[0]['name']}')
    );
  }


  List<Lokatie> _fill() {

var citiesRef = Firestore.instance.collection('lokaties');
var query = citiesRef..orderBy('geohash').startAt("x").endAt('z')
  .then(snapshot => {
    if (snapshot.empty) {
      console.log('No matching documents.');
      return;
    }  

    snapshot.forEach(doc => {
      console.log(doc.id, '=>', doc.data());
    });
  })
  .catch(err => {
    console.log('Error getting documents', err);
  });
    return null;
  }
}

// Future<void> main() async {
 
//   runApp(MaterialApp(
//       title: 'Firestore Example', home: MyHomePage()));
// }

// class MessageList extends StatelessWidget {
//   MessageList();


//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('lokaties').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return const Text('Loading...');
//         final int messageCount = snapshot.data.documents.length;
//         return ListView.builder(
//           itemCount: messageCount,
//           itemBuilder: (_, int index) {
//             final DocumentSnapshot document = snapshot.data.documents[index];
//             return ListTile(
//               title: Text(document['name'] ?? '<No message retrieved>'),
//               subtitle: Text('Message ${index + 1} of $messageCount'),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({this.firestore});
//   final Firestore firestore;
//   CollectionReference get messages => firestore.collection('messages');

//   Future<void> _addMessage() async {
//     await messages.add(<String, dynamic>{
//       'message': 'Hello world!',
//       'created_at': FieldValue.serverTimestamp(),
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Firestore Example'),
//       ),
//       body: MessageList(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addMessage,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }