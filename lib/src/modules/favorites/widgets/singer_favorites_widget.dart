import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

import '../../../models/handle.dart';

class SingerFavotiresWidget extends StatelessWidget {
  const SingerFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        XHandle<List<FavoritesEntity>> _handle = state.songs;
        if (_handle.isCompleted) {
          _handle = XHandle.result(XResult.success(state.songs.data ?? []));
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
        SizedBox(
          width: 120,
          child: CustomImageWidget(
            id: favoritesEntity.id,
            height: 120.0,
            width: 120.0,
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
              _customText(
                title: favoritesEntity.title,
                style: Style.textTheme().titleMedium,
              ),
              _customText(
                title: favoritesEntity.artist ?? '',
              ),
              _customText(
                  title: XUtils.getYear(favoritesEntity.dateAdded ?? -1)
                      .toString()),
              _customText(title: '1 track'),
            ],
          ),
        )
      ],
    );
  }

  Text _customText({required String title, TextStyle? style}) {
    return Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style ??
            Style.textTheme().titleMedium!.copyWith(
                color: MyColors.colorGray, fontSize: 17, height: 1.23));
  }
}
