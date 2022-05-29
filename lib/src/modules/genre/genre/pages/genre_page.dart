import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/genre/genre/logic/genre_bloc.dart';
import 'package:zanmelodic/src/modules/genre/genre/widgets/genres_widget.dart';
import 'package:zanmelodic/src/modules/permission/pages/access_permission.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        final XHandle<List<GenreModel>> _handle = state.items;
        final List<GenreModel> _items = _handle.data ?? [];

        return BaseScaffold<GenreModel>(
          handle: _handle,
          onRefresh: () async => context.read<GenreBloc>().fetchListOfGenre(),
          child: Padding(
            padding: MyProperties.pPage,
            child: AccessPermission(
              widget: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: UpperControlBar()),
                  GenresWidget(genre: _items),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
