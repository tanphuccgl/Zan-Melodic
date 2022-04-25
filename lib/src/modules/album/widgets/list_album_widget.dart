import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class ListAlbumWidget extends StatelessWidget {
  const ListAlbumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: _buildCard()),
          childCount: 10),
    );
  }

  Widget _buildCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/68b5/7f27/62678a2e0355e92c6653d1065a9fbcf9?Expires=1651449600&Signature=QLyf6Vx71xwW9MkgJqgNWGPIkAoXybPuZ-51EH4M1ga2~rMufPkWI-NymWUuUB4Jo2V1Z-4yy8uQ~HTZ09-QeXfENUTikxtmq0CLbdX5F23EoSfGrMWh-04UpBIjh32UTKbJPx-Q4xUZq~xG1mx1DplXldk-4Axmr5AoxSDdXL4i03qDvjXNmAi09PmoXp8WzoCK5MTWT9o0PVdcQSeic5L8VDs8e4uoDr41~EdiGgx~TMRH2~u9GswtA~hsQ~VAGaTm9EfT2JPoZx6mvWb5d-9VfSN6gVNQTqOprvx4qL3aXKJ1GY2HhJuS5XM9Qo6iaXSUK9O25W6O-CKBIX~qbg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
            height: 120.0,
            width: 120.0,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        RichText(
            text: TextSpan(
                text: 'Hybrid Theory\n',
                style: Style.textTheme().titleMedium,
                children: [
              _textGray('Linkin Park\n'),
              _textGray('2000\n'),
              _textGray('1 track'),
            ]))
      ],
    );
  }

  TextSpan _textGray(String title) {
    return TextSpan(
        text: title,
        style: Style.textTheme()
            .titleMedium!
            .copyWith(color: MyColors.colorGray, fontSize: 17, height: 1.23));
  }
}
