import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';

class CustomImage extends StatelessWidget {
  final int id;
  final double? height;
  final double? width;
  final ArtworkType artworkType;
  final bool isShadow;
  final String? urlImage;
  const CustomImage(
      {Key? key,
      required this.id,
      this.urlImage,
      this.isShadow = false,
      this.height = double.infinity,
      this.width = double.infinity,
      this.artworkType = ArtworkType.AUDIO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: isShadow
          ? BoxDecoration(borderRadius: MyProperties.borderRadius, boxShadow: [
              BoxShadow(
                offset: const Offset(10, 20),
                color: MyColors.colorShadowImageNowPlaying.withOpacity(0.25),
              )
            ])
          : null,
      child: urlImage == null
          ? QueryArtworkWidget(
              artworkBorder: MyProperties.borderRadius,
              id: id,
              type: artworkType,
              keepOldArtwork: true,
              nullArtworkWidget: Image.asset(
                MyIcons.noImageIcon,
                height: height,
                width: width,
                fit: BoxFit.fill,
              ),
            )
          : ClipRRect(
              borderRadius: MyProperties.borderRadius,
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                urlImage ?? 'N/A',
                gaplessPlayback: false,
                repeat: ImageRepeat.noRepeat,
                scale: 1.0,
                height: height,
                width: width,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
            ),
    );
  }
}
