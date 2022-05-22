import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class SongCard extends StatelessWidget {
  final XAudio audio;
  final VoidCallback onTap;
  const SongCard({
    Key? key,
    required this.audio,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pVer = 6.0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, pVer, 20, pVer),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: MyProperties.borderRadius,
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                audio.image,
                gaplessPlayback: false,
                repeat: ImageRepeat.noRepeat,
                scale: 1.0,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XText(
                    title: '${audio.name}\n',
                    style: Style.textTheme().titleMedium,
                  ),
                  XText(
                      title: audio.author,
                      style: Style.textTheme()
                          .titleMedium!
                          .copyWith(fontSize: 17, color: MyColors.colorGray))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
