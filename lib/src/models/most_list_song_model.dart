import 'package:cloud_firestore/cloud_firestore.dart';

class MostListenSong {
  String name;
  int numberListen;
  MostListenSong({
    this.name = '',
    this.numberListen = -1,
  });
  factory MostListenSong.fromJson(Map<String, dynamic> json) {
    return MostListenSong(
      name: json['name'],
      numberListen: json['numberListen'],
    );
  }

  factory MostListenSong.empty() {
    return MostListenSong();
  }
  factory MostListenSong.formDocument(DocumentSnapshot doc) {
    return MostListenSong.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['numberListen'] = numberListen;

    return data;
  }
}
