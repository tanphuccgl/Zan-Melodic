import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class PlaylistForSong extends StatelessWidget {
  const PlaylistForSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        List<MediaItem> _items = state.playlist;
        return _items.isNotEmpty
            ? SliverPadding(
                padding: const EdgeInsets.only(bottom: 90),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildCard(
                      media: _items[index],
                      onTap: () =>
                          context.read<AudioHandleBloc>().skipToQueueItem(
                                medias: _items,
                                index: index,
                              ),
                    );
                  }, childCount: _items.length),
                ),
              )
            : const XStateEmptyWidget();
      },
    );
  }
}

Widget _buildCard({required MediaItem media, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: SizedBox(
        height: 70,
        width: 70,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Row(
                  children: [
                    media.extras!['isFirebase'] == false
                        ? CustomImageWidget(
                            id: int.parse(media.id),
                            height: 70.0,
                            width: 70.0,
                          )
                        : ClipRRect(
                            borderRadius: MyProperties.borderRadius,
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              media.extras!['image'],
                              gaplessPlayback: false,
                              repeat: ImageRepeat.noRepeat,
                              scale: 1.0,
                              height: 70.0,
                              width: 70.0,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.low,
                            ),
                          ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${media.title}\n',
                            style: Style.textTheme().titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(media.artist ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Style.textTheme().titleMedium!.copyWith(
                                  fontSize: 17, color: MyColors.colorGray))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    ),
  );
}
