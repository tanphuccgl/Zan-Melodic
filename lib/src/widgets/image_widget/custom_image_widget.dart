import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget(
      {Key? key,
      required this.id,
      this.isShadow = false,
      this.height = double.infinity,
      this.width = double.infinity,
      this.artworkType = ArtworkType.AUDIO})
      : super(key: key);
  final int id;
  final double? height;
  final double? width;
  final ArtworkType artworkType;
  final bool isShadow;

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
      child: QueryArtworkWidget(
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
      ),
    );
  }
}
