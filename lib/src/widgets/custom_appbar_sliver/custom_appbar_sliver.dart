import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class CustomAppBarSliver extends StatelessWidget {
  final Color colorBackgroundCollapsed;
  final double hExpanded;
  final double hToolbar;
  final ArtworkType artworkType;
  final String subTile;
  final String title;
  final int id;
  final Widget upperControlBar;
  const CustomAppBarSliver({
    Key? key,
    this.colorBackgroundCollapsed = MyColors.colorBackground,
    required this.id,
    required this.title,
    required this.artworkType,
    required this.hExpanded,
    required this.hToolbar,
    required this.upperControlBar,
    required this.subTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _hStatusBar = MediaQuery.of(context).viewPadding.top;

    return SliverAppBar(
        backgroundColor: MyColors.colorBlack,
        stretch: true,
        pinned: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: hToolbar,
        expandedHeight: hExpanded,
        flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          bool _isCollapsed = constraints.maxHeight < hExpanded + _hStatusBar;
          return SafeArea(
            child: Container(
              color:
                  _isCollapsed ? colorBackgroundCollapsed : MyColors.colorBlack,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        title,
                        style: Style.textTheme()
                            .displaySmall!
                            .copyWith(fontSize: 25),
                      ),
                    ),
                    Text(
                      subTile,
                      style: Style.textTheme().titleMedium!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: MyColors.colorGray),
                    ),
                    _isCollapsed
                        ? CustomImageWidget(
                            id: id,
                            height: 190,
                            width: double.infinity,
                            artworkType: artworkType,
                            isShadow: true,
                          )
                        : CustomImageWidget(
                            id: id,
                            height: 220,
                            width: 220,
                            artworkType: artworkType,
                            isShadow: true,
                          ),
                    Padding(padding: MyProperties.pPage, child: upperControlBar)
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
