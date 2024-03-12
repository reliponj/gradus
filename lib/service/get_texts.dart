import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../states.dart';

Future<void> getTexts() async {
  CollectionReference collection =
  FirebaseFirestore.instance.collection('texts');
  DocumentSnapshot docSnapshot =
  await collection.doc('phrases').get();
  final _phrases = Hive.box('phrases');

  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

    _phrases.put("textsPhrase", data['phrase']);
    _phrases.put("textsCancel", data['cancel']);
    _phrases.put("textsWinner", data['goodPhrase']);

  } else {
    print('Документ не найден.');
  }
}
