import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.audio}) : super(key: key);
  final XAudio audio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: CustomImage(
        urlImage: audio.image,
        id: int.parse(audio.id),
        height: 115.0,
        width: 115.0,
      ),
    );
  }
}
