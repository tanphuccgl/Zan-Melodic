import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/folder/widgets/list_folder_widget.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
      List<SongModel> _items = state.songs.data ?? [];
      return Scaffold(
        body: RefreshIndicator(
          color: MyColors.colorPrimary,
          backgroundColor: MyColors.colorWhite,
          onRefresh: () async => context.read<FolderBloc>().fetchListFolder(),
          child: Padding(
            padding: MyProperties.pPage,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: UpperControlBar(
                  onPressedPlay: () => context
                      .read<AudioHandleBloc>()
                      .skipToQueueItem(items: _items),
                )),
                const ListFolderWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
