import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SingerFavotiresWidget extends StatelessWidget {
  const SingerFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final XHandle<List<FavoritesEntity>> _handle = state.items;
        if (_handle.isCompleted) {
          final List<FavoritesEntity> _items = _handle.data ?? [];

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

  Widget _buildCard(FavoritesEntity favoritesEntity) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageWidget(
          id: favoritesEntity.id,
          height: 120.0,
          width: 120.0,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: favoritesEntity.title,
                style: Style.textTheme().titleMedium,
              ),
              CustomText(
                title: favoritesEntity.artist ?? '',
              ),
              CustomText(
                  title: XUtils.getYear(favoritesEntity.dateAdded ?? -1)
                      .toString()),
              const CustomText(title: '1 track'),
            ],
          ),
        )
      ],
    );
  }
}
