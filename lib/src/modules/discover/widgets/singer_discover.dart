import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SingerDiscoverWidget extends StatelessWidget {
  const SingerDiscoverWidget({Key? key, required this.audios})
      : super(key: key);
  final List<XAudio> audios;

  @override
  Widget build(BuildContext context) {
    return audios.isNotEmpty
        ? SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildCard(audios[index]);
              }, childCount: audios.length),
            ),
          )
        : const XStateEmptyWidget();
  }

  Widget _buildCard(XAudio audio) {
    const pVer = 6.0;
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
                CusText(
                  title: audio.name,
                  style: Style.textTheme().titleMedium,
                ),
                CusText(
                  title: audio.author,
                ),
                const CusText(title: '2022'),
                const CusText(title: '1 track'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
