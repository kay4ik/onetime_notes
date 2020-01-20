import 'dart:core';

class Note {
  String id;
  String subject;
  String content;
  String userid;
  DateTime create;

  Note({this.subject, this.content, this.create, this.userid, this.id});

  factory Note.fromDocument(Map<String, dynamic> document, [String id]) {
    if (document != null) {
      return Note(
        id: id ?? "",
        subject: document["subject"],
        content: document["content"],
        create: DateTime.parse(document["creation"]),
        userid: document["userid"] ?? "",
      );
    }
    else return null;
  }

  Map<String, dynamic> toDocument() {
    return {
      "subject": subject,
      "content": content,
      "creation": create.toString(),
      "userid": userid,
    };
  }
}
