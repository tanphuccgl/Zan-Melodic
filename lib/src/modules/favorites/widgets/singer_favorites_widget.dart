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
            'https://s3-alpha-sig.figma.com/img/bc17/79c9/a6255ef26368f8e90996f40892b8b589?Expires=1651449600&Signature=bx5nQD~9VJJNMi4qpDAs~EwFKp-kvyaWzMtdG3yUJskKUjNWoNZgKnNBNCi0-RDb8G7MfTnjOPuBHinN01Nly5TTuOX4pwNNKafE1lzpy0meo2XzvKPTp2GFevCotIdgZ0DD~zjCGd8vuxGiW7U4xlJ4Bb791dhoVFy3taIIHgC7z8FDTBT56R11tp0MpfEOFO9H9xUOkWiy1fUDjh-Dsf7gaYQyAt2asLAyBa8y9n62fWSgfRir8TH8cIyJfYqHJGziBXQAgCyy5wRgIeqCwrt1x8FXsShEHpjR1XNBRiHWCNoRKUZu0SD~LSeCACuoC~iKtBYrrJ0b3QOzhrREjA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
            height: 120.0,
            width: 120.0,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Next To Me',
                style: Style.textTheme().titleMedium,
              ),
              _textGray('Otto Knows'),
              _textGray('2012'),
              _textGray('1 track'),
            ],
          ),
        ),
      ],
    );
  }

  Text _textGray(String title) {
    return Text(title,
        style: Style.textTheme()
            .titleMedium!
            .copyWith(color: MyColors.colorGray, fontSize: 17));
  }
}
