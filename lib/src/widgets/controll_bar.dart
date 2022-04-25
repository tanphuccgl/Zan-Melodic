import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class ControllBar extends StatelessWidget {
  const ControllBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(
                Icons.sort,
                color: MyColors.colorWhite,
              )),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon: const Icon(Icons.shuffle, color: MyColors.colorWhite)),
              IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon:
                      const Icon(Icons.play_arrow, color: MyColors.colorWhite))
            ],
          )
        ]),
      ),
    );
  }
}
