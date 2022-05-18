import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/discover/logic/discover_bloc.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class PlaylistDiscoverWidget extends StatelessWidget {
  const PlaylistDiscoverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        XHandle<List<XAudio>> _handle = state.items;
        if (_handle.isCompleted) {
          final List<XAudio> _items = _handle.data ?? [];

          return _items.isNotEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _buildCard(_items[index]))),
                      itemCount: _items.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ))
              : const XStateEmptyWidget();
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }

  Widget _buildCard(XAudio audio) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        audio.image,
        height: 114.0,
        width: 115.0,
        fit: BoxFit.fill,
      ),
    );
  }
}
