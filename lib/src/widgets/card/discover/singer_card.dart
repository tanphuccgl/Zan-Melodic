import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class SingerCard extends StatelessWidget {
  final XAudio audio;
  const SingerCard({Key? key, required this.audio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pVer = 6.0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, pVer, 20, pVer),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            urlImage: audio.image,
            id: int.parse(audio.id),
            height: 120.0,
            width: 120.0,
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
                  title: audio.name,
                  style: Style.textTheme().titleMedium,
                ),
                XText(
                  title: audio.author,
                ),
                const XText(title: '2022'),
                const XText(title: '1 track'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
