import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class DialogAddToPlaylist extends StatelessWidget {
  const DialogAddToPlaylist({Key? key, required this.idSong}) : super(key: key);
  final int idSong;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
      builder: (context, playlistDetailState) {
        return BlocBuilder<PlaylistBloc, PlaylistState>(
          builder: (context, state) {
            XHandle<List<PlaylistModel>> _handle = state.items;
            if (_handle.isCompleted) {
              _handle = XHandle.result(XResult.success(state.items.data ?? []));
              final List<PlaylistModel> _items = _handle.data ?? [];
              state.isSortName
                  ? state.sortListByNameReverse
                  : state.sortListByName;
              state.isShuffle ? _items.shuffle() : null;
              return _items.isNotEmpty
                  ? AlertDialog(
                      backgroundColor: MyColors.colorBlack,
                      contentPadding: const EdgeInsets.all(16.0),
                      content: SizedBox(
                          width: 300.0,
                          child: ListView(
                            shrinkWrap: true,
                            children: ListTile.divideTiles(
                                color: MyColors.colorWhite,
                                tiles: _items.map((item) {
                                  //TODO
                                  /// nếu idsong bằng với idSong trong playlist
                                  /// thì true còn nếu chưa có thì false
                                  /// input idsong với idsong của playlist
                                  /// => lấy idsong của playlist
                                  /// => get data song của từng playlist
                                  ///
                                  ///
                                  log(item.toString());
                                  return ListTile(
                                    dense: true,
                                    selectedColor: MyColors.colorPrimary,
                                    selected:
                                        item == state.playlist ? true : false,
                                    onTap: () => context
                                        .read<PlaylistBloc>()
                                        .changePlaylist(item),
                                    title: Text(
                                      item.playlist,
                                    ),
                                  );
                                })).toList(),
                          )),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => XCoordinator.pop(context),
                            child: Text(
                              'CANCEL',
                              style: Style.textTheme().titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            )),
                        TextButton(
                            onPressed: () => context
                                .read<PlaylistBloc>()
                                .addToPlaylist(context,
                                    idPlaylist: state.playlist.id,
                                    idSong: idSong),
                            child: Text('ADD',
                                style: Style.textTheme().titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17))),
                      ],
                    )
                  : const XStateEmptyWidget(
                      isSliver: false,
                    );
            } else if (_handle.isLoading) {
              return const XStateLoadingWidget(isSliver: false);
            } else {
              return const XStateErrorWidget(isSliver: false);
            }
          },
        );
      },
    );
  }
}
