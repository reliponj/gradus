import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/Deck.dart';
import '../models/DeckCard.dart';
import '../states.dart';

class FirebaseCloud extends StatelessWidget {
  final String documentId;
  final String collectionId;

  FirebaseCloud({required this.documentId, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(collectionId);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

          return Text('');
          // return Image.network(data['card'][0]['image']);
        }

        return Text("");
      },
    );
  }
}