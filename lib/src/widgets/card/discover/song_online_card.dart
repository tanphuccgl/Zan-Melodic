import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class SongOnlineCard extends StatelessWidget {
  final XAudio audio;
  final VoidCallback onTap;
  const SongOnlineCard({
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
            CustomImage(
              urlImage: audio.image,
              id: int.parse(audio.id),
              height: 70.0,
              width: 70.0,
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
