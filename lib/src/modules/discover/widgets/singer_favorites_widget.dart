import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/discover/logic/discover_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SingerFavotiresWidget extends StatelessWidget {
  const SingerFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        XHandle<List<XAudio>> _handle = state.items;
        if (_handle.isCompleted) {
          final List<XAudio> _items = _handle.data ?? [];

          return _items.isNotEmpty
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 20, 6),
                          child: _buildCard(_items[index]));
                    }, childCount: _items.length),
                  ),
                )
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            audio.image,
            gaplessPlayback: false,
            repeat: ImageRepeat.noRepeat,
            scale: 1.0,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CusText(
                title: audio.name,
                style: Style.textTheme().titleMedium,
              ),
              CusText(
                title: audio.author,
              ),
              const CusText(title: '2022'),
              const CusText(title: '1 track'),
            ],
          ),
        )
      ],
    );
  }
}
