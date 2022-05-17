import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_images.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';

class CutomProcessBar extends StatelessWidget {
  const CutomProcessBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _pHori = 40.0;
    final _size = MediaQuery.of(context).size.width - _pHori * 2;
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        final _current = state.progress.current.inSeconds.toDouble();
        final _total = state.progress.total.inSeconds.toDouble();
        final _posSeek = _current / (_total / _size);

        return Column(
          children: [
            SizedBox(
              height: 60,
              child: Stack(
                children: [
                  Image.asset(
                    MyImage.audio,
                    color: MyColors.colorWhite1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ProgressBar(
                      progress: state.progress.current,
                      buffered: state.progress.buffered,
                      total: state.progress.total,
                      onSeek: state.audioHandler.seek,
                      timeLabelLocation: TimeLabelLocation.none,
                      thumbCanPaintOutsideBar: false,
                      baseBarColor: Colors.transparent,
                      thumbColor: Colors.transparent,
                      thumbGlowColor: Colors.transparent,
                      progressBarColor: Colors.transparent,
                      bufferedBarColor: Colors.transparent,
                      thumbGlowRadius: 30,
                    ),
                  ),
                  Positioned(
                    left: _posSeek,
                    width: 1,
                    height: 60,
                    child: Container(
                      color: MyColors.colorGray,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _timeSong(state.progress.current),
                _timeSong(state.progress.total)
              ],
            ),
          ],
        );
      },
    );
  }

  Text _timeSong(Duration duration) {
    return Text(
      XUtils.formatDuration(duration),
      style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
    );
  }
}
