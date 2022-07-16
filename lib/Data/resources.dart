import 'package:cloud_firestore/cloud_firestore.dart';

class Resource {
  String category, description, name, source, subject, id;
  Timestamp createdAt;

  Resource(String category, String description, String name, String source,
      String subject, Timestamp createdAt, String id) {
    this.category = category;
    this.description = description;
    this.name = name;
    this.source = source;
    this.subject = subject;
    this.createdAt = createdAt;
    this.id = id;
  }
}
