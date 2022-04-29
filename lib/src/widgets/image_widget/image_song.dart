import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class ImageSongWidget extends StatelessWidget {
  const ImageSongWidget(
      {Key? key,
      required this.song,
      this.height = double.infinity,
      this.width = double.infinity})
      : super(key: key);
  final SongModel song;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      artworkBorder: BorderRadius.circular(20.0),
      artworkHeight: height,
      artworkWidth: width,
      id: song.id,
      type: ArtworkType.AUDIO,
      keepOldArtwork: true,
      nullArtworkWidget: const Icon(
        Icons.image_not_supported,
        size: 50,
        color: MyColors.colorWhite,
      ),
    );
  }
}
