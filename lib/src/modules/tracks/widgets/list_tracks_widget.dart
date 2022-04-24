import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class ListTracksWidget extends StatelessWidget {
  const ListTracksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: _buildCard()),
          childCount: 10),
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/3396/b467/b81be7b8995e49b98686d41bcbe6a1e4?Expires=1651449600&Signature=dUkc5vmeOu8MuiCksGlXhf7qKB1UsL5kKFYXK9Vg3vyRbExbrSvqVGxUlzkHrPyzKXdF8v1~aaquaKV26YClq8OkWsJ2p2p5D2OfPxUu5pLEs-TtzAMwDy1pJyNGWJF~TBHkXl1YqjxIIJkDZNF8EYN3cnQPJcwSPCO8w4oakc9x7XwJPwrMEFh499C~9WrRUxJfCCkZKIsC4Y-YdUKYbkhsqpiUk3OQ6OSX0lCNQ8UeJXw8otnhcVwlve3qGd2RWPzi9tV-wmxA9ASvEV2KQ5XdaVAc-gbVcpCVIN653MhvG5C6w4MwzQshWg0W-NUI6eNFQVSmDsYkeMrwa1Ocwg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                height: 70.0,
                width: 70.0,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Dreamer\n',
                  style: Style.textTheme().titleMedium,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Axwell Λ Ingrosso',
                        style: Style.textTheme()
                            .titleMedium!
                            .copyWith(fontSize: 17, color: MyColors.colorGray))
                  ]),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: MyColors.colorWhite,
              ),
              iconSize: 30,
            )
          ]),
    );
  }
}
