import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class UpperControlBar extends StatelessWidget {
  const UpperControlBar({
    Key? key,
    this.iconSort,
    this.iconShuffle,
    this.onPressedPlayer,
    this.onPressedShuffle,
    this.onPressedSort,
  }) : super(key: key);
  final VoidCallback? onPressedSort;
  final VoidCallback? onPressedShuffle;
  final VoidCallback? onPressedPlayer;
  final IconData? iconSort;
  final IconData? iconShuffle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _customIconButton(
              icon: iconSort ?? Icons.sort, onPressed: onPressedSort ?? () {}),
          Row(
            children: [
              _customIconButton(
                  icon: iconShuffle ?? Icons.shuffle,
                  onPressed: onPressedShuffle ?? () {}),
              _customIconButton(
                icon: Icons.play_arrow,
                onPressed: onPressedPlayer ?? () {},
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
