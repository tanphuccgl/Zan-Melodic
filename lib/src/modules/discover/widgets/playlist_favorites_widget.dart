import 'package:flutter/material.dart';

class PlaylistFavotiresWidget extends StatelessWidget {
  const PlaylistFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.only(right: 12), child: _buildCard())),
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    ));
  }

  Widget _buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        'https://s3-alpha-sig.figma.com/img/3396/b467/b81be7b8995e49b98686d41bcbe6a1e4?Expires=1652659200&Signature=fOgf7pxYm1UuMRIpqZ0hA6ADz8vIElkgVt29aUbepHjkfu4hvwxyCTdrB-ad1c8m0HLh7NVxc0lkPwIw6tUtgAXGF9ZEUkzSCaMhFBoyFZQFrOiRccvNotdBKmX5M~RkTwpkPVTsNdGyoNGWf0XwNwQsQqdvpCWx-sSY2UEE73cxt-npqwSvD0gvE3jkpn0UIdzrTPN-~mp-UJspICeKhSHq1mVrMNmZh4cBqyaxRzfl3YfmNXIhPHBaMbLL0AX~yw9Grqz-5S~p4BGkBjRZT1HgWlUhmsaggqQBE9nkeQGVG-tM4f1PhJdVzTgJj013b6ZuZ8Fnv8G3RxrtGKbJKg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        height: 114.0,
        width: 115.0,
        fit: BoxFit.fill,
      ),
    );
  }
}
