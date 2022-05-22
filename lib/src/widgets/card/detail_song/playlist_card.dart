import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.media, required this.onTap})
      : super(key: key);
  final MediaItem media;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          height: 70,
          width: 70,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      CustomImage(
                        urlImage: media.extras!['image'],
                        id: int.parse(media.id),
                        height: 70.0,
                        width: 70.0,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            XText(
                              title: '${media.title}\n',
                              style: Style.textTheme().titleMedium,
                            ),
                            XText(
                                title: media.artist ?? '',
                                style: Style.textTheme().titleMedium!.copyWith(
                                    fontSize: 17, color: MyColors.colorGray))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
