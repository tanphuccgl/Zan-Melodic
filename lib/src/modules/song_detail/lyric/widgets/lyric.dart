import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/song_detail/lyric/widgets/lyric_empty.dart';

class Lyric extends StatelessWidget {
  const Lyric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        final media = state.currentSong;

        final String lyric = media.extras!['lyric'] ?? 'N/A';

        return lyric == 'N/A'
            ? const LyricEmpty()
            : SliverPadding(
                padding: const EdgeInsets.only(bottom: 230),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      lyric.replaceAll('\\n ', '\n'),
                      textAlign: TextAlign.center,
                      style: Style.textTheme().titleMedium!.copyWith(
                          fontSize: 15, height: 2, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
