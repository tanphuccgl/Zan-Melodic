import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/songs_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class PlayAllButton extends StatelessWidget {
  const PlayAllButton({Key? key, this.onPressedPlay}) : super(key: key);
  final VoidCallback? onPressedPlay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
      List<SongModel> _items = state.items.data ?? [];
      return ImageButton(
        icon: MyIcons.playIcon,
        size: 30.0,
        onPressed: onPressedPlay ??
            () => _items.isEmpty
                ? null
                : context.read<AudioHandleBloc>().playItem(items: _items),
      );
    });
  }
}
