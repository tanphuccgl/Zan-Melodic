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
            'https://s3-alpha-sig.figma.com/img/3396/b467/b81be7b8995e49b98686d41bcbe6a1e4?Expires=1651449600&Signature=dUkc5vmeOu8MuiCksGlXhf7qKB1UsL5kKFYXK9Vg3vyRbExbrSvqVGxUlzkHrPyzKXdF8v1~aaquaKV26YClq8OkWsJ2p2p5D2OfPxUu5pLEs-TtzAMwDy1pJyNGWJF~TBHkXl1YqjxIIJkDZNF8EYN3cnQPJcwSPCO8w4oakc9x7XwJPwrMEFh499C~9WrRUxJfCCkZKIsC4Y-YdUKYbkhsqpiUk3OQ6OSX0lCNQ8UeJXw8otnhcVwlve3qGd2RWPzi9tV-wmxA9ASvEV2KQ5XdaVAc-gbVcpCVIN653MhvG5C6w4MwzQshWg0W-NUI6eNFQVSmDsYkeMrwa1Ocwg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
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
