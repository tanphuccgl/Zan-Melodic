import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zanmelodic/src/models/firebase_model.dart';

class XAudio extends BaseModel {
  String name;
  String author;
  String link;
  String image;

  XAudio({
    this.name = '',
    this.author = '',
    this.link = '',
    this.image = '',
    String id = '',
  }) : super(id: id);

  factory XAudio.fromJson(Map<String, dynamic> json) {
    return XAudio(
      name: json['name'],
      author: json['author'],
      link: json['link'],
      id: json['id'],
      image: json['image'],
    );
  }

  factory XAudio.empty() {
    return XAudio();
  }
  factory XAudio.formDocument(DocumentSnapshot doc) {
    return XAudio.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author'] = author;
    data['link'] = link;
    data['name'] = name;
    data['image'] = image;

    return data;
  }
}
