import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class SingerFavotiresWidget extends StatelessWidget {
  const SingerFavotiresWidget({Key? key}) : super(key: key);

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
            'https://s3-alpha-sig.figma.com/img/bc17/79c9/a6255ef26368f8e90996f40892b8b589?Expires=1652659200&Signature=MYUt-n~bt5OG9M9miwqETdm1rGFDt0YHh1to40hV4ae-I1DCg9u4OnTh9qjJLnZOhom6wh7nlQBpyzukTjbva4LOYYpwnQv9P-~3xAXB8D9jeFQy09LppQ8FW3mH0oW-v0dGRnAM7WG-QOiaSIF26tlBL~GmdDb9QyF9Pw-7bvFtYkvGd9joW7CvuLCu8EEi1aQtL0pS1qEjwMc41FgIN8pBGDOj3-9Sa5heFfUoq6sBqfK-uyL0ppQvXwWWosUTYUUF-JMsykHZuGMeD3SG6vvSJKW3rReXL1ocsb~PuDOrt6pLF17DK-AQ00MDUQGUZgjW834FUchXNpruaPUTGg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
            height: 120.0,
            width: 120.0,
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
                  _textGray('Otto Knows\n'),
                  _textGray('2012\n'),
                  _textGray('1 track'),
                ]),
          ),
        )
      ],
    );
  }

  TextSpan _textGray(String title) {
    return TextSpan(
        text: title,
        style: Style.textTheme()
            .titleMedium!
            .copyWith(color: MyColors.colorGray, fontSize: 17));
  }
}
