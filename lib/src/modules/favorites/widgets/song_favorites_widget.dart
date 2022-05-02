import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class SongFavotiresWidget extends StatelessWidget {
  const SongFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: _buildCard());
        }, childCount: 2),
      ),
    );
  }

  Widget _buildCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/3396/b467/b81be7b8995e49b98686d41bcbe6a1e4?Expires=1652659200&Signature=fOgf7pxYm1UuMRIpqZ0hA6ADz8vIElkgVt29aUbepHjkfu4hvwxyCTdrB-ad1c8m0HLh7NVxc0lkPwIw6tUtgAXGF9ZEUkzSCaMhFBoyFZQFrOiRccvNotdBKmX5M~RkTwpkPVTsNdGyoNGWf0XwNwQsQqdvpCWx-sSY2UEE73cxt-npqwSvD0gvE3jkpn0UIdzrTPN-~mp-UJspICeKhSHq1mVrMNmZh4cBqyaxRzfl3YfmNXIhPHBaMbLL0AX~yw9Grqz-5S~p4BGkBjRZT1HgWlUhmsaggqQBE9nkeQGVG-tM4f1PhJdVzTgJj013b6ZuZ8Fnv8G3RxrtGKbJKg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
            height: 70.0,
            width: 70.0,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
                text: 'Next To Me\n',
                style: Style.textTheme().titleMedium,
                children: [
                  TextSpan(
                      text: 'Otto Knows',
                      style: Style.textTheme()
                          .titleMedium!
                          .copyWith(color: MyColors.colorGray, fontSize: 17)),
                ]),
          ),
        )
      ],
    );
  }
}
