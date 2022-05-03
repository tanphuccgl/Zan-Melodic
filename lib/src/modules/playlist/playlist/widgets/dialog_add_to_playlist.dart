import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class DialogAddToPlaylist extends StatelessWidget {
  const DialogAddToPlaylist({Key? key, required this.idSong}) : super(key: key);
  final int idSong;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        final List<PlaylistModel> _items = state.playlistsDialog;
        state.isSortName ? state.sortListByNameReverse : state.sortListByName;
        state.isShuffle ? _items.shuffle() : null;
        return AlertDialog(
          backgroundColor: MyColors.colorBlack,
          contentPadding: const EdgeInsets.all(16.0),
          title: Text('Playlist', style: Style.textTheme().titleMedium),
          content: SizedBox(
              width: 300.0,
              child: _items.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      children: ListTile.divideTiles(
                          color: MyColors.colorWhite,
                          tiles: _items.map((item) {
                            return ListTile(
                              dense: true,
                              selectedColor: MyColors.colorPrimary,
                              selected: item == state.playlist ? true : false,
                              onTap: () => context
                                  .read<PlaylistBloc>()
                                  .changePlaylist(item),
                              title: Text(
                                item.playlist,
                              ),
                            );
                          })).toList(),
                    )
                  : const FittedBox(
                      fit: BoxFit.none,
                      child: XStateEmptyWidget(
                        isSliver: false,
                      ),
                    )),
          actions: <Widget>[
            TextButton(
                onPressed: () => XCoordinator.pop(context),
                child: Text(
                  'CANCEL',
                  style: Style.textTheme()
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 17),
                )),
            TextButton(
                onPressed: _items.isNotEmpty
                    ? () => context.read<PlaylistBloc>().addToPlaylist(context,
                        idPlaylist: state.playlist.id, idSong: idSong)
                    : null,
                child: Text('ADD',
                    style: Style.textTheme()
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 17))),
          ],
        );
      },
    );
  }
}
