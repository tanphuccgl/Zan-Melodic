import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zanmelodic/src/models/firestore_model.dart';

class XTracks extends BaseModel {
  String name;
  String author;
  String link;
  String image;

  XTracks({
    this.name = '',
    this.author = '',
    this.link = '',
    this.image = '',
    String id = '',
  }) : super(id: id);

  factory XTracks.fromJson(Map<String, dynamic> json) {
    return XTracks(
      name: json['name'],
      author: json['author'],
      link: json['link'],
      id: json['id'],
      image: json['image'],
    );
  }

  factory XTracks.empty() {
    return XTracks();
  }
  factory XTracks.formDocument(DocumentSnapshot doc) {
    return XTracks.fromJson(doc.data() as Map<String, dynamic>);
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
