import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_keep_clone/models/note_model.dart';

class FirebaseApi {
  static Future<String> createNote(Note note) async {
    final docnote = FirebaseFirestore.instance.collection('note').doc();
    note.id = docnote.id;
    await docnote.set(note.toJson());
    return docnote.id;
  }

  static Stream<List<Note>> getNote() => 
  FirebaseFirestore.instance.collection('note')
      .snapshots()
      .map((event) => event.docs.map((json) =>
       Note.fromJson(json.data())).toList());
}
