import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_images.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';

class CutomProcessBar extends StatelessWidget {
  const CutomProcessBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _pHori = 40.0;
    final _size = MediaQuery.of(context).size.width - _pHori * 2;
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
      builder: (context, state) {
        final _currentPosition = state.currentPosition.inSeconds.toDouble();
        final _endPosition = state.endPosition.inSeconds.toDouble();
        final _ratioCurrentPosition = _currentPosition / (_endPosition / _size);

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
                  Positioned(
                    left: _ratioCurrentPosition,
                    width: 1,
                    height: 60,
                    child: Container(
                      color: MyColors.colorGray,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _timeSong(state.currentTime),
                _timeSong(state.totalTime)
              ],
            ),
          ],
        );
      },
    );
  }

  Text _timeSong(String time) {
    return Text(
      time,
      style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
    );
  }
}
