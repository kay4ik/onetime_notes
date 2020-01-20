import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onetime_notes/models/note.dart';
import 'package:onetime_notes/services/userRepository.dart';

class Database {
  final _db = Firestore.instance;
  Stream myNotes = Stream.value(List<Note>());

  Future<String> pushNote(Note note) async {
    var collection = _db.collection("notes");
    var doc = await collection.add(note.toDocument());
    return Future.value(doc.documentID);
  }

  Future<Note> readNote(String id) async {
    var notes = _db.collection("notes");
    var docRef = notes.document(id);
    var doc = await docRef.get();
    var note;
    if (doc != null) {
      note = Note.fromDocument(doc.data);
      docRef.delete();
    }
    return Future.value(note);
  }

  void queryMyNotes() async {
    var uid = await UserRepository().userID();
    myNotes = _db.collection("notes").snapshots().map((list) => list.documents
      .where((doc) => doc.data["userid"] == uid)
      .map((doc) => Note.fromDocument(doc.data, doc.documentID)).toList()
    );
  }

  void deleteNote(String id) async {
    await _db.collection("notes").document(id).delete();
  }
}