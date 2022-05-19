import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';

class FramesInfoWidget extends StatelessWidget {
  const FramesInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        final media = state.currentSong;

        return SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            width: 200,
            decoration: BoxDecoration(
                color: MyColors.colorWhite.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                _info(title: 'Name', subTile: media.title),
                _info(title: 'Album', subTile: media.album ?? ''),
                _info(title: 'Artist', subTile: media.artist ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _info({required String title, required String subTile}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 70,
              child: Text(title,
                  style: Style.textTheme().titleMedium!.copyWith(
                      fontSize: 15,
                      color: MyColors.colorWhite.withOpacity(0.5)))),
          Expanded(
            child: Text(subTile,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
