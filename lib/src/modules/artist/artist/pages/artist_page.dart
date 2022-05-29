import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/artist/artist/logic/artist_bloc.dart';
import 'package:zanmelodic/src/modules/artist/artist/widgets/artists_widget.dart';
import 'package:zanmelodic/src/modules/dashboard/logic/access_permission.dart';

import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class ArtistPage extends StatelessWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistBloc, ArtistState>(
      builder: (context, state) {
        final XHandle<List<ArtistModel>> _handle = state.items;
        final List<ArtistModel> _items = _handle.data ?? [];

        return BaseScaffold<ArtistModel>(
          handle: _handle,
          onRefresh: () async => context.read<ArtistBloc>().fetchListOfArtist(),
          child: Padding(
            padding: MyProperties.pPage,
            child: AccessPermission(
              widget: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: UpperControlBar()),
                  ArtistsWidget(artist: _items),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
