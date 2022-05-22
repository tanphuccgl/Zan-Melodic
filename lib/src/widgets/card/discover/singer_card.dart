import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
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
          ClipRRect(
            borderRadius: MyProperties.borderRadius,
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              audio.image,
              gaplessPlayback: false,
              repeat: ImageRepeat.noRepeat,
              scale: 1.0,
              width: 120,
              height: 120,
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
