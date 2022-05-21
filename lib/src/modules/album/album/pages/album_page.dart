import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/widgets/list_album_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        final XHandle<List<AlbumModel>> _handle = state.items;
        final List<AlbumModel> _items = _handle.data ?? [];

        return BaseScaffold<AlbumModel>(
          handle: _handle,
          onRefresh: () => context.read<AlbumBloc>().fetchListOfAlbums(),
          child: Padding(
            padding: MyProperties.pPage,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: UpperControlBar()),
                ListAlbumWidget(albums: _items),
              ],
            ),
          ),
        );
      },
    );
  }
}
