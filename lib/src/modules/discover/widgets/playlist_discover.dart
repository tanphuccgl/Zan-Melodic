import 'package:flutter/material.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class PlaylistDiscoverWidget extends StatelessWidget {
  const PlaylistDiscoverWidget({Key? key, required this.audios})
      : super(key: key);
  final List<XAudio> audios;

  @override
  Widget build(BuildContext context) {
    return audios.isNotEmpty
        ? SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => _buildCard(audios[index])),
                itemCount: audios.length,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ))
        : const XStateEmptyWidget();
  }

  Widget _buildCard(XAudio audio) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: MyProperties.borderRadius,
        child: Image.network(
          audio.image,
          height: 115.0,
          width: 115.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
