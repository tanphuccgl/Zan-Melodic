import 'package:zanmelodic/src/models/tracks_model.dart';

class XFolder {
  String link;
  String id;
  String date;
  int color;
  double size;
  List<XTracks>? listTracks;

  XFolder({
    this.link = '',
    this.listTracks,
    this.date = '',
     this.color=0,
    this.size = 0.0,
    this.id = '',
  });
  factory XFolder.fromJson(Map<String, dynamic> json) {
    return XFolder(
      size: json['size'].toDouble(),
      date: json['date'],
      listTracks: (json['listTracks'] as List)
            .map((e) => XTracks.fromJson(e))
            .toList(),
      link: json['link'],
      id: json['id'],
      color: json['color'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size'] = size;
    data['link'] = link;
    data['date'] = date;
    data['color'] = color;
     if (listTracks != null) {
      data['listTracks'] = listTracks!.map((v) => v.toJson()).toList();
    } else {
      data['listTracks'] = [];
    }

    return data;
  }
}
