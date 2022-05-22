import 'package:flutter/material.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/audio_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.audio}) : super(key: key);
  final XAudio audio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: MyProperties.borderRadius,
        child: Image.network(
          audio.image,
          height: 115.0,
          width: 115.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
