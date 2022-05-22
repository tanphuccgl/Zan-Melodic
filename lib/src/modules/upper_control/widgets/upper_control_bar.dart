import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/songs_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';
import 'package:zanmelodic/src/widgets/button/shuffle_button.dart';
import 'package:zanmelodic/src/widgets/button/sort_button.dart';

class UpperControlBar extends StatelessWidget {
  final VoidCallback? onPressedPlay;
  const UpperControlBar({
    Key? key,
    this.onPressedPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _sizeButton = 30.0;
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SortButton(),
        Row(
          children: [
            const ShuffleButton(size: _sizeButton),
            BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
              List<SongModel> _items = state.items.data ?? [];
              return ImageButton(
                icon: MyIcons.playIcon,
                size: _sizeButton,
                onPressed: onPressedPlay ??
                    () =>
                        context.read<AudioHandleBloc>().playItem(items: _items),
              );
            })
          ],
        )
      ]),
    );
  }
}
