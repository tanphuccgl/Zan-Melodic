import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/empty_text_button.dart';
import 'package:zanmelodic/src/widgets/card/add_playlist_card.dart';
import 'package:zanmelodic/src/widgets/card/playlist_card.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({Key? key, required this.playlists}) : super(key: key);

  final List<PlaylistModel> playlists;

  @override
  Widget build(BuildContext context) {
    final List<PlaylistModel> leftItems = [];
    final List<PlaylistModel> rightItems = [];

    for (int i = 0; i < playlists.length; i++) {
      i % 2 == 0 ? leftItems.add(playlists[i]) : rightItems.add(playlists[i]);
    }
    return playlists.isNotEmpty
        ? SliverToBoxAdapter(
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _listWidget(
                itemsSplip: leftItems,
                playlists: playlists,
                isLeft: true,
              ),
              _listWidget(
                itemsSplip: rightItems,
                playlists: playlists,
              ),
            ],
          ))
        : const EmptyTextButton();
  }

  Widget _listWidget({
    required List<PlaylistModel> playlists,
    required List<PlaylistModel> itemsSplip,
    bool isLeft = false,
  }) {
    return Expanded(
      flex: 5,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: itemsSplip.map((e) => PlaylistCard(playlist: e)).toList(),
          ),
          (isLeft ? playlists.length % 2 == 0 : playlists.length % 2 != 0)
              ? const AddPlaylistCard()
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
