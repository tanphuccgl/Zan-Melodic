import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              backgroundColor: MyColors.colorBlack,
              stretch: true,
              pinned: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 320,
              expandedHeight: 374,
              stretchTriggerOffset: 10,
              onStretchTrigger: () {
                return a();
              },
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                print(constraints.maxHeight);
                var height = MediaQuery.of(context).viewPadding.top;
                print(height);
                bool isCollapsed = constraints.maxHeight < 374;
                return SafeArea(
                  child: Container(
                    color: isCollapsed
                        ? MyColors.colorBackground
                        : MyColors.colorBlack,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'More Than You Know',
                            style: Style.textTheme()
                                .displaySmall!
                                .copyWith(fontSize: 28),
                          ),
                          Text(
                            'Axwell Λ Ingrosso | 6 Tracks',
                            style: Style.textTheme().titleMedium!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: MyColors.colorGray),
                          ),
                          isCollapsed
                              ? const CustomImageWidget(
                                  id: 24,
                                  height: 190,
                                  width: double.infinity,
                                  artworkType: ArtworkType.ALBUM,
                                  isShadow: true,
                                )
                              : const CustomImageWidget(
                                  id: 24,
                                  height: 220,
                                  width: 220,
                                  artworkType: ArtworkType.ALBUM,
                                  isShadow: true,
                                ),
                          _upperControlBar()
                        ],
                      ),
                    ),
                  ),
                );
              })),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> a() async {}

  Widget _upperControlBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _customIconButton(icon: Icons.sort, onPressed: () {}),
          Row(
            children: [
              _customIconButton(icon: Icons.shuffle, onPressed: () {}),
              _customIconButton(
                icon: Icons.play_arrow,
                onPressed: () {},
              ),
            ],
          )
        ]),
      ),
    );
  }

  IconButton _customIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
        onPressed: onPressed,
        iconSize: 30,
        icon: Icon(icon, color: MyColors.colorWhite));
  }
}
