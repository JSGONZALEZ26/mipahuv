import 'package:cloud_firestore/cloud_firestore.dart';

class Commentary {
  String content, resourceID, user;
  double score;
  Timestamp createdAt;
  String id;

  Commentary(String content, String resourceID, String user, double score,
      Timestamp createdAt, String id) {
    this.content = content;
    this.resourceID = resourceID;
    this.user = user;
    this.score = score;
    this.createdAt = createdAt;
    this.id = id;
  }
}
