import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.transparent,
              stretch: true,
              pinned: true,
              expandedHeight: 400,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'More Than You Know',
                    style:
                        Style.textTheme().displaySmall!.copyWith(fontSize: 28),
                  ),
                  Text(
                    'Axwell Λ Ingrosso | 6 Tracks',
                    style: Style.textTheme().titleMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: MyColors.colorGray),
                  ),
                ],
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
